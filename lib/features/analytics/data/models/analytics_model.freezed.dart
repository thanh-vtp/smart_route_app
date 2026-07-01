// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsModel {

@JsonKey(name: 'reputation_score') int get reputationScore;@JsonKey(name: 'total_reports') int get totalReports;@JsonKey(name: 'reports_change_percent') double get reportsChangePercent;@JsonKey(name: 'reports_direction') String get reportsDirection;@JsonKey(name: 'total_upvotes') int get totalUpvotes;@JsonKey(name: 'upvotes_change_percent') double get upvotesChangePercent;@JsonKey(name: 'upvotes_direction') String get upvotesDirection;@JsonKey(name: 'total_downvotes') int get totalDownvotes;@JsonKey(name: 'confirmation_rate') double get confirmationRate;@JsonKey(name: 'distribution_total') int get distributionTotal; List<IncidentChartDataModel> get distribution;@JsonKey(name: 'recent_activities') List<ActivityItemModel> get recentActivities;
/// Create a copy of AnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsModelCopyWith<AnalyticsModel> get copyWith => _$AnalyticsModelCopyWithImpl<AnalyticsModel>(this as AnalyticsModel, _$identity);

  /// Serializes this AnalyticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsModel&&(identical(other.reputationScore, reputationScore) || other.reputationScore == reputationScore)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.reportsChangePercent, reportsChangePercent) || other.reportsChangePercent == reportsChangePercent)&&(identical(other.reportsDirection, reportsDirection) || other.reportsDirection == reportsDirection)&&(identical(other.totalUpvotes, totalUpvotes) || other.totalUpvotes == totalUpvotes)&&(identical(other.upvotesChangePercent, upvotesChangePercent) || other.upvotesChangePercent == upvotesChangePercent)&&(identical(other.upvotesDirection, upvotesDirection) || other.upvotesDirection == upvotesDirection)&&(identical(other.totalDownvotes, totalDownvotes) || other.totalDownvotes == totalDownvotes)&&(identical(other.confirmationRate, confirmationRate) || other.confirmationRate == confirmationRate)&&(identical(other.distributionTotal, distributionTotal) || other.distributionTotal == distributionTotal)&&const DeepCollectionEquality().equals(other.distribution, distribution)&&const DeepCollectionEquality().equals(other.recentActivities, recentActivities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reputationScore,totalReports,reportsChangePercent,reportsDirection,totalUpvotes,upvotesChangePercent,upvotesDirection,totalDownvotes,confirmationRate,distributionTotal,const DeepCollectionEquality().hash(distribution),const DeepCollectionEquality().hash(recentActivities));

@override
String toString() {
  return 'AnalyticsModel(reputationScore: $reputationScore, totalReports: $totalReports, reportsChangePercent: $reportsChangePercent, reportsDirection: $reportsDirection, totalUpvotes: $totalUpvotes, upvotesChangePercent: $upvotesChangePercent, upvotesDirection: $upvotesDirection, totalDownvotes: $totalDownvotes, confirmationRate: $confirmationRate, distributionTotal: $distributionTotal, distribution: $distribution, recentActivities: $recentActivities)';
}


}

