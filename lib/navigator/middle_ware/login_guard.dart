import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/navigator/main_navigator.dart';
import 'package:my_flutter_portfolio/repository/secure_storage/auth/auth_storage.dart';
import 'package:my_flutter_portfolio/util/env/flavor_config.dart';
import 'package:get/route_manager.dart';

class LoginGuard extends GetMiddleware {
  final authStorage = getIt.get<AuthStorage>();

  @override
  RouteSettings? redirect(String? route) {
    if (FlavorConfig.isInTest()) return null;
    return authStorage.isLoggedIn ? RouteSettings(name: MainNavigator.initialRoute) : null;
  }
}
