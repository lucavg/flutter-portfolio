import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/navigator/main_navigator.get_x_navigator.dart';
import 'package:my_flutter_portfolio/viewmodel/splash/splash_viewmodel.dart';
import 'package:my_flutter_portfolio/widget/general/status_bar.dart';
import 'package:my_flutter_portfolio/widget/general/styled/my_flutter_portfolio_progress_indicator.dart';
import 'package:my_flutter_portfolio/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@GetXRoute(
  navigationType: NavigationType.popAndPush,
)
class SplashScreen extends StatefulWidget {
  static const String routeName = RouteNames.splashScreen;

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

@visibleForTesting
class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SplashViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.animated(
        isDarkStyle: theme.isDarkTheme,
        child: Scaffold(
          backgroundColor: theme.colorsTheme.primary,
          body: const Center(
            child: MFPProgressIndicator.light(),
          ),
        ),
      ),
    );
  }
}
