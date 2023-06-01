import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/styles/theme_assets.dart';
import 'package:my_flutter_portfolio/styles/theme_colors.dart';
import 'package:my_flutter_portfolio/util/keys.dart';
import 'package:my_flutter_portfolio/widget/general/action/action_item.dart';
import 'package:my_flutter_portfolio/widget/provider/data_provider_widget.dart';

class MFPBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;

  const MFPBackButton.light({
    required this.onClick,
    this.fullScreen = false,
    Key? key,
  })  : isLight = true,
        super(key: key);

  const MFPBackButton.dark({
    required this.onClick,
    this.fullScreen = false,
    Key? key,
  })  : isLight = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => ActionItem(
        key: Keys.backButton,
        svgAsset: getCorrectIcon(context),
        color: isLight ? ThemeColors.white : theme.colorsTheme.primary,
        onClick: onClick,
      ),
    );
  }

  String getCorrectIcon(BuildContext context) {
    if (fullScreen) {
      return ThemeAssets.closeIcon(context);
    }
    return ThemeAssets.backIcon(context);
  }
}
