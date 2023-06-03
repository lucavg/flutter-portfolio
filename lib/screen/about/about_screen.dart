import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/util/responsive.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:my_flutter_portfolio/widget/general/pages/about/about_mobile.dart';
import 'package:my_flutter_portfolio/widget/general/pages/about/about_tablet.dart';
import 'package:my_flutter_portfolio/widget/general/pages/about/about_web.dart';

@GetXRoute(
  navigationType: NavigationType.popAndPush,
)
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobileView: AboutMobile(),
      tabView: AboutTablet(),
      webView: AboutWeb(),
    );
  }
}