/// @nodoc
abstract mixin class $AnalyticsModelCopyWith<$Res>  {
  factory $AnalyticsModelCopyWith(AnalyticsModel value, $Res Function(AnalyticsModel) _then) = _$AnalyticsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'reputation_score') int reputationScore,@JsonKey(name: 'total_reports') int totalReports,@JsonKey(name: 'reports_change_percent') double reportsChangePercent,@JsonKey(name: 'reports_direction') String reportsDirection,@JsonKey(name: 'total_upvotes') int totalUpvotes,@JsonKey(name: 'upvotes_change_percent') double upvotesChangePercent,@JsonKey(name: 'upvotes_direction') String upvotesDirection,@JsonKey(name: 'total_downvotes') int totalDownvotes,@JsonKey(name: 'confirmation_rate') double confirmationRate,@JsonKey(name: 'distribution_total') int distributionTotal, List<IncidentChartDataModel> distribution,@JsonKey(name: 'recent_activities') List<ActivityItemModel> recentActivities
});




}
/// @nodoc
class _$AnalyticsModelCopyWithImpl<$Res>
    implements $AnalyticsModelCopyWith<$Res> {
  _$AnalyticsModelCopyWithImpl(this._self, this._then);

  final AnalyticsModel _self;
  final $Res Function(AnalyticsModel) _then;

/// Create a copy of AnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reputationScore = null,Object? totalReports = null,Object? reportsChangePercent = null,Object? reportsDirection = null,Object? totalUpvotes = null,Object? upvotesChangePercent = null,Object? upvotesDirection = null,Object? totalDownvotes = null,Object? confirmationRate = null,Object? distributionTotal = null,Object? distribution = null,Object? recentActivities = null,}) {
  return _then(_self.copyWith(
reputationScore: null == reputationScore ? _self.reputationScore : reputationScore // ignore: cast_nullable_to_non_nullable
as int,totalReports: null == totalReports ? _self.totalReports : totalReports // ignore: cast_nullable_to_non_nullable
as int,reportsChangePercent: null == reportsChangePercent ? _self.reportsChangePercent : reportsChangePercent // ignore: cast_nullable_to_non_nullable
as double,reportsDirection: null == reportsDirection ? _self.reportsDirection : reportsDirection // ignore: cast_nullable_to_non_nullable
as String,totalUpvotes: null == totalUpvotes ? _self.totalUpvotes : totalUpvotes // ignore: cast_nullable_to_non_nullable
as int,upvotesChangePercent: null == upvotesChangePercent ? _self.upvotesChangePercent : upvotesChangePercent // ignore: cast_nullable_to_non_nullable
as double,upvotesDirection: null == upvotesDirection ? _self.upvotesDirection : upvotesDirection // ignore: cast_nullable_to_non_nullable
as String,totalDownvotes: null == totalDownvotes ? _self.totalDownvotes : totalDownvotes // ignore: cast_nullable_to_non_nullable
as int,confirmationRate: null == confirmationRate ? _self.confirmationRate : confirmationRate // ignore: cast_nullable_to_non_nullable
as double,distributionTotal: null == distributionTotal ? _self.distributionTotal : distributionTotal // ignore: cast_nullable_to_non_nullable
as int,distribution: null == distribution ? _self.distribution : distribution // ignore: cast_nullable_to_non_nullable
as List<IncidentChartDataModel>,recentActivities: null == recentActivities ? _self.recentActivities : recentActivities // ignore: cast_nullable_to_non_nullable
as List<ActivityItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsModel].
extension AnalyticsModelPatterns on AnalyticsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'reputation_score')  int reputationScore, @JsonKey(name: 'total_reports')  int totalReports, @JsonKey(name: 'reports_change_percent')  double reportsChangePercent, @JsonKey(name: 'reports_direction')  String reportsDirection, @JsonKey(name: 'total_upvotes')  int totalUpvotes, @JsonKey(name: 'upvotes_change_percent')  double upvotesChangePercent, @JsonKey(name: 'upvotes_direction')  String upvotesDirection, @JsonKey(name: 'total_downvotes')  int totalDownvotes, @JsonKey(name: 'confirmation_rate')  double confirmationRate, @JsonKey(name: 'distribution_total')  int distributionTotal,  List<IncidentChartDataModel> distribution, @JsonKey(name: 'recent_activities')  List<ActivityItemModel> recentActivities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsModel() when $default != null:
return $default(_that.reputationScore,_that.totalReports,_that.reportsChangePercent,_that.reportsDirection,_that.totalUpvotes,_that.upvotesChangePercent,_that.upvotesDirection,_that.totalDownvotes,_that.confirmationRate,_that.distributionTotal,_that.distribution,_that.recentActivities);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'reputation_score')  int reputationScore, @JsonKey(name: 'total_reports')  int totalReports, @JsonKey(name: 'reports_change_percent')  double reportsChangePercent, @JsonKey(name: 'reports_direction')  String reportsDirection, @JsonKey(name: 'total_upvotes')  int totalUpvotes, @JsonKey(name: 'upvotes_change_percent')  double upvotesChangePercent, @JsonKey(name: 'upvotes_direction')  String upvotesDirection, @JsonKey(name: 'total_downvotes')  int totalDownvotes, @JsonKey(name: 'confirmation_rate')  double confirmationRate, @JsonKey(name: 'distribution_total')  int distributionTotal,  List<IncidentChartDataModel> distribution, @JsonKey(name: 'recent_activities')  List<ActivityItemModel> recentActivities)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsModel():
return $default(_that.reputationScore,_that.totalReports,_that.reportsChangePercent,_that.reportsDirection,_that.totalUpvotes,_that.upvotesChangePercent,_that.upvotesDirection,_that.totalDownvotes,_that.confirmationRate,_that.distributionTotal,_that.distribution,_that.recentActivities);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'reputation_score')  int reputationScore, @JsonKey(name: 'total_reports')  int totalReports, @JsonKey(name: 'reports_change_percent')  double reportsChangePercent, @JsonKey(name: 'reports_direction')  String reportsDirection, @JsonKey(name: 'total_upvotes')  int totalUpvotes, @JsonKey(name: 'upvotes_change_percent')  double upvotesChangePercent, @JsonKey(name: 'upvotes_direction')  String upvotesDirection, @JsonKey(name: 'total_downvotes')  int totalDownvotes, @JsonKey(name: 'confirmation_rate')  double confirmationRate, @JsonKey(name: 'distribution_total')  int distributionTotal,  List<IncidentChartDataModel> distribution, @JsonKey(name: 'recent_activities')  List<ActivityItemModel> recentActivities)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsModel() when $default != null:
return $default(_that.reputationScore,_that.totalReports,_that.reportsChangePercent,_that.reportsDirection,_that.totalUpvotes,_that.upvotesChangePercent,_that.upvotesDirection,_that.totalDownvotes,_that.confirmationRate,_that.distributionTotal,_that.distribution,_that.recentActivities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsModel extends AnalyticsModel {
  const _AnalyticsModel({@JsonKey(name: 'reputation_score') this.reputationScore = 0, @JsonKey(name: 'total_reports') this.totalReports = 0, @JsonKey(name: 'reports_change_percent') this.reportsChangePercent = 0.0, @JsonKey(name: 'reports_direction') this.reportsDirection = 'flat', @JsonKey(name: 'total_upvotes') this.totalUpvotes = 0, @JsonKey(name: 'upvotes_change_percent') this.upvotesChangePercent = 0.0, @JsonKey(name: 'upvotes_direction') this.upvotesDirection = 'flat', @JsonKey(name: 'total_downvotes') this.totalDownvotes = 0, @JsonKey(name: 'confirmation_rate') this.confirmationRate = 0.0, @JsonKey(name: 'distribution_total') this.distributionTotal = 0, final  List<IncidentChartDataModel> distribution = const [], @JsonKey(name: 'recent_activities') final  List<ActivityItemModel> recentActivities = const []}): _distribution = distribution,_recentActivities = recentActivities,super._();
  factory _AnalyticsModel.fromJson(Map<String, dynamic> json) => _$AnalyticsModelFromJson(json);

@override@JsonKey(name: 'reputation_score') final  int reputationScore;
@override@JsonKey(name: 'total_reports') final  int totalReports;
@override@JsonKey(name: 'reports_change_percent') final  double reportsChangePercent;
@override@JsonKey(name: 'reports_direction') final  String reportsDirection;
@override@JsonKey(name: 'total_upvotes') final  int totalUpvotes;
@override@JsonKey(name: 'upvotes_change_percent') final  double upvotesChangePercent;
@override@JsonKey(name: 'upvotes_direction') final  String upvotesDirection;
@override@JsonKey(name: 'total_downvotes') final  int totalDownvotes;
@override@JsonKey(name: 'confirmation_rate') final  double confirmationRate;
@override@JsonKey(name: 'distribution_total') final  int distributionTotal;
 final  List<IncidentChartDataModel> _distribution;
@override@JsonKey() List<IncidentChartDataModel> get distribution {
  if (_distribution is EqualUnmodifiableListView) return _distribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_distribution);
}

 final  List<ActivityItemModel> _recentActivities;
@override@JsonKey(name: 'recent_activities') List<ActivityItemModel> get recentActivities {
  if (_recentActivities is EqualUnmodifiableListView) return _recentActivities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentActivities);
}


