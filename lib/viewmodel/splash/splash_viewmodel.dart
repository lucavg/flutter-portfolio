import 'dart:async';

import 'package:my_flutter_portfolio/navigator/main_navigator.dart';
import 'package:my_flutter_portfolio/repository/shared_prefs/local/local_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel with ChangeNotifierEx {
  final LocalStorage _localStorage;
  final MainNavigator _navigator;

  SplashViewModel(
    this._localStorage,
    this._navigator,
  );

  Future<void> init() async {
    await _localStorage.checkForNewInstallation();
    _navigator.goToHomeScreen();
  }
}
