import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/resources/lib/supabase.dart';
import 'package:smart_route_app/features/incident/data/datasources/arcgis_remote_data_source.dart';
import 'package:smart_route_app/features/incident/data/datasources/arcgis_remote_data_source_impl.dart';
import 'package:smart_route_app/features/incident/data/datasources/supabase_remote_data_source.dart';
import 'package:smart_route_app/features/incident/data/datasources/supabase_remote_data_source_impl.dart';
import 'package:smart_route_app/core/feature_layer/providers/feature_layer_providers.dart';

part 'remote_datasource_providers.g.dart';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref

/// Provider cho ArcGIS Data Source (chỉ GET)
@Riverpod(keepAlive: true)
ArcGISRemoteDataSource arcgisRemoteDataSource(ArcgisRemoteDataSourceRef ref) {
  final layer = ref.watch(incidentFeatureLayerProvider);
  return ArcGISRemoteDataSourceImpl(layer);
}

/// Provider cho Supabase Data Source (ADD & DELETE)
@Riverpod(keepAlive: true)
SupabaseRemoteDataSource supabaseRemoteDataSource(
  SupabaseRemoteDataSourceRef ref,
) {
  return SupabaseRemoteDataSourceImpl(supabase);
}