/// Create a copy of AnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsModelCopyWith<_AnalyticsModel> get copyWith => __$AnalyticsModelCopyWithImpl<_AnalyticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsModel&&(identical(other.reputationScore, reputationScore) || other.reputationScore == reputationScore)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.reportsChangePercent, reportsChangePercent) || other.reportsChangePercent == reportsChangePercent)&&(identical(other.reportsDirection, reportsDirection) || other.reportsDirection == reportsDirection)&&(identical(other.totalUpvotes, totalUpvotes) || other.totalUpvotes == totalUpvotes)&&(identical(other.upvotesChangePercent, upvotesChangePercent) || other.upvotesChangePercent == upvotesChangePercent)&&(identical(other.upvotesDirection, upvotesDirection) || other.upvotesDirection == upvotesDirection)&&(identical(other.totalDownvotes, totalDownvotes) || other.totalDownvotes == totalDownvotes)&&(identical(other.confirmationRate, confirmationRate) || other.confirmationRate == confirmationRate)&&(identical(other.distributionTotal, distributionTotal) || other.distributionTotal == distributionTotal)&&const DeepCollectionEquality().equals(other._distribution, _distribution)&&const DeepCollectionEquality().equals(other._recentActivities, _recentActivities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reputationScore,totalReports,reportsChangePercent,reportsDirection,totalUpvotes,upvotesChangePercent,upvotesDirection,totalDownvotes,confirmationRate,distributionTotal,const DeepCollectionEquality().hash(_distribution),const DeepCollectionEquality().hash(_recentActivities));

