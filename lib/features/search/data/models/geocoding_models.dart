import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_models.freezed.dart';
part 'geocoding_models.g.dart';

// {
//     "spatialReference": {
//         "wkid": 4326,
//         "latestWkid": 4326
//     },
//     "candidates": [
//         {
//             "address": "HTBV Internet Shop Calls Oversea",
//             "location": {
//                 "x": 109.1946844,
//                 "y": 12.2385144
//             },
//             "score": 100,
//             "attributes": {
//                 "Loc_name": "World",
//                 "Status": "T",
//                 "Score": 100,
//                 "Match_addr": "HTBV Internet Shop Calls Oversea",
//                 "LongLabel": "HTBV Internet Shop Calls Oversea, 5 Đường Nguyễn Thị Minh Khai, Lộc Thọ, Nha Trang, Khánh Hòa, 57106, VNM",
//                 "ShortLabel": "HTBV Internet Shop Calls Oversea",
//                 "Addr_type": "POI",
//                 "Type": "Coffee Shop",
//                 "PlaceName": "HTBV Internet Shop Calls Oversea",
//                 "Place_addr": "5 Đường Nguyễn Thị Minh Khai, Lộc Thọ, Nha Trang, Khánh Hòa, 57106",
//                 "Phone": "+(84)-(258)-3521838",
//                 "URL": "",
//                 "Rank": 19,
//                 "AddBldg": "",
//                 "AddNum": "5",
//                 "AddNumFrom": "",
//                 "AddNumTo": "",
//                 "AddRange": "",
//                 "Side": "R",
//                 "StPreDir": "",
//                 "StPreType": "Đường",
//                 "StName": "Nguyễn Thị Minh Khai",
//                 "StType": "",
//                 "StDir": "",
//                 "BldgComp": "",
//                 "BldgType": "",
//                 "BldgName": "",
//                 "LevelType": "",
//                 "LevelName": "",
//                 "UnitType": "",
//                 "UnitName": "",
//                 "RoomType": "",
//                 "RoomName": "",
//                 "WingType": "",
//                 "WingName": "",
//                 "SubAddr": "",
//                 "StAddr": "5 Đường Nguyễn Thị Minh Khai",
//                 "Block": "",
//                 "Sector": "",
//                 "Nbrhd": "Lộc Thọ",
//                 "District": "Lộc Thọ",
//                 "City": "Nha Trang",
//                 "MetroArea": "",
//                 "Subregion": "",
//                 "Region": "Khánh Hòa",
//                 "RegionAbbr": "",
//                 "Territory": "",
//                 "Zone": "",
//                 "Postal": "57106",
//                 "PostalExt": "",
//                 "Country": "VNM",
//                 "CntryName": "Việt Nam",
//                 "LangCode": "VIE",
//                 "Distance": 221.32141870613194,
//                 "X": 109.194678448849,
//                 "Y": 12.238605427468,
//                 "DisplayX": 109.1946844,
//                 "DisplayY": 12.2385144,
//                 "Xmin": 109.1896844,
//                 "Xmax": 109.1996844,
//                 "Ymin": 12.2335144,
//                 "Ymax": 12.2435144,
//                 "ExInfo": "",
//                 "MatchID": "AQ2qaQQAXo8BAJUBBLB4YL0OIEhUQlYgSU5URVJORVQgU0hPUCBDQUxMUyBPVkVSU0VBZgNWSUU",
//                 "PotentialID": "",
//                 "StrucType": "",
//                 "StrucDet": ""
//             },
//             "extent": {
//                 "xmin": 109.1896844,
//                 "ymin": 12.2335144,
//                 "xmax": 109.1996844,
//                 "ymax": 12.2435144
//             }
//         }
//     ]
// }

@freezed
class GeocodeResponse with _$GeocodeResponse {
  const factory GeocodeResponse({
    @Default([]) @JsonKey(name: 'candidates') List<GeocodeCandidate> candidates,
  }) = _GeocodeResponse;

