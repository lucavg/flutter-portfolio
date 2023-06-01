import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/navigator/main_navigator.dart';
import 'package:my_flutter_portfolio/styles/theme_data.dart';
import 'package:my_flutter_portfolio/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:my_flutter_portfolio/viewmodel/global/global_viewmodel.dart';
import 'package:my_flutter_portfolio/widget/general/flavor_banner.dart';
import 'package:my_flutter_portfolio/widget/general/text_scale_factor.dart';
import 'package:my_flutter_portfolio/widget/provider/provider_widget.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return const InternalApp();
  }
}

class InternalApp extends StatelessWidget {
  final Widget? home;
  final bool _isInTest;

  const InternalApp({Key? key})
      : home = null,
        _isInTest = false,
        super(key: key);

  @visibleForTesting
  const InternalApp.test({
    required this.home,
    super.key,
  }) : _isInTest = true;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      create: () => getIt()..init(),
      lazy: _isInTest,
      consumer: (context, viewModel, consumerChild) => GetMaterialApp(
        debugShowCheckedModeBanner: !_isInTest,
        localizationsDelegates: [
          if (viewModel.localeDelegate != null) viewModel.localeDelegate!,
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: viewModel.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: MFPThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: MFPThemeData.darkTheme(viewModel.targetPlatform),
        initialRoute: home == null ? MainNavigator.initialRoute : null,
        getPages: MainNavigator.pages,
        home: home,
        builder: home == null
            ? (context, child) => FlavorBanner(
                  child: TextScaleFactor(
                    child: child ?? const SizedBox.shrink(),
                  ),
                )
            : null,
      ),
    );
  }
}
