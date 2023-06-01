import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_portfolio/model/utils/screen_type.dart';
import 'package:url_launcher/url_launcher.dart';

@lazySingleton
class AppUtil {
  ScrollController controller = ScrollController();

  /* URL */
  static const resumeDownloadURL = '''https://jeeva-portfolio.s3.amazonaws.com/JEEVANANDHAM's+Resume.pdf''';

  static const gitSafeC19 = '''https://github.com/jeeva-HBK/SafeC19''';

  // static final gitHermarts = '''https://github.com/jeeva-HBK/SafeC19''';
  static const gitWtIot = '''https://github.com/jeeva-HBK/AutoChem''';
  static const gitAutoStabilizer = '''https://github.com/jeeva-HBK/AutoStabilizer''';
  static const gitPAT = '''https://github.com/jeeva-HBK/PAT''';

  // static final gitAVM = '''https://github.com/jeeva-HBK/SafeC19''';
  static double getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static ScreenType getScreenType(BuildContext context) {
    final scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  static void downloadResume(BuildContext context) async {
    await launchUrl(Uri.parse(AppUtil.resumeDownloadURL));
  }
}
