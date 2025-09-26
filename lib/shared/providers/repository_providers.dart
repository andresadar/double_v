import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/address/data/datasources/address_data_sources.dart';
import '../../features/address/data/datasources/address_local_data_source_impl.dart';
import '../../features/address/data/datasources/location_remote_data_source_impl.dart';
import '../../features/address/data/repositories/address_repository_impl.dart';
import '../../features/address/domain/repositories/address_repository.dart';
import '../../features/user/data/datasources/user_local_data_source.dart';
import '../../features/user/data/datasources/user_local_data_source_impl.dart';
import '../../features/user/data/repositories/user_repository_impl.dart';
import '../../features/user/domain/repositories/user_repository.dart';

/// Provider para Dio (cliente HTTP)
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
  return dio;
});

/// Provider para UserLocalDataSource
final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  return UserLocalDataSourceImpl();
});

/// Provider para UserRepository
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    localDataSource: ref.watch(userLocalDataSourceProvider),
  );
});

/// Provider para AddressLocalDataSource
final addressLocalDataSourceProvider = Provider<AddressLocalDataSource>((ref) {
  return AddressLocalDataSourceImpl();
});

/// Provider para LocationRemoteDataSource
final locationRemoteDataSourceProvider = Provider<LocationRemoteDataSource>((ref) {
  return LocationRemoteDataSourceImpl(ref.watch(dioProvider));
});

/// Provider para AddressRepository
final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  return AddressRepositoryImpl(
    localDataSource: ref.watch(addressLocalDataSourceProvider),
    remoteDataSource: ref.watch(locationRemoteDataSourceProvider),
  );
});
