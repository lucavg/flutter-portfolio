import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/styles/theme_data.dart';
import 'package:my_flutter_portfolio/styles/theme_durations.dart';
import 'package:my_flutter_portfolio/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

enum ButtonType {
  regular,
  text,
}

class MFPButton extends StatelessWidget {
  final String text;
  final double height;
  final bool isEnabled;
  final VoidCallback? onClick;
  final ButtonType buttonType;

  const MFPButton({
    required this.text,
    required this.onClick,
    this.height = 48,
    this.isEnabled = true,
    this.buttonType = ButtonType.regular,
    super.key,
  });

  const MFPButton.text({
    required this.text,
    required this.onClick,
    this.height = 48,
    this.isEnabled = true,
    this.buttonType = ButtonType.text,
    super.key,
  });

  TextStyle _enabledTextStyle(MFPTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.inverseCoreTextTheme.labelButtonSmall;
      case ButtonType.text:
        return theme.accentTextTheme.labelButtonSmall;
    }
  }

  TextStyle _disabledTextStyle(MFPTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.inverseCoreTextTheme.labelButtonSmall;
      case ButtonType.text:
        return theme.coreTextTheme.labelButtonSmallDisabled;
    }
  }

  Color? _enabledButtonColor(MFPTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.colorsTheme.buttonColor;
      case ButtonType.text:
        return null;
    }
  }

  Color? _disabledButtonColor(MFPTheme theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return theme.colorsTheme.disabled;
      case ButtonType.text:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        final content = Center(
          child: AnimatedDefaultTextStyle(
            style: isEnabled ? _enabledTextStyle(theme) : _disabledTextStyle(theme),
            duration: ThemeDurations.shortAnimationDuration(),
            child: Text(
              text,
            ),
          ),
        );
        if (context.isIOSTheme) {
          return TouchFeedBack(
            onClick: isEnabled ? onClick : null,
            child: AnimatedContainer(
              height: height,
              color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
              duration: ThemeDurations.shortAnimationDuration(),
              child: content,
            ),
          );
        }
        return AnimatedContainer(
          color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
          duration: ThemeDurations.shortAnimationDuration(),
          child: TouchFeedBack(
            onClick: isEnabled ? onClick : null,
            child: SizedBox(
              height: height,
              child: content,
            ),
          ),
        );
      },
    );
  }
}
