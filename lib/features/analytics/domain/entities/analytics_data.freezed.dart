// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsData {

 int get reputationScore; int get totalReports; double get reportsChangePercent; String get reportsDirection; int get totalUpvotes; double get upvotesChangePercent; String get upvotesDirection; int get totalDownvotes; double get confirmationRate; int get distributionTotal; List<IncidentChartData> get distribution; List<ActivityItem> get recentActivities;
/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsDataCopyWith<AnalyticsData> get copyWith => _$AnalyticsDataCopyWithImpl<AnalyticsData>(this as AnalyticsData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsData&&(identical(other.reputationScore, reputationScore) || other.reputationScore == reputationScore)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.reportsChangePercent, reportsChangePercent) || other.reportsChangePercent == reportsChangePercent)&&(identical(other.reportsDirection, reportsDirection) || other.reportsDirection == reportsDirection)&&(identical(other.totalUpvotes, totalUpvotes) || other.totalUpvotes == totalUpvotes)&&(identical(other.upvotesChangePercent, upvotesChangePercent) || other.upvotesChangePercent == upvotesChangePercent)&&(identical(other.upvotesDirection, upvotesDirection) || other.upvotesDirection == upvotesDirection)&&(identical(other.totalDownvotes, totalDownvotes) || other.totalDownvotes == totalDownvotes)&&(identical(other.confirmationRate, confirmationRate) || other.confirmationRate == confirmationRate)&&(identical(other.distributionTotal, distributionTotal) || other.distributionTotal == distributionTotal)&&const DeepCollectionEquality().equals(other.distribution, distribution)&&const DeepCollectionEquality().equals(other.recentActivities, recentActivities));
}


@override
int get hashCode => Object.hash(runtimeType,reputationScore,totalReports,reportsChangePercent,reportsDirection,totalUpvotes,upvotesChangePercent,upvotesDirection,totalDownvotes,confirmationRate,distributionTotal,const DeepCollectionEquality().hash(distribution),const DeepCollectionEquality().hash(recentActivities));

@override
String toString() {
  return 'AnalyticsData(reputationScore: $reputationScore, totalReports: $totalReports, reportsChangePercent: $reportsChangePercent, reportsDirection: $reportsDirection, totalUpvotes: $totalUpvotes, upvotesChangePercent: $upvotesChangePercent, upvotesDirection: $upvotesDirection, totalDownvotes: $totalDownvotes, confirmationRate: $confirmationRate, distributionTotal: $distributionTotal, distribution: $distribution, recentActivities: $recentActivities)';
}


}

/// @nodoc
abstract mixin class $AnalyticsDataCopyWith<$Res>  {
  factory $AnalyticsDataCopyWith(AnalyticsData value, $Res Function(AnalyticsData) _then) = _$AnalyticsDataCopyWithImpl;
@useResult
$Res call({
 int reputationScore, int totalReports, double reportsChangePercent, String reportsDirection, int totalUpvotes, double upvotesChangePercent, String upvotesDirection, int totalDownvotes, double confirmationRate, int distributionTotal, List<IncidentChartData> distribution, List<ActivityItem> recentActivities
});




}
/// @nodoc
class _$AnalyticsDataCopyWithImpl<$Res>
    implements $AnalyticsDataCopyWith<$Res> {
  _$AnalyticsDataCopyWithImpl(this._self, this._then);

  final AnalyticsData _self;
  final $Res Function(AnalyticsData) _then;

/// Create a copy of AnalyticsData
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
as List<IncidentChartData>,recentActivities: null == recentActivities ? _self.recentActivities : recentActivities // ignore: cast_nullable_to_non_nullable
as List<ActivityItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsData].
extension AnalyticsDataPatterns on AnalyticsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsData value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsData value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int reputationScore,  int totalReports,  double reportsChangePercent,  String reportsDirection,  int totalUpvotes,  double upvotesChangePercent,  String upvotesDirection,  int totalDownvotes,  double confirmationRate,  int distributionTotal,  List<IncidentChartData> distribution,  List<ActivityItem> recentActivities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int reputationScore,  int totalReports,  double reportsChangePercent,  String reportsDirection,  int totalUpvotes,  double upvotesChangePercent,  String upvotesDirection,  int totalDownvotes,  double confirmationRate,  int distributionTotal,  List<IncidentChartData> distribution,  List<ActivityItem> recentActivities)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int reputationScore,  int totalReports,  double reportsChangePercent,  String reportsDirection,  int totalUpvotes,  double upvotesChangePercent,  String upvotesDirection,  int totalDownvotes,  double confirmationRate,  int distributionTotal,  List<IncidentChartData> distribution,  List<ActivityItem> recentActivities)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsData() when $default != null:
return $default(_that.reputationScore,_that.totalReports,_that.reportsChangePercent,_that.reportsDirection,_that.totalUpvotes,_that.upvotesChangePercent,_that.upvotesDirection,_that.totalDownvotes,_that.confirmationRate,_that.distributionTotal,_that.distribution,_that.recentActivities);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsData implements AnalyticsData {
  const _AnalyticsData({this.reputationScore = 0, this.totalReports = 0, this.reportsChangePercent = 0.0, this.reportsDirection = 'flat', this.totalUpvotes = 0, this.upvotesChangePercent = 0.0, this.upvotesDirection = 'flat', this.totalDownvotes = 0, this.confirmationRate = 0.0, this.distributionTotal = 0, final  List<IncidentChartData> distribution = const [], final  List<ActivityItem> recentActivities = const []}): _distribution = distribution,_recentActivities = recentActivities;
  

@override@JsonKey() final  int reputationScore;
@override@JsonKey() final  int totalReports;
@override@JsonKey() final  double reportsChangePercent;
@override@JsonKey() final  String reportsDirection;
@override@JsonKey() final  int totalUpvotes;
@override@JsonKey() final  double upvotesChangePercent;
@override@JsonKey() final  String upvotesDirection;
@override@JsonKey() final  int totalDownvotes;
@override@JsonKey() final  double confirmationRate;
@override@JsonKey() final  int distributionTotal;
 final  List<IncidentChartData> _distribution;
@override@JsonKey() List<IncidentChartData> get distribution {
  if (_distribution is EqualUnmodifiableListView) return _distribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_distribution);
}

 final  List<ActivityItem> _recentActivities;
