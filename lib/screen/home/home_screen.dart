import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigator.get_x_navigator.dart';
import 'package:flutter_template/navigator/middle_ware/analytics_permission_guard.dart';
import 'package:flutter_template/navigator/middle_ware/authentication_guard.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@GetXRoute(
  navigationType: NavigationType.popAllAndPush,
  middlewares: [
    AuthenticationGuard,
    AnalyticsPermissionGuard,
  ],
)
class HomeScreen extends StatefulWidget {
  static const String routeName = RouteNames.homeScreen;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [],
      ),
      bottomNavigationBar: DataProviderWidget(
        childBuilder: (context, theme, localization) => BottomNavigationBar(
          onTap: _onTap,
          currentIndex: _currentIndex,
          backgroundColor: theme.colorsTheme.bottomNavbarBackground,
          selectedItemColor: theme.colorsTheme.bottomNavbarItemActive,
          unselectedItemColor: theme.colorsTheme.bottomNavbarItemInactive,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.list),
              label: localization.todoTitle,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: localization.settingsTitle,
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int newIndex) {
    setState(() => _currentIndex = newIndex);
  }
}
