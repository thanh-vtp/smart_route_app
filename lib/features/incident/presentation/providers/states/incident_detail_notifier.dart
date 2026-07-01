import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/map_drawing/state/incidents_provider.dart';
import 'package:smart_route_app/common/constants/supabase.dart';
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/usecases/use_case_providers.dart';

import 'incident_detail_state.dart';

part 'incident_detail_notifier.g.dart';

@riverpod
class IncidentDetailNotifier extends _$IncidentDetailNotifier {
  @override
  IncidentDetailState build(String incidentId) {
    // Tự động fetch data khi BottomSheet mở lên
    Future.microtask(() => fetchIncidentDetail());
    return const IncidentDetailState();
  }

  Future<void> fetchIncidentDetail() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final getDetailUsecase = ref.read(getIncidentDetailUsecaseProvider);
      final result = await getDetailUsecase(incidentId);

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          );
        },
        (incident) async {
          // Kiểm tra xem user hiện tại có phải người tạo báo cáo không
          final currentUser = ref.read(getCurrentUserUsecaseProvider).call();
          final isOwner =
              currentUser.isNotEmpty && currentUser.id == incident.reportedBy;

          String? reporterName;
          String? reporterAvatar;
          UserVoteType currentVote = UserVoteType.none;
          int reporterScore = 0;

          if (incident.reportedBy != null) {
            try {
              final userResponse = await supabase
                  .from('users')
                  .select('display_name, avatar_url, reputation_score')
                  .eq('id', incident.reportedBy!)
                  .maybeSingle();

              if (userResponse != null) {
                reporterName = userResponse['display_name'];
                reporterAvatar = userResponse['avatar_url'];
                reporterScore = userResponse['reputation_score'] ?? 0;
              }
            } catch (e) {
              // Bỏ qua lỗi, UI sẽ tự động dùng ảnh mặc định (Icons.person)
            }
          }

          // Nếu là owner thì ưu tiên lấy thông tin từ currentUser
          if (isOwner) {
            reporterName = currentUser.displayName;
            reporterAvatar = currentUser.avatarUrl;
          }

          // Kiểm tra xem user hiện tại đã vote chưa (và nếu có thì là upvote hay downvote)
          if (currentUser.isNotEmpty) {
            try {
              final voteRes = await supabase
                  .from('incident_votes')
                  .select('vote')
                  .eq('incident_id', incidentId)
                  .eq('user_id', currentUser.id)
                  .maybeSingle();

              if (voteRes != null) {
                currentVote = voteRes['vote'] == 'upvote'
                    ? UserVoteType.upvote
                    : UserVoteType.downvote;
              }
            } catch (_) {}
          }

          state = state.copyWith(
            isLoading: false,
            incident: incident,
            isOwner: isOwner,
            reporterName: reporterName,
            reporterAvatarUrl: reporterAvatar,
            currentVote: currentVote,
            reporterReputationScore: reporterScore,
          );

          AppLogger.ui(
            "[State]: '${state.isLoading}, ${state.incident}, ${state.isOwner}, ${state.reporterName}, ${state.reporterAvatarUrl}, ${state.currentVote}, ${state.reporterReputationScore}'",
            error: "[STATE]: fetchIncidentDetail",
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Lỗi không xác định',
      );
    }
  }

  // Hàm đánh giá xác nhận/bỏ đánh giá sự cố (Upvote/Downvote) cho người dùng
  Future<void> submitVote(UserVoteType voteType) async {
    final currentIncident = state.incident;
    if (currentIncident == null || state.isOwner) return;

    // 1. Tính toán nhẩm dữ liệu mới ngay trên App
    int newUpvotes = currentIncident.upvotes;
    int newDownvotes = currentIncident.downvotes;
    UserVoteType newVoteState;

    final String voteString = voteType == UserVoteType.upvote
        ? 'upvote'
        : 'downvote';

    // Nếu bấm trùng nút cũ -> Tự hiểu là HỦY VOTE
    if (state.currentVote == voteType) {
      newVoteState = UserVoteType.none;
      if (voteType == UserVoteType.upvote) {
        newUpvotes--;
      } else {
        newDownvotes--;
      }
    }
    // Nếu đổi Vote hoặc Vote lần đầu
    else {
      newVoteState = voteType;
      if (voteType == UserVoteType.upvote) {
        newUpvotes++;
        if (state.currentVote == UserVoteType.downvote) {
          newDownvotes--; // Trừ cái cũ đi
        }
      } else {
        newDownvotes++;
        if (state.currentVote == UserVoteType.upvote) {
          newUpvotes--; // Trừ cái cũ đi
        }
      }
    }

    // Đảm bảo không bị số âm
    if (newUpvotes < 0) newUpvotes = 0;
    if (newDownvotes < 0) newDownvotes = 0;

    // Tính toán trạng thái status
    String newStatus = currentIncident.status;

    // Chỉ xét chuyển trạng thái nếu sự cố chưa bị 'resolved'
    if (newStatus != 'resolved') {
      // Nếu thỏa mãn điều kiện Fake
      if (newDownvotes >= 3 && newDownvotes > (newUpvotes * 2)) {
        newStatus = 'fake';
      }
      // Nếu được upvote lại cứu vãn tình hình
      else {
        newStatus = 'active';
      }
    }

    // 2. Cập nhật UI NGAY LẬP TỨC
    state = state.copyWith(
      isVoting: true, // Vẫn hiện loading xíu cho vui mắt
      currentVote: newVoteState,
      incident: currentIncident.copyWith(
        upvotes: newUpvotes,
        downvotes: newDownvotes,
        status: newStatus,
      ),
    );

    // 3. Gọi Supabase chạy ngầm
    try {
      await supabase.rpc(
        'cast_vote',
        params: {
          'p_incident_id': currentIncident.id,
          'p_vote_type': voteString,
        },
      );

      // Thành công thì tắt vòng quay
      state = state.copyWith(isVoting: false);

      // await fetchIncidentDetail();
    } catch (e) {
      // 4. NẾU LỖI: Rollback lại trạng thái ban đầu và báo lỗi
      state = state.copyWith(
        isVoting: false,
        currentVote: state.currentVote, // Trả lại vote cũ
        incident: currentIncident, // Trả lại số lượng cũ
        errorMessage: 'Lỗi khi gửi đánh giá. Vui lòng thử lại.',
      );
    }
  }

  /// Hàm đánh dấu sự cố đã được giải quyết (Chỉ Owner mới gọi được)
  Future<void> resolveIncident() async {
    final currentIncident = state.incident;
    if (currentIncident == null || !state.isOwner) return;

    state = state.copyWith(isResolving: true);

    // Đổi status thành 'resolved'
    final resolvedIncident = currentIncident.copyWith(status: 'resolved');

    final updateUsecase = ref.read(updateIncidentUsecaseProvider);
    final result = await updateUsecase(resolvedIncident);

    result.fold(
      (failure) {
        state = state.copyWith(
          isResolving: false,
          errorMessage: failure.message,
        );
      },
      (success) {
        // Cập nhật lại UI map (xóa marker khỏi map vì đã resolved)
        ref.read(incidentsProvider.notifier).removeIncident(incidentId);

        state = state.copyWith(
          isResolving: false,
          isResolveSuccess: true, // Báo cho UI đóng BottomSheet
        );
      },
    );
  }
}
