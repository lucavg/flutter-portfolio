import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/util/responsive.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:my_flutter_portfolio/widget/general/pages/experience/experience_mobile.dart';
import 'package:my_flutter_portfolio/widget/general/pages/experience/experience_tablet.dart';
import 'package:my_flutter_portfolio/widget/general/pages/experience/experience_web.dart';

@GetXRoute(
  navigationType: NavigationType.popAndPush,
)
class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => ExperienceScreenState();
}

class ExperienceScreenState extends State<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobileView: ExperienceMobile(),
      tabView: ExperienceTablet(),
      webView: ExperienceWeb(),
    );
  }
}
