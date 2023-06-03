import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/styles/theme_assets.dart';
import 'package:my_flutter_portfolio/util/app_constants.dart';
import 'package:my_flutter_portfolio/util/app_util.dart';
import 'package:my_flutter_portfolio/viewmodel/general/simple_screen_viewmodel.dart';
import 'package:my_flutter_portfolio/widget/general/status_bar.dart';
import 'package:my_flutter_portfolio/widget/general/styled/my_flutter_portfolio_progress_indicator.dart';
import 'package:my_flutter_portfolio/widget/general/svg_icon.dart';
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
  final int currentIndex;

  const SimpleScreen.singleChild({
    required this.isDarkTheme,
    required this.isLoading,
    required this.child,
    required this.currentIndex,
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
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) {
        return DataProviderWidget(
          childBuilder: (context, theme, localization) => StatusBar.animated(
            isDarkStyle: widget.isDarkTheme,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SafeArea(
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
                      return Scaffold(
                        extendBody: true,
                        backgroundColor: theme.colorsTheme.background,
                        bottomNavigationBar: AppUtil.getMqWidth(context) < AppConstants.mediumScreenWidth
                            ? Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: BottomNavigationBar(
                                  type: BottomNavigationBarType.fixed,
                                  backgroundColor: theme.colorsTheme.navBar,
                                  currentIndex: widget.currentIndex,
                                  onTap: (int index) {
                                    setState(() {
                                      viewModel.navigateTo(index);
                                    });
                                  },
                                  selectedItemColor: theme.colorsTheme.neonColor,
                                  unselectedItemColor: theme.colorsTheme.neonColor.withOpacity(0.5),
                                  unselectedIconTheme: IconThemeData(
                                    color: theme.colorsTheme.background,
                                  ),
                                  unselectedFontSize: theme.coreTextTheme.bodyNormal.fontSize!,
                                  items: const [
                                    BottomNavigationBarItem(
                                      icon: Icon(Icons.home),
                                      label: 'Home',
                                    ),
                                    BottomNavigationBarItem(
                                      icon: Icon(Icons.person),
                                      label: 'About',
                                    ),
                                    BottomNavigationBarItem(
                                      icon: Icon(Icons.timeline),
                                      label: 'Experience',
                                    ),
                                    BottomNavigationBarItem(
                                      icon: Icon(Icons.work),
                                      label: 'Internship',
                                    ),
                                    BottomNavigationBarItem(
                                      icon: Icon(Icons.code),
                                      label: 'Projects',
                                    ),
                                    BottomNavigationBarItem(
                                      icon: Icon(Icons.contact_mail),
                                      label: 'Contact',
                                    ),
                                  ],
                                ),
                              )
                            : null,
                        body: Row(
                          children: [
                            if (AppUtil.getMqWidth(context) >= AppConstants.mediumScreenWidth)
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: NavigationRail(
                                  backgroundColor: theme.colorsTheme.navBar,
                                  onDestinationSelected: (int index) {
                                    setState(() {
                                      viewModel.navigateTo(index);
                                    });
                                  },
                                  destinations: const [
                                    NavigationRailDestination(
                                      padding: EdgeInsets.all(8),
                                      icon: Icon(
                                        Icons.home_outlined,
                                        size: 35,
                                      ),
                                      label: Text('Home'),
                                    ),
                                    NavigationRailDestination(
                                      padding: EdgeInsets.all(8),
                                      icon: Icon(
                                        Icons.person_outlined,
                                        size: 35,
                                      ),
                                      label: Text('About'),
                                    ),
                                    NavigationRailDestination(
                                      padding: EdgeInsets.all(8),
                                      icon: Icon(
                                        Icons.timeline_outlined,
                                        size: 35,
                                      ),
                                      label: Text('Experience'),
                                    ),
                                    NavigationRailDestination(
                                      padding: EdgeInsets.all(8),
                                      icon: Icon(
                                        Icons.work_outlined,
                                        size: 35,
                                      ),
                                      label: Text('Internship'),
                                    ),
                                    NavigationRailDestination(
                                      padding: EdgeInsets.all(8),
                                      icon: Icon(
                                        Icons.code_outlined,
                                        size: 35,
                                      ),
                                      label: Text('Projects'),
                                    ),
                                    NavigationRailDestination(
                                      padding: EdgeInsets.all(8),
                                      icon: Icon(
                                        Icons.contact_mail_outlined,
                                        size: 35,
                                      ),
                                      label: Text('Contact'),
                                    ),
                                  ],
                                  labelType: NavigationRailLabelType.all,
                                  selectedIconTheme: IconThemeData(
                                    color: theme.colorsTheme.neonColor,
                                  ),
                                  selectedLabelTextStyle: theme.coreTextTheme.bodyNormal.copyWith(
                                    color: theme.colorsTheme.neonColor,
                                  ),
                                  unselectedLabelTextStyle: theme.coreTextTheme.bodyNormal.copyWith(
                                    color: theme.colorsTheme.neonColor.withOpacity(0.5),
                                  ),
                                  leading: Column(
                                    children: [
                                      const SizedBox(height: 8),
                                      SvgIcon(
                                        svgAsset: ThemeAssets.portfolioLogo(context),
                                        size: 80,
                                        color: theme.colorsTheme.neonColor,
                                      )
                                    ],
                                  ),
                                  selectedIndex: widget.currentIndex,
                                ),
                              ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: widget.child,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