@override
String toString() {
  return 'AnalyticsModel(reputationScore: $reputationScore, totalReports: $totalReports, reportsChangePercent: $reportsChangePercent, reportsDirection: $reportsDirection, totalUpvotes: $totalUpvotes, upvotesChangePercent: $upvotesChangePercent, upvotesDirection: $upvotesDirection, totalDownvotes: $totalDownvotes, confirmationRate: $confirmationRate, distributionTotal: $distributionTotal, distribution: $distribution, recentActivities: $recentActivities)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsModelCopyWith<$Res> implements $AnalyticsModelCopyWith<$Res> {
  factory _$AnalyticsModelCopyWith(_AnalyticsModel value, $Res Function(_AnalyticsModel) _then) = __$AnalyticsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'reputation_score') int reputationScore,@JsonKey(name: 'total_reports') int totalReports,@JsonKey(name: 'reports_change_percent') double reportsChangePercent,@JsonKey(name: 'reports_direction') String reportsDirection,@JsonKey(name: 'total_upvotes') int totalUpvotes,@JsonKey(name: 'upvotes_change_percent') double upvotesChangePercent,@JsonKey(name: 'upvotes_direction') String upvotesDirection,@JsonKey(name: 'total_downvotes') int totalDownvotes,@JsonKey(name: 'confirmation_rate') double confirmationRate,@JsonKey(name: 'distribution_total') int distributionTotal, List<IncidentChartDataModel> distribution,@JsonKey(name: 'recent_activities') List<ActivityItemModel> recentActivities
});




}
/// @nodoc
class __$AnalyticsModelCopyWithImpl<$Res>
    implements _$AnalyticsModelCopyWith<$Res> {
  __$AnalyticsModelCopyWithImpl(this._self, this._then);

  final _AnalyticsModel _self;
  final $Res Function(_AnalyticsModel) _then;

/// Create a copy of AnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reputationScore = null,Object? totalReports = null,Object? reportsChangePercent = null,Object? reportsDirection = null,Object? totalUpvotes = null,Object? upvotesChangePercent = null,Object? upvotesDirection = null,Object? totalDownvotes = null,Object? confirmationRate = null,Object? distributionTotal = null,Object? distribution = null,Object? recentActivities = null,}) {
  return _then(_AnalyticsModel(
reputationScore: null == reputationScore ? _self.reputationScore : reputationScore // ignore: cast_nullable_to_non_nullable
as int,totalReports: null == totalReports ? _self.totalReports : totalReports // ignore: cast_nullable_to_non_nullable
as int,reportsChangePercent: null == reportsChangePercent ? _self.reportsChangePercent : reportsChangePercent // ignore: cast_nullable_to_non_nullable
as double,reportsDirection: null == reportsDirection ? _self.reportsDirection : reportsDirection // ignore: cast_nullable_to_non_nullable
as String,totalUpvotes: null == totalUpvotes ? _self.totalUpvotes : totalUpvotes // ignore: cast_nullable_to_non_nullable
as int,upvotesChangePercent: null == upvotesChangePercent ? _self.upvotesChangePercent : upvotesChangePercent // ignore: cast_nullable_to_non_nullable
as double,upvotesDirection: null == upvotesDirection ? _self.upvotesDirection : upvotesDirection // ignore: cast_nullable_to_non_nullable
as String,totalDownvotes: null == totalDownvotes ? _self.totalDownvotes : totalDownvotes // ignore: cast_nullable_to_non_nullable
as int,confirmationRate: null == confirmationRate ? _self.confirmationRate : confirmationRate // ignore: cast_nullable_to_non_nullable
as double,distributionTotal: null == distributionTotal ? _self.distributionTotal : distributionTotal // ignore: cast_nullable_to_non_nullable
as int,distribution: null == distribution ? _self._distribution : distribution // ignore: cast_nullable_to_non_nullable
as List<IncidentChartDataModel>,recentActivities: null == recentActivities ? _self._recentActivities : recentActivities // ignore: cast_nullable_to_non_nullable
as List<ActivityItemModel>,
  ));
}


}


