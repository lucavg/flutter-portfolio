import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/viewmodel/about/about_viewmodel.dart';
import 'package:my_flutter_portfolio/widget/general/simple_screen.dart';
import 'package:my_flutter_portfolio/widget/provider/provider_widget.dart';

class AboutTablet extends StatelessWidget {
  const AboutTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<AboutViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => SimpleScreen.singleChild(
        isDarkTheme: theme.isDarkTheme,
        isLoading: viewModel.isLoading,
        errorKey: viewModel.errorKey,
        currentIndex: viewModel.currentIndex,
        child: Center(
          child: Text(
            "About tablet screen works",
            style: theme.coreTextTheme.titleBig,
          ),
        ),
      ),
    );
  }
}
