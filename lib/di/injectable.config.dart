// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i31;
import 'package:firebase_analytics/firebase_analytics.dart' as _i11;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_flutter_portfolio/di/injectable.dart' as _i33;
import 'package:my_flutter_portfolio/navigator/main_navigator.dart' as _i15;
import 'package:my_flutter_portfolio/repository/analytics/firebase_analytics_repository.dart'
    as _i23;
import 'package:my_flutter_portfolio/repository/debug/debug_repository.dart'
    as _i25;
import 'package:my_flutter_portfolio/repository/locale/locale_repository.dart'
    as _i27;
import 'package:my_flutter_portfolio/repository/secure_storage/auth/auth_storage.dart'
    as _i24;
import 'package:my_flutter_portfolio/repository/secure_storage/secure_storage.dart'
    as _i19;
import 'package:my_flutter_portfolio/repository/shared_prefs/local/local_storage.dart'
    as _i26;
import 'package:my_flutter_portfolio/util/app_util.dart' as _i4;
import 'package:my_flutter_portfolio/util/cache/cache_controller.dart' as _i6;
import 'package:my_flutter_portfolio/util/cache/cache_controlling.dart' as _i5;
import 'package:my_flutter_portfolio/util/interceptor/network_auth_interceptor.dart'
    as _i28;
import 'package:my_flutter_portfolio/util/interceptor/network_error_interceptor.dart'
    as _i16;
import 'package:my_flutter_portfolio/util/interceptor/network_log_interceptor.dart'
    as _i17;
import 'package:my_flutter_portfolio/util/interceptor/network_refresh_interceptor.dart'
    as _i29;
import 'package:my_flutter_portfolio/util/snackbar/error_util.dart' as _i9;
import 'package:my_flutter_portfolio/util/theme/theme_config.dart' as _i22;
import 'package:my_flutter_portfolio/viewmodel/about/about_viewmodel.dart'
    as _i3;
import 'package:my_flutter_portfolio/viewmodel/contact/contact_viewmodel.dart'
    as _i8;
import 'package:my_flutter_portfolio/viewmodel/experience/experience_viewmodel.dart'
    as _i10;
import 'package:my_flutter_portfolio/viewmodel/general/simple_screen_viewmodel.dart'
    as _i21;
import 'package:my_flutter_portfolio/viewmodel/global/global_viewmodel.dart'
    as _i32;
import 'package:my_flutter_portfolio/viewmodel/home/home_viewmodel.dart'
    as _i13;
import 'package:my_flutter_portfolio/viewmodel/internship/internship_viewmodel.dart'
    as _i14;
import 'package:my_flutter_portfolio/viewmodel/projects/projects_viewmodel.dart'
    as _i18;
import 'package:my_flutter_portfolio/viewmodel/splash/splash_viewmodel.dart'
    as _i30;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

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
    gh.factory<_i3.AboutViewModel>(() => _i3.AboutViewModel());
    gh.lazySingleton<_i4.AppUtil>(() => _i4.AppUtil());
    gh.singleton<_i5.CacheControlling>(_i6.CacheController());
    gh.singleton<_i7.ConnectivityHelper>(registerModule.connectivityHelper());
    gh.factory<_i8.ContactViewModel>(() => _i8.ContactViewModel());
    gh.lazySingleton<_i9.ErrorUtil>(() => _i9.ErrorUtil());
    gh.factory<_i10.ExperienceViewModel>(() => _i10.ExperienceViewModel());
    gh.lazySingleton<_i11.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i12.FlutterSecureStorage>(() => registerModule.storage());
    gh.factory<_i13.HomeViewModel>(() => _i13.HomeViewModel());
    gh.factory<_i14.InternshipViewModel>(() => _i14.InternshipViewModel());
    gh.lazySingleton<_i15.MainNavigator>(
        () => _i15.MainNavigator(gh<_i9.ErrorUtil>()));
    gh.singleton<_i16.NetworkErrorInterceptor>(
        _i16.NetworkErrorInterceptor(gh<_i7.ConnectivityHelper>()));
    gh.singleton<_i17.NetworkLogInterceptor>(_i17.NetworkLogInterceptor());
    gh.factory<_i18.ProjectsViewModel>(() => _i18.ProjectsViewModel());
    gh.lazySingleton<_i19.SecureStorage>(
        () => _i19.SecureStorage(gh<_i12.FlutterSecureStorage>()));
    await gh.singletonAsync<_i20.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.factory<_i21.SimpleScreenViewModel>(
        () => _i21.SimpleScreenViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i22.ThemeConfigUtil>(() => _i22.ThemeConfigUtil());
    gh.lazySingleton<_i23.FireBaseAnalyticsRepository>(
        () => _i23.FireBaseAnalyticsRepository(gh<_i11.FirebaseAnalytics>()));
    gh.lazySingleton<_i7.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i20.SharedPreferences>()));
    gh.lazySingleton<_i7.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i7.SharedPreferenceStorage>(),
              gh<_i19.SecureStorage>(),
            ));
    gh.lazySingleton<_i24.AuthStorage>(
        () => _i24.AuthStorage(gh<_i7.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i25.DebugRepository>(
        () => _i25.DebugRepository(gh<_i7.SharedPreferenceStorage>()));
    gh.lazySingleton<_i26.LocalStorage>(() => _i26.LocalStorage(
          gh<_i24.AuthStorage>(),
          gh<_i7.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i27.LocaleRepository>(
        () => _i27.LocaleRepository(gh<_i7.SharedPreferenceStorage>()));
    gh.singleton<_i28.NetworkAuthInterceptor>(
        _i28.NetworkAuthInterceptor(gh<_i24.AuthStorage>()));
    gh.singleton<_i29.NetworkRefreshInterceptor>(
        _i29.NetworkRefreshInterceptor(gh<_i24.AuthStorage>()));
    gh.factory<_i30.SplashViewModel>(() => _i30.SplashViewModel(
          gh<_i26.LocalStorage>(),
          gh<_i15.MainNavigator>(),
        ));
    gh.lazySingleton<_i7.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i17.NetworkLogInterceptor>(),
              gh<_i28.NetworkAuthInterceptor>(),
              gh<_i16.NetworkErrorInterceptor>(),
              gh<_i29.NetworkRefreshInterceptor>(),
            ));
    gh.lazySingleton<_i31.Dio>(
        () => registerModule.provideDio(gh<_i7.CombiningSmartInterceptor>()));
    gh.lazySingleton<_i32.GlobalViewModel>(() => _i32.GlobalViewModel(
          gh<_i27.LocaleRepository>(),
          gh<_i25.DebugRepository>(),
          gh<_i26.LocalStorage>(),
          gh<_i22.ThemeConfigUtil>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i33.RegisterModule {}
