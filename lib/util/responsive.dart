import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/utils/screen_type.dart';
import 'package:my_flutter_portfolio/util/app_util.dart';

class Responsive extends StatefulWidget {
  final Widget mobileView, webView, tabView;

  const Responsive({
    super.key,
    required this.mobileView,
    required this.tabView,
    required this.webView,
  });

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    final scrType = AppUtil().getScreenType(context);
    switch (scrType) {
      case ScreenType.mobile:
        return widget.mobileView;
      case ScreenType.tab:
        return widget.tabView;
      case ScreenType.web:
        return widget.webView;
    }
  }
}
