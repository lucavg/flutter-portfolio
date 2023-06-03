import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/viewmodel/contact/contact_viewmodel.dart';
import 'package:my_flutter_portfolio/widget/general/simple_screen.dart';
import 'package:my_flutter_portfolio/widget/provider/provider_widget.dart';

class ContactWeb extends StatelessWidget {
  const ContactWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ContactViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => SimpleScreen.singleChild(
        isDarkTheme: theme.isDarkTheme,
        isLoading: viewModel.isLoading,
        errorKey: viewModel.errorKey,
        currentIndex: viewModel.currentIndex,
        child: Center(
          child: Text(
            "Contact web screen works",
            style: theme.coreTextTheme.titleBig,
          ),
        ),
      ),
    );
  }
}