@override@JsonKey() List<ActivityItem> get recentActivities {
  if (_recentActivities is EqualUnmodifiableListView) return _recentActivities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentActivities);
}


/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsDataCopyWith<_AnalyticsData> get copyWith => __$AnalyticsDataCopyWithImpl<_AnalyticsData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsData&&(identical(other.reputationScore, reputationScore) || other.reputationScore == reputationScore)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.reportsChangePercent, reportsChangePercent) || other.reportsChangePercent == reportsChangePercent)&&(identical(other.reportsDirection, reportsDirection) || other.reportsDirection == reportsDirection)&&(identical(other.totalUpvotes, totalUpvotes) || other.totalUpvotes == totalUpvotes)&&(identical(other.upvotesChangePercent, upvotesChangePercent) || other.upvotesChangePercent == upvotesChangePercent)&&(identical(other.upvotesDirection, upvotesDirection) || other.upvotesDirection == upvotesDirection)&&(identical(other.totalDownvotes, totalDownvotes) || other.totalDownvotes == totalDownvotes)&&(identical(other.confirmationRate, confirmationRate) || other.confirmationRate == confirmationRate)&&(identical(other.distributionTotal, distributionTotal) || other.distributionTotal == distributionTotal)&&const DeepCollectionEquality().equals(other._distribution, _distribution)&&const DeepCollectionEquality().equals(other._recentActivities, _recentActivities));
}


@override
int get hashCode => Object.hash(runtimeType,reputationScore,totalReports,reportsChangePercent,reportsDirection,totalUpvotes,upvotesChangePercent,upvotesDirection,totalDownvotes,confirmationRate,distributionTotal,const DeepCollectionEquality().hash(_distribution),const DeepCollectionEquality().hash(_recentActivities));

