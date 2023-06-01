// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i26;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_flutter_portfolio/di/injectable.dart' as _i28;
import 'package:my_flutter_portfolio/navigator/main_navigator.dart' as _i10;
import 'package:my_flutter_portfolio/repository/analytics/firebase_analytics_repository.dart'
    as _i17;
import 'package:my_flutter_portfolio/repository/debug/debug_repository.dart'
    as _i19;
import 'package:my_flutter_portfolio/repository/locale/locale_repository.dart'
    as _i21;
import 'package:my_flutter_portfolio/repository/secure_storage/auth/auth_storage.dart'
    as _i18;
import 'package:my_flutter_portfolio/repository/secure_storage/secure_storage.dart'
    as _i13;
import 'package:my_flutter_portfolio/repository/shared_prefs/local/local_storage.dart'
    as _i20;
import 'package:my_flutter_portfolio/util/app_util.dart' as _i3;
import 'package:my_flutter_portfolio/util/cache/cache_controller.dart' as _i5;
import 'package:my_flutter_portfolio/util/cache/cache_controlling.dart' as _i4;
import 'package:my_flutter_portfolio/util/interceptor/network_auth_interceptor.dart'
    as _i22;
import 'package:my_flutter_portfolio/util/interceptor/network_error_interceptor.dart'
    as _i11;
import 'package:my_flutter_portfolio/util/interceptor/network_log_interceptor.dart'
    as _i12;
import 'package:my_flutter_portfolio/util/interceptor/network_refresh_interceptor.dart'
    as _i23;
import 'package:my_flutter_portfolio/util/snackbar/error_util.dart' as _i7;
import 'package:my_flutter_portfolio/util/theme/theme_config.dart' as _i16;
import 'package:my_flutter_portfolio/viewmodel/general/simple_screen_viewmodel.dart'
    as _i15;
import 'package:my_flutter_portfolio/viewmodel/global/global_viewmodel.dart'
    as _i27;
import 'package:my_flutter_portfolio/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i25;
import 'package:my_flutter_portfolio/viewmodel/splash/splash_viewmodel.dart'
    as _i24;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppUtil>(() => _i3.AppUtil());
    gh.singleton<_i4.CacheControlling>(_i5.CacheController());
    gh.singleton<_i6.ConnectivityHelper>(registerModule.connectivityHelper());
    gh.lazySingleton<_i7.ErrorUtil>(() => _i7.ErrorUtil());
    gh.lazySingleton<_i8.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i9.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i10.MainNavigator>(
        () => _i10.MainNavigator(gh<_i7.ErrorUtil>()));
    gh.singleton<_i11.NetworkErrorInterceptor>(
        _i11.NetworkErrorInterceptor(gh<_i6.ConnectivityHelper>()));
    gh.singleton<_i12.NetworkLogInterceptor>(_i12.NetworkLogInterceptor());
    gh.lazySingleton<_i13.SecureStorage>(
        () => _i13.SecureStorage(gh<_i9.FlutterSecureStorage>()));
    await gh.singletonAsync<_i14.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.factory<_i15.SimpleScreenViewModel>(
        () => _i15.SimpleScreenViewModel(gh<_i10.MainNavigator>()));
    gh.lazySingleton<_i16.ThemeConfigUtil>(() => _i16.ThemeConfigUtil());
    gh.lazySingleton<_i17.FireBaseAnalyticsRepository>(
        () => _i17.FireBaseAnalyticsRepository(gh<_i8.FirebaseAnalytics>()));
    gh.lazySingleton<_i6.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i14.SharedPreferences>()));
    gh.lazySingleton<_i6.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i6.SharedPreferenceStorage>(),
              gh<_i13.SecureStorage>(),
            ));
    gh.lazySingleton<_i18.AuthStorage>(
        () => _i18.AuthStorage(gh<_i6.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i19.DebugRepository>(
        () => _i19.DebugRepository(gh<_i6.SharedPreferenceStorage>()));
    gh.lazySingleton<_i20.LocalStorage>(() => _i20.LocalStorage(
          gh<_i18.AuthStorage>(),
          gh<_i6.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i21.LocaleRepository>(
        () => _i21.LocaleRepository(gh<_i6.SharedPreferenceStorage>()));
    gh.singleton<_i22.NetworkAuthInterceptor>(
        _i22.NetworkAuthInterceptor(gh<_i18.AuthStorage>()));
    gh.singleton<_i23.NetworkRefreshInterceptor>(
        _i23.NetworkRefreshInterceptor(gh<_i18.AuthStorage>()));
    gh.factory<_i24.SplashViewModel>(() => _i24.SplashViewModel(
          gh<_i20.LocalStorage>(),
          gh<_i10.MainNavigator>(),
        ));
    gh.factory<_i25.AnalyticsPermissionViewModel>(
        () => _i25.AnalyticsPermissionViewModel(
              gh<_i10.MainNavigator>(),
              gh<_i20.LocalStorage>(),
            ));
    gh.lazySingleton<_i6.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i12.NetworkLogInterceptor>(),
              gh<_i22.NetworkAuthInterceptor>(),
              gh<_i11.NetworkErrorInterceptor>(),
              gh<_i23.NetworkRefreshInterceptor>(),
            ));
    gh.lazySingleton<_i26.Dio>(
        () => registerModule.provideDio(gh<_i6.CombiningSmartInterceptor>()));
    gh.lazySingleton<_i27.GlobalViewModel>(() => _i27.GlobalViewModel(
          gh<_i21.LocaleRepository>(),
          gh<_i19.DebugRepository>(),
          gh<_i20.LocalStorage>(),
          gh<_i16.ThemeConfigUtil>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i28.RegisterModule {}
