import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/navigator/main_navigator.dart';
import 'package:my_flutter_portfolio/util/env/flavor_config.dart';
import 'package:get/route_manager.dart';

class DebugGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return FlavorConfig.isProd() ? RouteSettings(name: MainNavigator.initialRoute) : null;
  }
}