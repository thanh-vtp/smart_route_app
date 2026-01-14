import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/navigation/data/datasources/arcgis_geocoding_remote_data_source.dart';
import 'package:smart_route_app/features/navigation/data/datasources/arcgis_geocoding_remote_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/datasources/image_remote_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source_impl.dart';
part 'remote_datasource_providers.g.dart';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref

/// Provider cho ArcGIS Geocoding Data Source
// @Riverpod(keepAlive: true)
// ArcGISGeocodingRemoteDataSource arcgisGeocodingRemoteDataSource(
//   ArcgisGeocodingRemoteDataSourceRef ref,
// ) {
//   return ArcGISGeocodingRemoteDataSourceImpl();
// }

@Riverpod(keepAlive: true)
RoutingRemoteDataSource routingRemoteDataSource(
  RoutingRemoteDataSourceRef ref,
) {
  return RoutingRemoteDataSourceImpl();
}

@Riverpod(keepAlive: true)
ImageRemoteDataSource imageRemoteDataSource(ImageRemoteDataSourceRef ref) {
  return ImageRemoteDataSourceImpl();
}
