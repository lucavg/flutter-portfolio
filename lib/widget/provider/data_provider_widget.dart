import 'package:flutter/widgets.dart';
import 'package:my_flutter_portfolio/styles/theme_data.dart';
import 'package:my_flutter_portfolio/util/locale/localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DataProviderWidget extends BaseThemeProviderWidget<MFPTheme, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, MFPTheme theme)? childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)? childBuilderLocalization,
    Widget Function(BuildContext context, MFPTheme theme, Localization localization)? childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
