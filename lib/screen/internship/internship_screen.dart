import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/util/responsive.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:my_flutter_portfolio/widget/general/pages/internship/internship_mobile.dart';
import 'package:my_flutter_portfolio/widget/general/pages/internship/internship_tablet.dart';
import 'package:my_flutter_portfolio/widget/general/pages/internship/internship_web.dart';

@GetXRoute(
  navigationType: NavigationType.popAndPush,
)
class InternshipScreen extends StatefulWidget {
  const InternshipScreen({super.key});

  @override
  State<InternshipScreen> createState() => InternshipScreenState();
}

class InternshipScreenState extends State<InternshipScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobileView: InternshipMobile(),
      tabView: InternshipTablet(),
      webView: InternshipWeb(),
    );
  }
}
