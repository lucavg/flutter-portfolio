// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GetXNavigationConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i3;
import 'package:get/route_manager.dart';

import '../screen/home/home_screen.dart' as _i2;
import '../screen/splash/splash_screen.dart' as _i4;
import '../widget/general/navigator_page/base_page.dart' as _i1;

class BaseNavigator {
  static final pages = [
    _i1.BasePage<dynamic>(
      name: RouteNames.homeScreen,
      page: () => _i2.HomeScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.splashScreen,
      page: () => _i4.SplashScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
  ];

  Future<void> goToHomeScreen({
    _i3.Key? key,
    int? navigatorId,
  }) async =>
      Get.toNamed<dynamic>(
        RouteNames.homeScreen,
        id: navigatorId,
        arguments: {'key': key},
      );
  Future<void> goToSplashScreen({
    _i3.Key? key,
    int? navigatorId,
  }) async =>
      Get.toNamed<dynamic>(
        RouteNames.splashScreen,
        id: navigatorId,
        arguments: {'key': key},
      );
  void goBack<T>({
    T? result,
    int? navigatorId,
  }) =>
      Get.back<T>(
        result: result,
        id: navigatorId,
      );
  void closeDialog({int? navigatorId}) =>
      goBack<void>(navigatorId: navigatorId);
  void popUntil(
    bool Function(_i3.Route<dynamic>) predicate, {
    int? navigatorId,
  }) =>
      Get.until(
        predicate,
        id: navigatorId,
      );
  void goBackTo(
    String routeName, {
    int? navigatorId,
  }) =>
      Get.until(
        (route) => Get.currentRoute == routeName,
        id: navigatorId,
      );
  Future<T?> showCustomDialog<T>({
    _i3.Widget? widget,
    _i3.GlobalKey<_i3.NavigatorState>? navigatorKey,
  }) async =>
      Get.dialog<T>(
        widget ?? const _i3.SizedBox.shrink(),
        navigatorKey: navigatorKey,
      );
}

class RouteNames {
  static const homeScreen = '/home';

  static const splashScreen = '/splash';
}
