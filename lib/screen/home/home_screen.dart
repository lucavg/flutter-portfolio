import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/util/responsive.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:my_flutter_portfolio/widget/general/pages/home/home_mobile.dart';
import 'package:my_flutter_portfolio/widget/general/pages/home/home_tablet.dart';
import 'package:my_flutter_portfolio/widget/general/pages/home/home_web.dart';

@GetXRoute(
  navigationType: NavigationType.popAndPush,
)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobileView: HomeMobile(),
      tabView: HomeTablet(),
      webView: HomeWeb(),
    );
  }
}
