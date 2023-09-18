// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/dio_client.dart' as _i10;
import '../data/repository/products/products_mapper.dart' as _i7;
import '../data/repository/products/products_repository.dart' as _i12;
import '../data/repository/rest_data_source.dart' as _i8;
import '../data/repository/rest_module.dart' as _i16;
import '../data/secure_storage/secure_storage_module.dart' as _i15;
import '../data/secure_storage/secure_storage_service.dart' as _i9;
import '../domain/repository/products_repository.dart' as _i11;
import '../domain/usecase/products/fetch_products_use_case.dart' as _i13;
import '../navigation/base/app_router.dart' as _i3;
import '../navigation/base/base_navigator.dart' as _i4;
import '../navigation/home/home_navigator.dart' as _i6;
import '../presentation/destinations/home/home_view_model.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final secureStorageModule = _$SecureStorageModule();
    final restModule = _$RestModule();
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.singleton<_i4.BaseNavigator>(
        _i4.BaseNavigatorImpl(appRouter: gh<_i3.AppRouter>()));
    gh.singleton<_i5.FlutterSecureStorage>(secureStorageModule.get());
    gh.factory<_i6.HomeNavigator>(
        () => _i6.HomeNavigatorImpl(navigator: gh<_i4.BaseNavigator>()));
    gh.singleton<_i7.ProductsMapper>(_i7.ProductsMapper());
    gh.singleton<_i8.RestDataSource>(restModule.get());
    gh.singleton<_i9.SecureStorageService>(
        _i9.SecureStorageServiceImpl(storage: gh<_i5.FlutterSecureStorage>()));
    gh.factory<String>(() => restModule.baseUrl);
    gh.factory<_i10.DioClient>(() => _i10.DioClient(gh<String>()));
    gh.lazySingleton<_i11.ProductsRepository>(() => _i12.ProductRepositoryImpl(
          dataSource: gh<_i8.RestDataSource>(),
          productsMapper: gh<_i7.ProductsMapper>(),
        ));
    gh.factory<_i13.FetchProductsUseCase>(
        () => _i13.FetchProductsUseCase(gh<_i11.ProductsRepository>()));
    gh.factory<_i14.HomeViewModel>(
        () => _i14.HomeViewModel(gh<_i13.FetchProductsUseCase>()));
    return this;
  }
}

class _$SecureStorageModule extends _i15.SecureStorageModule {}

class _$RestModule extends _i16.RestModule {}