/// @nodoc
mixin _$IncidentChartDataModel {

 String get type; int get count;
/// Create a copy of IncidentChartDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentChartDataModelCopyWith<IncidentChartDataModel> get copyWith => _$IncidentChartDataModelCopyWithImpl<IncidentChartDataModel>(this as IncidentChartDataModel, _$identity);

  /// Serializes this IncidentChartDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentChartDataModel&&(identical(other.type, type) || other.type == type)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,count);

@override
String toString() {
  return 'IncidentChartDataModel(type: $type, count: $count)';
}


}

/// @nodoc
abstract mixin class $IncidentChartDataModelCopyWith<$Res>  {
  factory $IncidentChartDataModelCopyWith(IncidentChartDataModel value, $Res Function(IncidentChartDataModel) _then) = _$IncidentChartDataModelCopyWithImpl;
@useResult
$Res call({
 String type, int count
});




}
/// @nodoc
class _$IncidentChartDataModelCopyWithImpl<$Res>
    implements $IncidentChartDataModelCopyWith<$Res> {
  _$IncidentChartDataModelCopyWithImpl(this._self, this._then);

  final IncidentChartDataModel _self;
  final $Res Function(IncidentChartDataModel) _then;

/// Create a copy of IncidentChartDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? count = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentChartDataModel].
extension IncidentChartDataModelPatterns on IncidentChartDataModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentChartDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentChartDataModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentChartDataModel value)  $default,){
final _that = this;
switch (_that) {
case _IncidentChartDataModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentChartDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentChartDataModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentChartDataModel() when $default != null:
return $default(_that.type,_that.count);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  int count)  $default,) {final _that = this;
switch (_that) {
case _IncidentChartDataModel():
return $default(_that.type,_that.count);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  int count)?  $default,) {final _that = this;
switch (_that) {
case _IncidentChartDataModel() when $default != null:
return $default(_that.type,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidentChartDataModel extends IncidentChartDataModel {
  const _IncidentChartDataModel({required this.type, this.count = 0}): super._();
  factory _IncidentChartDataModel.fromJson(Map<String, dynamic> json) => _$IncidentChartDataModelFromJson(json);

@override final  String type;
@override@JsonKey() final  int count;

/// Create a copy of IncidentChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentChartDataModelCopyWith<_IncidentChartDataModel> get copyWith => __$IncidentChartDataModelCopyWithImpl<_IncidentChartDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentChartDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentChartDataModel&&(identical(other.type, type) || other.type == type)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,count);

@override
String toString() {
  return 'IncidentChartDataModel(type: $type, count: $count)';
}


}

/// @nodoc
abstract mixin class _$IncidentChartDataModelCopyWith<$Res> implements $IncidentChartDataModelCopyWith<$Res> {
  factory _$IncidentChartDataModelCopyWith(_IncidentChartDataModel value, $Res Function(_IncidentChartDataModel) _then) = __$IncidentChartDataModelCopyWithImpl;
@override @useResult
$Res call({
 String type, int count
});




}
/// @nodoc
class __$IncidentChartDataModelCopyWithImpl<$Res>
    implements _$IncidentChartDataModelCopyWith<$Res> {
  __$IncidentChartDataModelCopyWithImpl(this._self, this._then);

  final _IncidentChartDataModel _self;
  final $Res Function(_IncidentChartDataModel) _then;

/// Create a copy of IncidentChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? count = null,}) {
  return _then(_IncidentChartDataModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ActivityItemModel {

 String get id;@JsonKey(name: 'action_type') String get actionType; String get severity;@JsonKey(name: 'created_at') DateTime? get createdAt; double get lat; double get lng; int get upvotes; int get downvotes;@JsonKey(name: 'earned_points') int get earnedPoints;
/// Create a copy of ActivityItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityItemModelCopyWith<ActivityItemModel> get copyWith => _$ActivityItemModelCopyWithImpl<ActivityItemModel>(this as ActivityItemModel, _$identity);

  /// Serializes this ActivityItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.earnedPoints, earnedPoints) || other.earnedPoints == earnedPoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,actionType,severity,createdAt,lat,lng,upvotes,downvotes,earnedPoints);

@override
String toString() {
  return 'ActivityItemModel(id: $id, actionType: $actionType, severity: $severity, createdAt: $createdAt, lat: $lat, lng: $lng, upvotes: $upvotes, downvotes: $downvotes, earnedPoints: $earnedPoints)';
}


}

/// @nodoc
abstract mixin class $ActivityItemModelCopyWith<$Res>  {
  factory $ActivityItemModelCopyWith(ActivityItemModel value, $Res Function(ActivityItemModel) _then) = _$ActivityItemModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'action_type') String actionType, String severity,@JsonKey(name: 'created_at') DateTime? createdAt, double lat, double lng, int upvotes, int downvotes,@JsonKey(name: 'earned_points') int earnedPoints
});




}
/// @nodoc
class _$ActivityItemModelCopyWithImpl<$Res>
    implements $ActivityItemModelCopyWith<$Res> {
  _$ActivityItemModelCopyWithImpl(this._self, this._then);

  final ActivityItemModel _self;
  final $Res Function(ActivityItemModel) _then;

/// Create a copy of ActivityItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? actionType = null,Object? severity = null,Object? createdAt = freezed,Object? lat = null,Object? lng = null,Object? upvotes = null,Object? downvotes = null,Object? earnedPoints = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,earnedPoints: null == earnedPoints ? _self.earnedPoints : earnedPoints // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityItemModel].
extension ActivityItemModelPatterns on ActivityItemModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityItemModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ActivityItemModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityItemModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'action_type')  String actionType,  String severity, @JsonKey(name: 'created_at')  DateTime? createdAt,  double lat,  double lng,  int upvotes,  int downvotes, @JsonKey(name: 'earned_points')  int earnedPoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityItemModel() when $default != null:
return $default(_that.id,_that.actionType,_that.severity,_that.createdAt,_that.lat,_that.lng,_that.upvotes,_that.downvotes,_that.earnedPoints);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'action_type')  String actionType,  String severity, @JsonKey(name: 'created_at')  DateTime? createdAt,  double lat,  double lng,  int upvotes,  int downvotes, @JsonKey(name: 'earned_points')  int earnedPoints)  $default,) {final _that = this;
switch (_that) {
case _ActivityItemModel():
return $default(_that.id,_that.actionType,_that.severity,_that.createdAt,_that.lat,_that.lng,_that.upvotes,_that.downvotes,_that.earnedPoints);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'action_type')  String actionType,  String severity, @JsonKey(name: 'created_at')  DateTime? createdAt,  double lat,  double lng,  int upvotes,  int downvotes, @JsonKey(name: 'earned_points')  int earnedPoints)?  $default,) {final _that = this;
switch (_that) {
case _ActivityItemModel() when $default != null:
return $default(_that.id,_that.actionType,_that.severity,_that.createdAt,_that.lat,_that.lng,_that.upvotes,_that.downvotes,_that.earnedPoints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityItemModel extends ActivityItemModel {
  const _ActivityItemModel({required this.id, @JsonKey(name: 'action_type') required this.actionType, this.severity = 'low', @JsonKey(name: 'created_at') this.createdAt, this.lat = 0.0, this.lng = 0.0, this.upvotes = 0, this.downvotes = 0, @JsonKey(name: 'earned_points') this.earnedPoints = 0}): super._();
  factory _ActivityItemModel.fromJson(Map<String, dynamic> json) => _$ActivityItemModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'action_type') final  String actionType;
@override@JsonKey() final  String severity;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey() final  double lat;
@override@JsonKey() final  double lng;
@override@JsonKey() final  int upvotes;
@override@JsonKey() final  int downvotes;
@override@JsonKey(name: 'earned_points') final  int earnedPoints;

/// Create a copy of ActivityItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityItemModelCopyWith<_ActivityItemModel> get copyWith => __$ActivityItemModelCopyWithImpl<_ActivityItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.earnedPoints, earnedPoints) || other.earnedPoints == earnedPoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,actionType,severity,createdAt,lat,lng,upvotes,downvotes,earnedPoints);

@override
String toString() {
  return 'ActivityItemModel(id: $id, actionType: $actionType, severity: $severity, createdAt: $createdAt, lat: $lat, lng: $lng, upvotes: $upvotes, downvotes: $downvotes, earnedPoints: $earnedPoints)';
}


}

/// @nodoc
abstract mixin class _$ActivityItemModelCopyWith<$Res> implements $ActivityItemModelCopyWith<$Res> {
  factory _$ActivityItemModelCopyWith(_ActivityItemModel value, $Res Function(_ActivityItemModel) _then) = __$ActivityItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'action_type') String actionType, String severity,@JsonKey(name: 'created_at') DateTime? createdAt, double lat, double lng, int upvotes, int downvotes,@JsonKey(name: 'earned_points') int earnedPoints
});




}
/// @nodoc
class __$ActivityItemModelCopyWithImpl<$Res>
    implements _$ActivityItemModelCopyWith<$Res> {
  __$ActivityItemModelCopyWithImpl(this._self, this._then);

  final _ActivityItemModel _self;
  final $Res Function(_ActivityItemModel) _then;

/// Create a copy of ActivityItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actionType = null,Object? severity = null,Object? createdAt = freezed,Object? lat = null,Object? lng = null,Object? upvotes = null,Object? downvotes = null,Object? earnedPoints = null,}) {
  return _then(_ActivityItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,earnedPoints: null == earnedPoints ? _self.earnedPoints : earnedPoints // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
