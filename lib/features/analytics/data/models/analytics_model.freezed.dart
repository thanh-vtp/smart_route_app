// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyticsModel _$AnalyticsModelFromJson(Map<String, dynamic> json) {
  return _AnalyticsModel.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsModel {
  @JsonKey(name: 'reputation_score')
  int get reputationScore =>
      throw _privateConstructorUsedError; // Thống kê Báo cáo
  @JsonKey(name: 'total_reports')
  int get totalReports => throw _privateConstructorUsedError;
  @JsonKey(name: 'reports_change_percent')
  double get reportsChangePercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'reports_direction')
  String get reportsDirection =>
      throw _privateConstructorUsedError; // Thống kê Upvote
  @JsonKey(name: 'total_upvotes')
  int get totalUpvotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'upvotes_change_percent')
  double get upvotesChangePercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'upvotes_direction')
  String get upvotesDirection =>
      throw _privateConstructorUsedError; // Thống kê Xác nhận (Tỷ lệ)
  @JsonKey(name: 'total_downvotes')
  int get totalDownvotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_rate')
  double get confirmationRate =>
      throw _privateConstructorUsedError; // Mảng phân bổ sự cố
  @JsonKey(name: 'distribution_total')
  int get distributionTotal => throw _privateConstructorUsedError;
  List<IncidentChartDataModel> get distribution =>
      throw _privateConstructorUsedError; // Mảng hoạt động gần đây
  @JsonKey(name: 'recent_activities')
  List<ActivityItemModel> get recentActivities =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsModelCopyWith<AnalyticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsModelCopyWith<$Res> {
  factory $AnalyticsModelCopyWith(
          AnalyticsModel value, $Res Function(AnalyticsModel) then) =
      _$AnalyticsModelCopyWithImpl<$Res, AnalyticsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reputation_score') int reputationScore,
      @JsonKey(name: 'total_reports') int totalReports,
      @JsonKey(name: 'reports_change_percent') double reportsChangePercent,
      @JsonKey(name: 'reports_direction') String reportsDirection,
      @JsonKey(name: 'total_upvotes') int totalUpvotes,
      @JsonKey(name: 'upvotes_change_percent') double upvotesChangePercent,
      @JsonKey(name: 'upvotes_direction') String upvotesDirection,
      @JsonKey(name: 'total_downvotes') int totalDownvotes,
      @JsonKey(name: 'confirmation_rate') double confirmationRate,
      @JsonKey(name: 'distribution_total') int distributionTotal,
      List<IncidentChartDataModel> distribution,
      @JsonKey(name: 'recent_activities')
      List<ActivityItemModel> recentActivities});
}

