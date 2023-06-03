import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/util/responsive.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:my_flutter_portfolio/widget/general/pages/projects/projects_mobile.dart';
import 'package:my_flutter_portfolio/widget/general/pages/projects/projects_tablet.dart';
import 'package:my_flutter_portfolio/widget/general/pages/projects/projects_web.dart';

@GetXRoute(
  navigationType: NavigationType.popAndPush,
)
class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobileView: ProjectsMobile(),
      tabView: ProjectsTablet(),
      webView: ProjectsWeb(),
    );
  }
}
