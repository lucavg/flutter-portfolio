// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// GetXNavigationConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i3;
import 'package:get/route_manager.dart';

import '../screen/about/about_screen.dart' as _i8;
import '../screen/contact/contact_screen.dart' as _i5;
import '../screen/experience/experience_screen.dart' as _i9;
import '../screen/home/home_screen.dart' as _i6;
import '../screen/internship/internship_screen.dart' as _i2;
import '../screen/projects/projects_screen.dart' as _i4;
import '../screen/splash/splash_screen.dart' as _i7;
import '../widget/general/navigator_page/base_page.dart' as _i1;

class BaseNavigator {
  static final pages = [
    _i1.BasePage<dynamic>(
      name: RouteNames.internshipScreen,
      page: () =>
          _i2.InternshipScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.projectsScreen,
      page: () => _i4.ProjectsScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.contactScreen,
      page: () => _i5.ContactScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.homeScreen,
      page: () => _i6.HomeScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.splashScreen,
      page: () => _i7.SplashScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.aboutScreen,
      page: () => _i8.AboutScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
    _i1.BasePage<dynamic>(
      name: RouteNames.experienceScreen,
      page: () =>
          _i9.ExperienceScreen(key: (Get.arguments?['key'] as _i3.Key?)),
    ),
  ];

  void goToInternshipScreen({
    _i3.Key? key,
    int? navigatorId,
  }) =>
      Get.offNamed<dynamic>(
        RouteNames.internshipScreen,
        id: navigatorId,
        arguments: {'key': key},
      );
  void goToProjectsScreen({
    _i3.Key? key,
    int? navigatorId,
  }) =>
      Get.offNamed<dynamic>(
        RouteNames.projectsScreen,
        id: navigatorId,
        arguments: {'key': key},
      );
  void goToContactScreen({
    _i3.Key? key,
    int? navigatorId,
  }) =>
      Get.offNamed<dynamic>(
        RouteNames.contactScreen,
        id: navigatorId,
        arguments: {'key': key},
      );
  void goToHomeScreen({
    _i3.Key? key,
    int? navigatorId,
  }) =>
      Get.offNamed<dynamic>(
        RouteNames.homeScreen,
        id: navigatorId,
        arguments: {'key': key},
      );
  void goToSplashScreen({
    _i3.Key? key,
    int? navigatorId,
  }) =>
      Get.offNamed<dynamic>(
        RouteNames.splashScreen,
        id: navigatorId,
        arguments: {'key': key},
      );
  void goToAboutScreen({
    _i3.Key? key,
    int? navigatorId,
  }) =>
      Get.offNamed<dynamic>(
        RouteNames.aboutScreen,
        id: navigatorId,
        arguments: {'key': key},
      );
  void goToExperienceScreen({
    _i3.Key? key,
    int? navigatorId,
  }) =>
      Get.offNamed<dynamic>(
        RouteNames.experienceScreen,
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
  static const internshipScreen = '/internship';

  static const projectsScreen = '/projects';

  static const contactScreen = '/contact';

  static const homeScreen = '/home';

  static const splashScreen = '/splash';

  static const aboutScreen = '/about';

  static const experienceScreen = '/experience';
}