@override
String toString() {
  return 'AnalyticsData(reputationScore: $reputationScore, totalReports: $totalReports, reportsChangePercent: $reportsChangePercent, reportsDirection: $reportsDirection, totalUpvotes: $totalUpvotes, upvotesChangePercent: $upvotesChangePercent, upvotesDirection: $upvotesDirection, totalDownvotes: $totalDownvotes, confirmationRate: $confirmationRate, distributionTotal: $distributionTotal, distribution: $distribution, recentActivities: $recentActivities)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsDataCopyWith<$Res> implements $AnalyticsDataCopyWith<$Res> {
  factory _$AnalyticsDataCopyWith(_AnalyticsData value, $Res Function(_AnalyticsData) _then) = __$AnalyticsDataCopyWithImpl;
@override @useResult
$Res call({
 int reputationScore, int totalReports, double reportsChangePercent, String reportsDirection, int totalUpvotes, double upvotesChangePercent, String upvotesDirection, int totalDownvotes, double confirmationRate, int distributionTotal, List<IncidentChartData> distribution, List<ActivityItem> recentActivities
});




}
/// @nodoc
class __$AnalyticsDataCopyWithImpl<$Res>
    implements _$AnalyticsDataCopyWith<$Res> {
  __$AnalyticsDataCopyWithImpl(this._self, this._then);

  final _AnalyticsData _self;
  final $Res Function(_AnalyticsData) _then;

/// Create a copy of AnalyticsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reputationScore = null,Object? totalReports = null,Object? reportsChangePercent = null,Object? reportsDirection = null,Object? totalUpvotes = null,Object? upvotesChangePercent = null,Object? upvotesDirection = null,Object? totalDownvotes = null,Object? confirmationRate = null,Object? distributionTotal = null,Object? distribution = null,Object? recentActivities = null,}) {
  return _then(_AnalyticsData(
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
as List<IncidentChartData>,recentActivities: null == recentActivities ? _self._recentActivities : recentActivities // ignore: cast_nullable_to_non_nullable
as List<ActivityItem>,
  ));
}


}

/// @nodoc
mixin _$IncidentChartData {

 String get type; int get count;
/// Create a copy of IncidentChartData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentChartDataCopyWith<IncidentChartData> get copyWith => _$IncidentChartDataCopyWithImpl<IncidentChartData>(this as IncidentChartData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentChartData&&(identical(other.type, type) || other.type == type)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,type,count);

@override
String toString() {
  return 'IncidentChartData(type: $type, count: $count)';
}


}

