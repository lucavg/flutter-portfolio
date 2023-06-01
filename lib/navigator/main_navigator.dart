import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/snackbar/snackbar_data.dart';
import 'package:my_flutter_portfolio/navigator/main_navigator.get_x_navigator.dart';
import 'package:my_flutter_portfolio/screen/splash/splash_screen.dart';
import 'package:my_flutter_portfolio/util/env/flavor_config.dart';
import 'package:my_flutter_portfolio/util/snackbar/error_util.dart';
import 'package:my_flutter_portfolio/util/snackbar/snackbar_util.dart';
import 'package:my_flutter_portfolio/widget/general/navigator_page/base_page.dart';
import 'package:get/route_manager.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@GetXNavigator(pageType: BasePage)
class MainNavigator extends BaseNavigator {
  final ErrorUtil _errorUtil;

  MainNavigator(this._errorUtil);

  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute => FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  static final List<GetPage> pages = BaseNavigator.pages;

  void showErrorWithLocaleKey(String errorKey, {List<dynamic>? args}) => _errorUtil.showErrorWithLocaleKey(errorKey, args: args);

  void showError(dynamic error) => _errorUtil.showError(error);

  Future<void> showCustomSnackBar({
    required String message,
    String? title,
    SnackBarStyle style = SnackBarStyle.neutral,
  }) async =>
      SnackBarUtil.showSnackbar(
        title: title,
        message: message,
        style: style,
      );
}