  factory GeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodeResponseFromJson(json);
}

@freezed
class GeocodeCandidate with _$GeocodeCandidate {
  const GeocodeCandidate._(); // using private constructor for custom getters
  const factory GeocodeCandidate({
    @Default('') @JsonKey(name: 'address') String address,
    @JsonKey(name: 'location') required LocationPoint location,
    @Default(0.0) @JsonKey(name: 'score') double score,
    @Default({}) @JsonKey(name: 'attributes') Map<String, dynamic> attributes,
    @JsonKey(name: 'extent') Map<String, dynamic>? extent, // zoom extent map
  }) = _GeocodeCandidate;

  factory GeocodeCandidate.fromJson(Map<String, dynamic> json) =>
      _$GeocodeCandidateFromJson(json);

  /// Custom getter

  /// Tên địa điểm hiển thị/Title
  String get name {
    return attributes['Match_addr'] as String? ??
        attributes['PlaceName'] as String? ??
        address;
  }

  /// Địa chỉ chi tiết/Subtitle
  String get detailAddress {
    return attributes['Place_addr'] as String? ??
        attributes['LongLabel'] as String? ??
        '';
  }

  /// Loại địa điểm/Type
  String get type {
    return attributes['Type'] as String? ??
        attributes['Addr_type'] as String? ??
        'POI'; // Mặc định là Point of Interest
  }

  /// sdt
  String? get phone {
    final val = attributes['Phone'];
    if (val is String && val.isNotEmpty) return val;
    return null;
  }

  /// Khoảng cách (m)
  double? get distance {
    final val = attributes['Distance'];
    if (val is num) return val.toDouble();
    return null;
  }

  /// Tên thành phố
  String? get city => attributes['City'] as String?;
}

@freezed
class LocationPoint with _$LocationPoint {
  const factory LocationPoint({
    @Default(0.0) @JsonKey(name: 'x') double longitude, // Kinh độ
    @Default(0.0) @JsonKey(name: 'y') double latitude, // Vĩ độ
  }) = _LocationPoint;

  factory LocationPoint.fromJson(Map<String, dynamic> json) =>
      _$LocationPointFromJson(json);
}

@freezed
class ReverseGeocodeResponse with _$ReverseGeocodeResponse {
  const factory ReverseGeocodeResponse({
    @JsonKey(name: 'address') required AddressInfo address,
    @JsonKey(name: 'location') required LocationPoint location,
  }) = _ReverseGeocodeResponse;

  factory ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeResponseFromJson(json);
}

@freezed
class AddressInfo with _$AddressInfo {
  const factory AddressInfo({
    @JsonKey(name: 'Match_addr') String? fullAddress,
    @JsonKey(name: 'LongLabel') String? longLabel,
    @JsonKey(name: 'ShortLabel') String? shortLabel,
    @JsonKey(name: 'Addr_type') String? addressType,
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'PlaceName') String? placeName,
    @JsonKey(name: 'AddNum') String? addressNumber,
    @JsonKey(name: 'Address') String? streetName,
    @JsonKey(name: 'Block') String? block,
    @JsonKey(name: 'Sector') String? sector,
    @JsonKey(name: 'Neighborhood') String? neighborhood,
    @JsonKey(name: 'District') String? district,
    @JsonKey(name: 'City') String? city,
    @JsonKey(name: 'MetroArea') String? metroArea,
    @JsonKey(name: 'Subregion') String? subregion,
    @JsonKey(name: 'Region') String? region,
    @JsonKey(name: 'Territory') String? territory,
    @JsonKey(name: 'Postal') String? postalCode,
    @JsonKey(name: 'PostalExt') String? postalExtension,
    @JsonKey(name: 'CntryName') String? countryName,
    @JsonKey(name: 'CountryCode') String? countryCode,
  }) = _AddressInfo;

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
}
