import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';

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

// Model dùng chung
@freezed
class LocationPoint with _$LocationPoint {
  const factory LocationPoint({
    @Default(0.0) @JsonKey(name: 'x') double lng, // Kinh độ
    @Default(0.0) @JsonKey(name: 'y') double lat, // Vĩ độ
  }) = _LocationPoint;

  factory LocationPoint.fromJson(Map<String, dynamic> json) =>
      _$LocationPointFromJson(json);
}

// Model Tìm kiếm địa điểm (Geocoding)
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

  AddressResult toEntity() {
    return AddressResult(
      fullAddress: address,
      lat: location.lat,
      lng: location.lng,
      score: score,
      streetName: attributes['Address'] as String?,
      neighborhood: attributes['Neighborhood'] as String?,
      district: attributes['District'] as String?,
      city: attributes['City'] as String?,
      region: attributes['Region'] as String?,
      countryName: attributes['CntryName'] as String?,
      postalCode: attributes['Postal'] as String?,
    );
  }
}

// Model lấy thông tin địa chỉ từ tọa độ (Reverse Geocoding)
@freezed
class ReverseGeocodeResponse with _$ReverseGeocodeResponse {
  const ReverseGeocodeResponse._();

  const factory ReverseGeocodeResponse({
    @JsonKey(name: 'address') required AddressInfo address,
    @JsonKey(name: 'location') required LocationPoint location,
  }) = _ReverseGeocodeResponse;

  factory ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeResponseFromJson(json);

  AddressResult toEntity() {
    return AddressResult(
      fullAddress: address.fullAddress ?? 'Không xác định',
      lat: location.lat,
      lng: location.lng,
      score: 100.0, // Reverse geocode độ chính xác mặc định là 100
      streetName: address.streetName,
      neighborhood: address.neighborhood,
      district: address.district,
      city: address.city,
      region: address.region,
      countryName: address.countryName,
      postalCode: address.postalCode,
    );
  }
}

@freezed
class AddressInfo with _$AddressInfo {
  const factory AddressInfo({
    @JsonKey(name: 'Match_addr') String? fullAddress,
    @JsonKey(name: 'Address') String? streetName,
    @JsonKey(name: 'Neighborhood') String? neighborhood,
    @JsonKey(name: 'District') String? district,
    @JsonKey(name: 'City') String? city,
    @JsonKey(name: 'Region') String? region,
    @JsonKey(name: 'CntryName') String? countryName,
    @JsonKey(name: 'Postal') String? postalCode,
  }) = _AddressInfo;

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
}
