import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/viewmodel/projects/projects_viewmodel.dart';
import 'package:my_flutter_portfolio/widget/general/simple_screen.dart';
import 'package:my_flutter_portfolio/widget/provider/provider_widget.dart';

class ProjectsMobile extends StatelessWidget {
  const ProjectsMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ProjectsViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => SimpleScreen.singleChild(
        isDarkTheme: theme.isDarkTheme,
        isLoading: viewModel.isLoading,
        errorKey: viewModel.errorKey,
        currentIndex: viewModel.currentIndex,
        child: Center(
          child: Text(
            "Projects mobile screen works",
            style: theme.coreTextTheme.titleBig,
          ),
        ),
      ),
    );
  }
}