/// @nodoc
abstract mixin class $IncidentChartDataCopyWith<$Res>  {
  factory $IncidentChartDataCopyWith(IncidentChartData value, $Res Function(IncidentChartData) _then) = _$IncidentChartDataCopyWithImpl;
@useResult
$Res call({
 String type, int count
});




}
/// @nodoc
class _$IncidentChartDataCopyWithImpl<$Res>
    implements $IncidentChartDataCopyWith<$Res> {
  _$IncidentChartDataCopyWithImpl(this._self, this._then);

  final IncidentChartData _self;
  final $Res Function(IncidentChartData) _then;

/// Create a copy of IncidentChartData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? count = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentChartData].
extension IncidentChartDataPatterns on IncidentChartData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentChartData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentChartData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentChartData value)  $default,){
final _that = this;
switch (_that) {
case _IncidentChartData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentChartData value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentChartData() when $default != null:
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
case _IncidentChartData() when $default != null:
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
case _IncidentChartData():
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
case _IncidentChartData() when $default != null:
return $default(_that.type,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _IncidentChartData implements IncidentChartData {
  const _IncidentChartData({required this.type, required this.count});
  

@override final  String type;
@override final  int count;

/// Create a copy of IncidentChartData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentChartDataCopyWith<_IncidentChartData> get copyWith => __$IncidentChartDataCopyWithImpl<_IncidentChartData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentChartData&&(identical(other.type, type) || other.type == type)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,type,count);

@override
String toString() {
  return 'IncidentChartData(type: $type, count: $count)';
}


}

/// @nodoc
abstract mixin class _$IncidentChartDataCopyWith<$Res> implements $IncidentChartDataCopyWith<$Res> {
  factory _$IncidentChartDataCopyWith(_IncidentChartData value, $Res Function(_IncidentChartData) _then) = __$IncidentChartDataCopyWithImpl;
@override @useResult
$Res call({
 String type, int count
});




}
/// @nodoc
class __$IncidentChartDataCopyWithImpl<$Res>
    implements _$IncidentChartDataCopyWith<$Res> {
  __$IncidentChartDataCopyWithImpl(this._self, this._then);

  final _IncidentChartData _self;
  final $Res Function(_IncidentChartData) _then;

/// Create a copy of IncidentChartData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? count = null,}) {
  return _then(_IncidentChartData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ActivityItem {

 String get id; String get actionType; String get severity; DateTime get createdAt; double get lat; double get lng; int get upvotes; int get downvotes; int get earnedPoints; String? get address;
/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityItemCopyWith<ActivityItem> get copyWith => _$ActivityItemCopyWithImpl<ActivityItem>(this as ActivityItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityItem&&(identical(other.id, id) || other.id == id)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.earnedPoints, earnedPoints) || other.earnedPoints == earnedPoints)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,actionType,severity,createdAt,lat,lng,upvotes,downvotes,earnedPoints,address);

@override
String toString() {
  return 'ActivityItem(id: $id, actionType: $actionType, severity: $severity, createdAt: $createdAt, lat: $lat, lng: $lng, upvotes: $upvotes, downvotes: $downvotes, earnedPoints: $earnedPoints, address: $address)';
}


}

/// @nodoc
abstract mixin class $ActivityItemCopyWith<$Res>  {
  factory $ActivityItemCopyWith(ActivityItem value, $Res Function(ActivityItem) _then) = _$ActivityItemCopyWithImpl;
@useResult
$Res call({
 String id, String actionType, String severity, DateTime createdAt, double lat, double lng, int upvotes, int downvotes, int earnedPoints, String? address
});




}
/// @nodoc
class _$ActivityItemCopyWithImpl<$Res>
    implements $ActivityItemCopyWith<$Res> {
  _$ActivityItemCopyWithImpl(this._self, this._then);

  final ActivityItem _self;
  final $Res Function(ActivityItem) _then;

/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? actionType = null,Object? severity = null,Object? createdAt = null,Object? lat = null,Object? lng = null,Object? upvotes = null,Object? downvotes = null,Object? earnedPoints = null,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,earnedPoints: null == earnedPoints ? _self.earnedPoints : earnedPoints // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityItem].
extension ActivityItemPatterns on ActivityItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityItem value)  $default,){
final _that = this;
switch (_that) {
case _ActivityItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityItem value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String actionType,  String severity,  DateTime createdAt,  double lat,  double lng,  int upvotes,  int downvotes,  int earnedPoints,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
return $default(_that.id,_that.actionType,_that.severity,_that.createdAt,_that.lat,_that.lng,_that.upvotes,_that.downvotes,_that.earnedPoints,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String actionType,  String severity,  DateTime createdAt,  double lat,  double lng,  int upvotes,  int downvotes,  int earnedPoints,  String? address)  $default,) {final _that = this;
switch (_that) {
case _ActivityItem():
return $default(_that.id,_that.actionType,_that.severity,_that.createdAt,_that.lat,_that.lng,_that.upvotes,_that.downvotes,_that.earnedPoints,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String actionType,  String severity,  DateTime createdAt,  double lat,  double lng,  int upvotes,  int downvotes,  int earnedPoints,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
return $default(_that.id,_that.actionType,_that.severity,_that.createdAt,_that.lat,_that.lng,_that.upvotes,_that.downvotes,_that.earnedPoints,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _ActivityItem implements ActivityItem {
  const _ActivityItem({required this.id, required this.actionType, required this.severity, required this.createdAt, required this.lat, required this.lng, this.upvotes = 0, this.downvotes = 0, this.earnedPoints = 0, this.address});
  

@override final  String id;
@override final  String actionType;
@override final  String severity;
@override final  DateTime createdAt;
@override final  double lat;
@override final  double lng;
@override@JsonKey() final  int upvotes;
@override@JsonKey() final  int downvotes;
@override@JsonKey() final  int earnedPoints;
@override final  String? address;

/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityItemCopyWith<_ActivityItem> get copyWith => __$ActivityItemCopyWithImpl<_ActivityItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityItem&&(identical(other.id, id) || other.id == id)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.earnedPoints, earnedPoints) || other.earnedPoints == earnedPoints)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,actionType,severity,createdAt,lat,lng,upvotes,downvotes,earnedPoints,address);

@override
String toString() {
  return 'ActivityItem(id: $id, actionType: $actionType, severity: $severity, createdAt: $createdAt, lat: $lat, lng: $lng, upvotes: $upvotes, downvotes: $downvotes, earnedPoints: $earnedPoints, address: $address)';
}


}

/// @nodoc
abstract mixin class _$ActivityItemCopyWith<$Res> implements $ActivityItemCopyWith<$Res> {
  factory _$ActivityItemCopyWith(_ActivityItem value, $Res Function(_ActivityItem) _then) = __$ActivityItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String actionType, String severity, DateTime createdAt, double lat, double lng, int upvotes, int downvotes, int earnedPoints, String? address
});




}
/// @nodoc
class __$ActivityItemCopyWithImpl<$Res>
    implements _$ActivityItemCopyWith<$Res> {
  __$ActivityItemCopyWithImpl(this._self, this._then);

  final _ActivityItem _self;
  final $Res Function(_ActivityItem) _then;

/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actionType = null,Object? severity = null,Object? createdAt = null,Object? lat = null,Object? lng = null,Object? upvotes = null,Object? downvotes = null,Object? earnedPoints = null,Object? address = freezed,}) {
  return _then(_ActivityItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,earnedPoints: null == earnedPoints ? _self.earnedPoints : earnedPoints // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
