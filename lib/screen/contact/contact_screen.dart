import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/util/responsive.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:my_flutter_portfolio/widget/general/pages/contact/contact_mobile.dart';
import 'package:my_flutter_portfolio/widget/general/pages/contact/contact_tablet.dart';
import 'package:my_flutter_portfolio/widget/general/pages/contact/contact_web.dart';

@GetXRoute(
  navigationType: NavigationType.popAndPush,
)
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobileView: ContactMobile(),
      tabView: ContactTablet(),
      webView: ContactWeb(),
    );
  }
}
