import 'package:flutter/widgets.dart';
import 'package:my_flutter_portfolio/styles/theme_data.dart';
import 'package:my_flutter_portfolio/util/locale/localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

L _getLocale<L>(BuildContext context) => Localization.of(context) as L;

T _getTheme<T>(BuildContext context) => MFPTheme.of(context) as T;

Future<void> initArchitecture() async {
  await OsInfo.init();
  localizationLookup = _getLocale;
  themeLookup = _getTheme;
}