/// @nodoc
class _$AnalyticsModelCopyWithImpl<$Res, $Val extends AnalyticsModel>
    implements $AnalyticsModelCopyWith<$Res> {
  _$AnalyticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reputationScore = null,
    Object? totalReports = null,
    Object? reportsChangePercent = null,
    Object? reportsDirection = null,
    Object? totalUpvotes = null,
    Object? upvotesChangePercent = null,
    Object? upvotesDirection = null,
    Object? totalDownvotes = null,
    Object? confirmationRate = null,
    Object? distributionTotal = null,
    Object? distribution = null,
    Object? recentActivities = null,
  }) {
    return _then(_value.copyWith(
      reputationScore: null == reputationScore
          ? _value.reputationScore
          : reputationScore // ignore: cast_nullable_to_non_nullable
              as int,
      totalReports: null == totalReports
          ? _value.totalReports
          : totalReports // ignore: cast_nullable_to_non_nullable
              as int,
      reportsChangePercent: null == reportsChangePercent
          ? _value.reportsChangePercent
          : reportsChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
      reportsDirection: null == reportsDirection
          ? _value.reportsDirection
          : reportsDirection // ignore: cast_nullable_to_non_nullable
              as String,
      totalUpvotes: null == totalUpvotes
          ? _value.totalUpvotes
          : totalUpvotes // ignore: cast_nullable_to_non_nullable
              as int,
      upvotesChangePercent: null == upvotesChangePercent
          ? _value.upvotesChangePercent
          : upvotesChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
      upvotesDirection: null == upvotesDirection
          ? _value.upvotesDirection
          : upvotesDirection // ignore: cast_nullable_to_non_nullable
              as String,
      totalDownvotes: null == totalDownvotes
          ? _value.totalDownvotes
          : totalDownvotes // ignore: cast_nullable_to_non_nullable
              as int,
      confirmationRate: null == confirmationRate
          ? _value.confirmationRate
          : confirmationRate // ignore: cast_nullable_to_non_nullable
              as double,
      distributionTotal: null == distributionTotal
          ? _value.distributionTotal
          : distributionTotal // ignore: cast_nullable_to_non_nullable
              as int,
      distribution: null == distribution
          ? _value.distribution
          : distribution // ignore: cast_nullable_to_non_nullable
              as List<IncidentChartDataModel>,
      recentActivities: null == recentActivities
          ? _value.recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<ActivityItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsModelImplCopyWith<$Res>
    implements $AnalyticsModelCopyWith<$Res> {
  factory _$$AnalyticsModelImplCopyWith(_$AnalyticsModelImpl value,
          $Res Function(_$AnalyticsModelImpl) then) =
      __$$AnalyticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reputation_score') int reputationScore,
      @JsonKey(name: 'total_reports') int totalReports,
      @JsonKey(name: 'reports_change_percent') double reportsChangePercent,
      @JsonKey(name: 'reports_direction') String reportsDirection,
      @JsonKey(name: 'total_upvotes') int totalUpvotes,
      @JsonKey(name: 'upvotes_change_percent') double upvotesChangePercent,
      @JsonKey(name: 'upvotes_direction') String upvotesDirection,
      @JsonKey(name: 'total_downvotes') int totalDownvotes,
      @JsonKey(name: 'confirmation_rate') double confirmationRate,
      @JsonKey(name: 'distribution_total') int distributionTotal,
      List<IncidentChartDataModel> distribution,
      @JsonKey(name: 'recent_activities')
      List<ActivityItemModel> recentActivities});
}

/// @nodoc
class __$$AnalyticsModelImplCopyWithImpl<$Res>
    extends _$AnalyticsModelCopyWithImpl<$Res, _$AnalyticsModelImpl>
    implements _$$AnalyticsModelImplCopyWith<$Res> {
  __$$AnalyticsModelImplCopyWithImpl(
      _$AnalyticsModelImpl _value, $Res Function(_$AnalyticsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reputationScore = null,
    Object? totalReports = null,
    Object? reportsChangePercent = null,
    Object? reportsDirection = null,
    Object? totalUpvotes = null,
    Object? upvotesChangePercent = null,
    Object? upvotesDirection = null,
    Object? totalDownvotes = null,
    Object? confirmationRate = null,
    Object? distributionTotal = null,
    Object? distribution = null,
    Object? recentActivities = null,
  }) {
    return _then(_$AnalyticsModelImpl(
      reputationScore: null == reputationScore
          ? _value.reputationScore
          : reputationScore // ignore: cast_nullable_to_non_nullable
              as int,
      totalReports: null == totalReports
          ? _value.totalReports
          : totalReports // ignore: cast_nullable_to_non_nullable
              as int,
      reportsChangePercent: null == reportsChangePercent
          ? _value.reportsChangePercent
          : reportsChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
      reportsDirection: null == reportsDirection
          ? _value.reportsDirection
          : reportsDirection // ignore: cast_nullable_to_non_nullable
              as String,
      totalUpvotes: null == totalUpvotes
          ? _value.totalUpvotes
          : totalUpvotes // ignore: cast_nullable_to_non_nullable
              as int,
      upvotesChangePercent: null == upvotesChangePercent
          ? _value.upvotesChangePercent
          : upvotesChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
      upvotesDirection: null == upvotesDirection
          ? _value.upvotesDirection
          : upvotesDirection // ignore: cast_nullable_to_non_nullable
              as String,
      totalDownvotes: null == totalDownvotes
          ? _value.totalDownvotes
          : totalDownvotes // ignore: cast_nullable_to_non_nullable
              as int,
      confirmationRate: null == confirmationRate
          ? _value.confirmationRate
          : confirmationRate // ignore: cast_nullable_to_non_nullable
              as double,
      distributionTotal: null == distributionTotal
          ? _value.distributionTotal
          : distributionTotal // ignore: cast_nullable_to_non_nullable
              as int,
      distribution: null == distribution
          ? _value._distribution
          : distribution // ignore: cast_nullable_to_non_nullable
              as List<IncidentChartDataModel>,
      recentActivities: null == recentActivities
          ? _value._recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<ActivityItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsModelImpl extends _AnalyticsModel {
  const _$AnalyticsModelImpl(
      {@JsonKey(name: 'reputation_score') this.reputationScore = 0,
      @JsonKey(name: 'total_reports') this.totalReports = 0,
      @JsonKey(name: 'reports_change_percent') this.reportsChangePercent = 0.0,
      @JsonKey(name: 'reports_direction') this.reportsDirection = 'flat',
      @JsonKey(name: 'total_upvotes') this.totalUpvotes = 0,
      @JsonKey(name: 'upvotes_change_percent') this.upvotesChangePercent = 0.0,
      @JsonKey(name: 'upvotes_direction') this.upvotesDirection = 'flat',
      @JsonKey(name: 'total_downvotes') this.totalDownvotes = 0,
      @JsonKey(name: 'confirmation_rate') this.confirmationRate = 0.0,
      @JsonKey(name: 'distribution_total') this.distributionTotal = 0,
      final List<IncidentChartDataModel> distribution = const [],
      @JsonKey(name: 'recent_activities')
      final List<ActivityItemModel> recentActivities = const []})
      : _distribution = distribution,
        _recentActivities = recentActivities,
        super._();

  factory _$AnalyticsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsModelImplFromJson(json);

  @override
  @JsonKey(name: 'reputation_score')
  final int reputationScore;
// Thống kê Báo cáo
  @override
  @JsonKey(name: 'total_reports')
  final int totalReports;
  @override
  @JsonKey(name: 'reports_change_percent')
  final double reportsChangePercent;
  @override
  @JsonKey(name: 'reports_direction')
  final String reportsDirection;
// Thống kê Upvote
  @override
  @JsonKey(name: 'total_upvotes')
  final int totalUpvotes;
  @override
  @JsonKey(name: 'upvotes_change_percent')
  final double upvotesChangePercent;
  @override
  @JsonKey(name: 'upvotes_direction')
  final String upvotesDirection;
// Thống kê Xác nhận (Tỷ lệ)
  @override
  @JsonKey(name: 'total_downvotes')
  final int totalDownvotes;
  @override
  @JsonKey(name: 'confirmation_rate')
  final double confirmationRate;
// Mảng phân bổ sự cố
  @override
  @JsonKey(name: 'distribution_total')
  final int distributionTotal;
  final List<IncidentChartDataModel> _distribution;
  @override
  @JsonKey()
  List<IncidentChartDataModel> get distribution {
    if (_distribution is EqualUnmodifiableListView) return _distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_distribution);
  }

// Mảng hoạt động gần đây
  final List<ActivityItemModel> _recentActivities;
// Mảng hoạt động gần đây
  @override
  @JsonKey(name: 'recent_activities')
  List<ActivityItemModel> get recentActivities {
    if (_recentActivities is EqualUnmodifiableListView)
      return _recentActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentActivities);
  }

  @override
  String toString() {
    return 'AnalyticsModel(reputationScore: $reputationScore, totalReports: $totalReports, reportsChangePercent: $reportsChangePercent, reportsDirection: $reportsDirection, totalUpvotes: $totalUpvotes, upvotesChangePercent: $upvotesChangePercent, upvotesDirection: $upvotesDirection, totalDownvotes: $totalDownvotes, confirmationRate: $confirmationRate, distributionTotal: $distributionTotal, distribution: $distribution, recentActivities: $recentActivities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsModelImpl &&
            (identical(other.reputationScore, reputationScore) ||
                other.reputationScore == reputationScore) &&
            (identical(other.totalReports, totalReports) ||
                other.totalReports == totalReports) &&
            (identical(other.reportsChangePercent, reportsChangePercent) ||
                other.reportsChangePercent == reportsChangePercent) &&
            (identical(other.reportsDirection, reportsDirection) ||
                other.reportsDirection == reportsDirection) &&
            (identical(other.totalUpvotes, totalUpvotes) ||
                other.totalUpvotes == totalUpvotes) &&
            (identical(other.upvotesChangePercent, upvotesChangePercent) ||
                other.upvotesChangePercent == upvotesChangePercent) &&
            (identical(other.upvotesDirection, upvotesDirection) ||
                other.upvotesDirection == upvotesDirection) &&
            (identical(other.totalDownvotes, totalDownvotes) ||
                other.totalDownvotes == totalDownvotes) &&
            (identical(other.confirmationRate, confirmationRate) ||
                other.confirmationRate == confirmationRate) &&
            (identical(other.distributionTotal, distributionTotal) ||
                other.distributionTotal == distributionTotal) &&
            const DeepCollectionEquality()
                .equals(other._distribution, _distribution) &&
            const DeepCollectionEquality()
                .equals(other._recentActivities, _recentActivities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reputationScore,
      totalReports,
      reportsChangePercent,
      reportsDirection,
      totalUpvotes,
      upvotesChangePercent,
      upvotesDirection,
      totalDownvotes,
      confirmationRate,
      distributionTotal,
      const DeepCollectionEquality().hash(_distribution),
      const DeepCollectionEquality().hash(_recentActivities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsModelImplCopyWith<_$AnalyticsModelImpl> get copyWith =>
      __$$AnalyticsModelImplCopyWithImpl<_$AnalyticsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsModelImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsModel extends AnalyticsModel {
  const factory _AnalyticsModel(
      {@JsonKey(name: 'reputation_score') final int reputationScore,
      @JsonKey(name: 'total_reports') final int totalReports,
      @JsonKey(name: 'reports_change_percent')
      final double reportsChangePercent,
      @JsonKey(name: 'reports_direction') final String reportsDirection,
      @JsonKey(name: 'total_upvotes') final int totalUpvotes,
      @JsonKey(name: 'upvotes_change_percent')
      final double upvotesChangePercent,
      @JsonKey(name: 'upvotes_direction') final String upvotesDirection,
      @JsonKey(name: 'total_downvotes') final int totalDownvotes,
      @JsonKey(name: 'confirmation_rate') final double confirmationRate,
      @JsonKey(name: 'distribution_total') final int distributionTotal,
      final List<IncidentChartDataModel> distribution,
      @JsonKey(name: 'recent_activities')
      final List<ActivityItemModel> recentActivities}) = _$AnalyticsModelImpl;
  const _AnalyticsModel._() : super._();

  factory _AnalyticsModel.fromJson(Map<String, dynamic> json) =
      _$AnalyticsModelImpl.fromJson;

  @override
  @JsonKey(name: 'reputation_score')
  int get reputationScore;
  @override // Thống kê Báo cáo
  @JsonKey(name: 'total_reports')
  int get totalReports;
  @override
  @JsonKey(name: 'reports_change_percent')
  double get reportsChangePercent;
  @override
  @JsonKey(name: 'reports_direction')
  String get reportsDirection;
  @override // Thống kê Upvote
  @JsonKey(name: 'total_upvotes')
  int get totalUpvotes;
  @override
  @JsonKey(name: 'upvotes_change_percent')
  double get upvotesChangePercent;
  @override
  @JsonKey(name: 'upvotes_direction')
  String get upvotesDirection;
  @override // Thống kê Xác nhận (Tỷ lệ)
  @JsonKey(name: 'total_downvotes')
  int get totalDownvotes;
  @override
  @JsonKey(name: 'confirmation_rate')
  double get confirmationRate;
  @override // Mảng phân bổ sự cố
  @JsonKey(name: 'distribution_total')
  int get distributionTotal;
  @override
  List<IncidentChartDataModel> get distribution;
  @override // Mảng hoạt động gần đây
  @JsonKey(name: 'recent_activities')
  List<ActivityItemModel> get recentActivities;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsModelImplCopyWith<_$AnalyticsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IncidentChartDataModel _$IncidentChartDataModelFromJson(
    Map<String, dynamic> json) {
  return _IncidentChartDataModel.fromJson(json);
}

/// @nodoc
mixin _$IncidentChartDataModel {
  String get type => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncidentChartDataModelCopyWith<IncidentChartDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentChartDataModelCopyWith<$Res> {
  factory $IncidentChartDataModelCopyWith(IncidentChartDataModel value,
          $Res Function(IncidentChartDataModel) then) =
      _$IncidentChartDataModelCopyWithImpl<$Res, IncidentChartDataModel>;
  @useResult
  $Res call({String type, int count});
}

/// @nodoc
class _$IncidentChartDataModelCopyWithImpl<$Res,
        $Val extends IncidentChartDataModel>
    implements $IncidentChartDataModelCopyWith<$Res> {
  _$IncidentChartDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncidentChartDataModelImplCopyWith<$Res>
    implements $IncidentChartDataModelCopyWith<$Res> {
  factory _$$IncidentChartDataModelImplCopyWith(
          _$IncidentChartDataModelImpl value,
          $Res Function(_$IncidentChartDataModelImpl) then) =
      __$$IncidentChartDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, int count});
}

/// @nodoc
class __$$IncidentChartDataModelImplCopyWithImpl<$Res>
    extends _$IncidentChartDataModelCopyWithImpl<$Res,
        _$IncidentChartDataModelImpl>
    implements _$$IncidentChartDataModelImplCopyWith<$Res> {
  __$$IncidentChartDataModelImplCopyWithImpl(
      _$IncidentChartDataModelImpl _value,
      $Res Function(_$IncidentChartDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? count = null,
  }) {
    return _then(_$IncidentChartDataModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncidentChartDataModelImpl extends _IncidentChartDataModel {
  const _$IncidentChartDataModelImpl({required this.type, this.count = 0})
      : super._();

  factory _$IncidentChartDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncidentChartDataModelImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'IncidentChartDataModel(type: $type, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentChartDataModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentChartDataModelImplCopyWith<_$IncidentChartDataModelImpl>
      get copyWith => __$$IncidentChartDataModelImplCopyWithImpl<
          _$IncidentChartDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncidentChartDataModelImplToJson(
      this,
    );
  }
}

abstract class _IncidentChartDataModel extends IncidentChartDataModel {
  const factory _IncidentChartDataModel(
      {required final String type,
      final int count}) = _$IncidentChartDataModelImpl;
  const _IncidentChartDataModel._() : super._();

  factory _IncidentChartDataModel.fromJson(Map<String, dynamic> json) =
      _$IncidentChartDataModelImpl.fromJson;

  @override
  String get type;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$IncidentChartDataModelImplCopyWith<_$IncidentChartDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ActivityItemModel _$ActivityItemModelFromJson(Map<String, dynamic> json) {
  return _ActivityItemModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityItemModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_type')
  String get actionType => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError; // tô màu icon
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  int get upvotes => throw _privateConstructorUsedError;
  int get downvotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'earned_points')
  int get earnedPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityItemModelCopyWith<ActivityItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityItemModelCopyWith<$Res> {
  factory $ActivityItemModelCopyWith(
          ActivityItemModel value, $Res Function(ActivityItemModel) then) =
      _$ActivityItemModelCopyWithImpl<$Res, ActivityItemModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'action_type') String actionType,
      String severity,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      double lat,
      double lng,
      int upvotes,
      int downvotes,
      @JsonKey(name: 'earned_points') int earnedPoints});
}

/// @nodoc
class _$ActivityItemModelCopyWithImpl<$Res, $Val extends ActivityItemModel>
    implements $ActivityItemModelCopyWith<$Res> {
  _$ActivityItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionType = null,
    Object? severity = null,
    Object? createdAt = freezed,
    Object? lat = null,
    Object? lng = null,
    Object? upvotes = null,
    Object? downvotes = null,
    Object? earnedPoints = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      upvotes: null == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as int,
      downvotes: null == downvotes
          ? _value.downvotes
          : downvotes // ignore: cast_nullable_to_non_nullable
              as int,
      earnedPoints: null == earnedPoints
          ? _value.earnedPoints
          : earnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityItemModelImplCopyWith<$Res>
    implements $ActivityItemModelCopyWith<$Res> {
  factory _$$ActivityItemModelImplCopyWith(_$ActivityItemModelImpl value,
          $Res Function(_$ActivityItemModelImpl) then) =
      __$$ActivityItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'action_type') String actionType,
      String severity,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      double lat,
      double lng,
      int upvotes,
      int downvotes,
      @JsonKey(name: 'earned_points') int earnedPoints});
}

/// @nodoc
class __$$ActivityItemModelImplCopyWithImpl<$Res>
    extends _$ActivityItemModelCopyWithImpl<$Res, _$ActivityItemModelImpl>
    implements _$$ActivityItemModelImplCopyWith<$Res> {
  __$$ActivityItemModelImplCopyWithImpl(_$ActivityItemModelImpl _value,
      $Res Function(_$ActivityItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionType = null,
    Object? severity = null,
    Object? createdAt = freezed,
    Object? lat = null,
    Object? lng = null,
    Object? upvotes = null,
    Object? downvotes = null,
    Object? earnedPoints = null,
  }) {
    return _then(_$ActivityItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      upvotes: null == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as int,
      downvotes: null == downvotes
          ? _value.downvotes
          : downvotes // ignore: cast_nullable_to_non_nullable
              as int,
      earnedPoints: null == earnedPoints
          ? _value.earnedPoints
          : earnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityItemModelImpl extends _ActivityItemModel {
  const _$ActivityItemModelImpl(
      {required this.id,
      @JsonKey(name: 'action_type') required this.actionType,
      this.severity = 'low',
      @JsonKey(name: 'created_at') this.createdAt,
      this.lat = 0.0,
      this.lng = 0.0,
      this.upvotes = 0,
      this.downvotes = 0,
      @JsonKey(name: 'earned_points') this.earnedPoints = 0})
      : super._();

  factory _$ActivityItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityItemModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'action_type')
  final String actionType;
  @override
  @JsonKey()
  final String severity;
// tô màu icon
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lng;
  @override
  @JsonKey()
  final int upvotes;
  @override
  @JsonKey()
  final int downvotes;
  @override
  @JsonKey(name: 'earned_points')
  final int earnedPoints;

  @override
  String toString() {
    return 'ActivityItemModel(id: $id, actionType: $actionType, severity: $severity, createdAt: $createdAt, lat: $lat, lng: $lng, upvotes: $upvotes, downvotes: $downvotes, earnedPoints: $earnedPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.upvotes, upvotes) || other.upvotes == upvotes) &&
            (identical(other.downvotes, downvotes) ||
                other.downvotes == downvotes) &&
            (identical(other.earnedPoints, earnedPoints) ||
                other.earnedPoints == earnedPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, actionType, severity,
      createdAt, lat, lng, upvotes, downvotes, earnedPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityItemModelImplCopyWith<_$ActivityItemModelImpl> get copyWith =>
      __$$ActivityItemModelImplCopyWithImpl<_$ActivityItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityItemModelImplToJson(
      this,
    );
  }
}

abstract class _ActivityItemModel extends ActivityItemModel {
  const factory _ActivityItemModel(
          {required final String id,
          @JsonKey(name: 'action_type') required final String actionType,
          final String severity,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          final double lat,
          final double lng,
          final int upvotes,
          final int downvotes,
          @JsonKey(name: 'earned_points') final int earnedPoints}) =
      _$ActivityItemModelImpl;
  const _ActivityItemModel._() : super._();

  factory _ActivityItemModel.fromJson(Map<String, dynamic> json) =
      _$ActivityItemModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'action_type')
  String get actionType;
  @override
  String get severity;
  @override // tô màu icon
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  double get lat;
  @override
  double get lng;
  @override
  int get upvotes;
  @override
  int get downvotes;
  @override
  @JsonKey(name: 'earned_points')
  int get earnedPoints;
  @override
  @JsonKey(ignore: true)
  _$$ActivityItemModelImplCopyWith<_$ActivityItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
