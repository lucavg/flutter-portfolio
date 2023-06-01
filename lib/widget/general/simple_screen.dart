import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/model/utils/screen_type.dart';
import 'package:my_flutter_portfolio/util/app_util.dart';
import 'package:my_flutter_portfolio/viewmodel/general/simple_screen_viewmodel.dart';
import 'package:my_flutter_portfolio/widget/general/simple_nav_bar.dart';
import 'package:my_flutter_portfolio/widget/general/status_bar.dart';
import 'package:my_flutter_portfolio/widget/general/styled/my_flutter_portfolio_progress_indicator.dart';
import 'package:my_flutter_portfolio/widget/provider/data_provider_widget.dart';
import 'package:my_flutter_portfolio/widget/provider/provider_widget.dart';

class SimpleScreen extends StatefulWidget {
  final bool isDarkTheme;
  final bool isLoading;
  final bool leadingIncluded;
  final String? title;
  final Widget? child;
  final List<Widget>? appBarActions;
  final bool? centerTitle;
  final String? errorKey;

  const SimpleScreen.singleChild({
    required this.isDarkTheme,
    required this.isLoading,
    required this.child,
    this.title,
    this.appBarActions,
    this.centerTitle,
    this.errorKey,
    this.leadingIncluded = true,
    super.key,
  });

  @override
  State<SimpleScreen> createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SimpleScreenViewModel>(
      create: () => getIt(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        return DataProviderWidget(
          childBuilder: (context, theme, localization) => StatusBar.animated(
            isDarkStyle: widget.isDarkTheme,
            child: LayoutBuilder(builder: (context, constraints) {
              final screenType = AppUtil.getScreenType(context);
              return Scaffold(
                backgroundColor: theme.colorsTheme.background,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(screenType == ScreenType.web ? 80 : 250),
                  child: SimpleNavBar(
                    leading: [
                      if (widget.leadingIncluded)
                        GestureDetector(
                          onTap: viewModel.goToHomeScreen,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Flex(
                              direction: screenType == ScreenType.web ? Axis.horizontal : Axis.vertical,
                              children: const [],
                            ),
                          ),
                        ),
                    ],
                    title: (widget.title != null) ? widget.title! : null,
                    actions: widget.appBarActions,
                  ),
                ),
                body: SafeArea(
                  child: Builder(
                    builder: (context) {
                      if (widget.isLoading) {
                        return Center(
                          child: MFPProgressIndicator(dark: theme.isLightTheme),
                        );
                      }
                      if (widget.errorKey != null) {
                        return Center(
                          child: Text(
                            localization.getTranslation(widget.errorKey!),
                            style: theme.coreTextTheme.bodyNormal.copyWith(color: theme.colorsTheme.errorText),
                          ),
                        );
                      }
                      return widget.child!;
                    },
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
