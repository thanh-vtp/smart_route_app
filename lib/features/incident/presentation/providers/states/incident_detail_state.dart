import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';

part 'incident_detail_state.freezed.dart';

enum UserVoteType { upvote, downvote, none }

@freezed
abstract class IncidentDetailState with _$IncidentDetailState {
  const factory IncidentDetailState({
    @Default(true) bool isLoading,
    Incident? incident,
    @Default(false) bool isOwner, // Có phải người tạo báo cáo không
    String? reporterName,
    String? reporterAvatarUrl,
    String? errorMessage,

    // Trạng thái khi bấm nút "Đã giải quyết"
    @Default(false) bool isResolving,
    @Default(false) bool isResolveSuccess,

    // Trạng thái khi bấm nút Upvote/Downvote
    @Default(UserVoteType.none) UserVoteType currentVote,
    @Default(false) bool isVoting,

    @Default(0) int reporterReputationScore,
  }) = _IncidentDetailState;
}
