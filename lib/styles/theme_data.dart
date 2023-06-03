import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/styles/theme_colors.dart';
import 'package:my_flutter_portfolio/styles/theme_fonts.dart';
import 'package:my_flutter_portfolio/util/theme/theme_config.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class MFPThemeData {
  MFPThemeData._();

  static final _darkThemeData = ThemeData(
    fontFamily: ThemeFonts.body,
    primaryColor: ThemeColors.primary,
    colorScheme: const ColorScheme(
      primary: ThemeColors.primary,
      primaryContainer: ThemeColors.primaryDark,
      onPrimary: ThemeColors.white,
      secondary: ThemeColors.accent,
      secondaryContainer: ThemeColors.accent,
      onSecondary: ThemeColors.white,
      surface: ThemeColors.backgroundGrey,
      onBackground: ThemeColors.primary,
      onSurface: ThemeColors.primary,
      background: ThemeColors.backgroundGrey,
      onError: ThemeColors.primaryDark,
      brightness: Brightness.light,
      error: ThemeColors.error,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeColors.accent,
      selectionHandleColor: ThemeColors.accent,
      selectionColor: ThemeColors.accent.withOpacity(0.4),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: isInTest ? const FadeUpwardsPageTransitionsBuilder() : BaseThemeData.getCorrectPageTransitionBuilder(OsInfo.instance),
      },
    ),
  );

  static final _lightThemeData = _darkThemeData.copyWith();

  static ThemeData darkTheme(TargetPlatform? targetPlatform) {
    return _darkThemeData.copyWith(platform: targetPlatform);
  }

  static ThemeData lightTheme(TargetPlatform? targetPlatform) {
    return _lightThemeData.copyWith(platform: targetPlatform);
  }
}

class MFPTextTheme {
  final TextStyle titleHuge;
  final TextStyle titleBig;
  final TextStyle titleNormal;
  final TextStyle titleSmall;

  final TextStyle titleListItem;

  final TextStyle appBarAction;

  final TextStyle labelButtonBig;
  final TextStyle labelButtonBigDisabled;
  final TextStyle labelButtonSmall;
  final TextStyle labelButtonSmallDisabled;

  final TextStyle bodyNormal;
  final TextStyle bodySmall;
  final TextStyle bodyUltraSmall;
  final TextStyle infoBodySubHeader;
  final TextStyle bodyBig;

  const MFPTextTheme({
    required this.titleHuge,
    required this.titleBig,
    required this.titleNormal,
    required this.titleSmall,
    required this.titleListItem,
    required this.appBarAction,
    required this.labelButtonBig,
    required this.labelButtonBigDisabled,
    required this.labelButtonSmall,
    required this.labelButtonSmallDisabled,
    required this.bodyNormal,
    required this.bodySmall,
    required this.bodyUltraSmall,
    required this.infoBodySubHeader,
    required this.bodyBig,
  });
}

class MFPTextThemeExceptions {
  const MFPTextThemeExceptions();
}

class MFPColorsTheme {
  final Color text;
  final Color inverseText;
  final Color neonColor;
  final Color cardColor;
  final Color errorText;
  final Color buttonTextDisabled;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color navBar;
  final Color navBarIcon;
  final Color background;
  final Color permissionScreenBackground;
  final Color inverseBackground;
  final Color disabled;
  final Color icon;
  final Color appBarAction;
  final Color inverseIcon;
  final Color inverseProgressIndicator;
  final Color progressIndicator;
  final Color buttonColor;
  final Color buttonText;
  final Color inverseButtonText;
  final Color textButtonText;

  final Color bottomNavbarBackground;
  final Color bottomNavbarItemActive;
  final Color bottomNavbarItemInactive;

  final Color inputFieldFill;
  final Color inputFieldHint;
  final Color inputFieldBorderEnabled;
  final Color inputFieldBorderFocused;
  final Color inputFieldBorderIdle;
  final Color inputFieldCursor;

  final Color debugTitleBackground;

  const MFPColorsTheme({
    required this.primary,
    required this.secondary,
    required this.neonColor,
    required this.cardColor,
    required this.accent,
    required this.navBar,
    required this.navBarIcon,
    required this.background,
    required this.permissionScreenBackground,
    required this.inverseBackground,
    required this.text,
    required this.inverseText,
    required this.errorText,
    required this.disabled,
    required this.icon,
    required this.appBarAction,
    required this.inverseIcon,
    required this.inverseProgressIndicator,
    required this.progressIndicator,
    required this.buttonColor,
    required this.buttonText,
    required this.inverseButtonText,
    required this.buttonTextDisabled,
    required this.textButtonText,
    required this.bottomNavbarBackground,
    required this.bottomNavbarItemActive,
    required this.bottomNavbarItemInactive,
    required this.inputFieldFill,
    required this.inputFieldHint,
    required this.inputFieldBorderEnabled,
    required this.inputFieldBorderFocused,
    required this.inputFieldBorderIdle,
    required this.inputFieldCursor,
    required this.debugTitleBackground,
  });
}

enum MFPThemeStyle {
  dark,
  light,
}

class MFPTheme {
  final MFPTextTheme coreTextTheme;
  final MFPTextTheme inverseCoreTextTheme;
  final MFPTextTheme accentTextTheme;
  final MFPTextThemeExceptions exceptionsTextTheme;
  final MFPColorsTheme colorsTheme;
  final bool isDarkTheme;

  bool get isLightTheme => !isDarkTheme;

  static final _instanceDark = _fromColorTheme(
    isDarkTheme: true,
    colorTheme: const MFPColorsTheme(
      text: ThemeColors.text,
      inverseText: ThemeColors.textLight,
      neonColor: ThemeColors.neonColor,
      cardColor: ThemeColors.cardColor,
      errorText: ThemeColors.error,
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      navBar: ThemeColors.nav,
      navBarIcon: ThemeColors.navIcon,
      secondary: ThemeColors.white,
      background: ThemeColors.background,
      permissionScreenBackground: ThemeColors.primary,
      inverseBackground: ThemeColors.white,
      disabled: ThemeColors.disabledGrey,
      icon: ThemeColors.white,
      appBarAction: ThemeColors.white,
      inverseIcon: ThemeColors.black,
      progressIndicator: ThemeColors.primary,
      inverseProgressIndicator: ThemeColors.white,
      buttonText: ThemeColors.primary,
      inverseButtonText: ThemeColors.white,
      buttonTextDisabled: ThemeColors.lightGrey,
      buttonColor: ThemeColors.neonColor,
      textButtonText: ThemeColors.white,
      bottomNavbarBackground: ThemeColors.primary,
      bottomNavbarItemActive: ThemeColors.white,
      bottomNavbarItemInactive: ThemeColors.white50,
      inputFieldFill: ThemeColors.black,
      inputFieldHint: ThemeColors.white50,
      inputFieldBorderEnabled: ThemeColors.white50,
      inputFieldBorderFocused: ThemeColors.white,
      inputFieldBorderIdle: ThemeColors.white50,
      inputFieldCursor: ThemeColors.accent,
      debugTitleBackground: ThemeColors.white20,
    ),
  );

  static final _instanceLight = _fromColorTheme(
    isDarkTheme: false,
    colorTheme: const MFPColorsTheme(
      text: ThemeColors.textLight,
      inverseText: ThemeColors.text,
      neonColor: ThemeColors.neonColor,
      cardColor: ThemeColors.cardColor,
      errorText: ThemeColors.error,
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      navBar: ThemeColors.navLight,
      navBarIcon: ThemeColors.navIconLight,
      secondary: ThemeColors.black,
      background: ThemeColors.white,
      permissionScreenBackground: ThemeColors.white,
      inverseBackground: ThemeColors.white,
      inputFieldFill: ThemeColors.white,
      inputFieldHint: ThemeColors.mediumGrey,
      disabled: ThemeColors.disabledGrey,
      icon: ThemeColors.primary,
      appBarAction: ThemeColors.textLight,
      inverseIcon: ThemeColors.black,
      progressIndicator: ThemeColors.primary,
      inverseProgressIndicator: ThemeColors.white,
      buttonText: ThemeColors.white,
      inverseButtonText: ThemeColors.primary,
      buttonTextDisabled: ThemeColors.lightGrey,
      buttonColor: ThemeColors.primary,
      textButtonText: ThemeColors.primary,
      bottomNavbarBackground: ThemeColors.white,
      bottomNavbarItemActive: ThemeColors.primary,
      bottomNavbarItemInactive: ThemeColors.mediumGrey,
      inputFieldBorderEnabled: ThemeColors.mediumGrey,
      inputFieldBorderFocused: ThemeColors.primary,
      inputFieldBorderIdle: ThemeColors.mediumGrey,
      inputFieldCursor: ThemeColors.accent,
      debugTitleBackground: ThemeColors.lightGrey,
    ),
  );

  static MFPTheme _fromColorTheme({
    required MFPColorsTheme colorTheme,
    required bool isDarkTheme,
  }) =>
      MFPTheme._(
        isDarkTheme: isDarkTheme,
        colorsTheme: colorTheme,
        coreTextTheme: MFPTextTheme(
          titleHuge: TextStyle(fontSize: 40, color: colorTheme.text, fontFamily: ThemeFonts.title, height: 1.2),
          titleBig: TextStyle(fontSize: 30, color: colorTheme.text, fontFamily: ThemeFonts.title, height: 1.2),
          titleNormal: TextStyle(fontSize: 24, color: colorTheme.text, fontFamily: ThemeFonts.title),
          titleSmall: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: ThemeFonts.title),
          titleListItem: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold),
          appBarAction: TextStyle(fontSize: 13, color: colorTheme.text, fontFamily: ThemeFonts.body),
          labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.text, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabled, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabled, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          bodyBig: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: ThemeFonts.body),
          bodyNormal: TextStyle(fontSize: 16, color: colorTheme.text, fontFamily: ThemeFonts.body),
          bodySmall: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: ThemeFonts.body),
          bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.text, fontFamily: ThemeFonts.body),
          infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600),
        ),
        inverseCoreTextTheme: MFPTextTheme(
          titleHuge: TextStyle(fontSize: 40, color: colorTheme.inverseText, fontFamily: ThemeFonts.title, height: 1.2),
          titleBig: TextStyle(fontSize: 30, color: colorTheme.inverseText, fontFamily: ThemeFonts.title, height: 1.2),
          titleNormal: TextStyle(fontSize: 24, color: colorTheme.inverseText, fontFamily: ThemeFonts.title),
          titleSmall: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: ThemeFonts.title),
          titleListItem: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold),
          appBarAction: TextStyle(fontSize: 13, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
          labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.inverseText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabled, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabled, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          bodyBig: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
          bodyNormal: TextStyle(fontSize: 16, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
          bodySmall: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
          bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.inverseText, fontFamily: ThemeFonts.body),
          infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600),
        ),
        accentTextTheme: MFPTextTheme(
          titleHuge: TextStyle(fontSize: 40, color: colorTheme.accent, fontFamily: ThemeFonts.title, height: 1.2),
          titleBig: TextStyle(fontSize: 30, color: colorTheme.accent, fontFamily: ThemeFonts.title, height: 1.2),
          titleNormal: TextStyle(fontSize: 24, color: colorTheme.accent, fontFamily: ThemeFonts.title),
          titleSmall: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: ThemeFonts.title),
          titleListItem: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold),
          appBarAction: TextStyle(fontSize: 13, color: colorTheme.accent, fontFamily: ThemeFonts.body),
          labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.accent, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabled, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabled, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
          bodyBig: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: ThemeFonts.body),
          bodyNormal: TextStyle(fontSize: 16, color: colorTheme.accent, fontFamily: ThemeFonts.body),
          bodySmall: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: ThemeFonts.body),
          bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.accent, fontFamily: ThemeFonts.body),
          infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600),
        ),
        exceptionsTextTheme: const MFPTextThemeExceptions(),
      );

  const MFPTheme._({
    required this.coreTextTheme,
    required this.inverseCoreTextTheme,
    required this.accentTextTheme,
    required this.exceptionsTextTheme,
    required this.colorsTheme,
    required this.isDarkTheme,
  });

  static MFPTheme of(BuildContext context, {bool forceDark = false, bool forceLight = false}) {
    if (forceDark) return _instanceDark;
    if (forceLight) return _instanceLight;
    final themeConfigUtil = getIt<ThemeConfigUtil>();

    final theme = themeConfigUtil.themeMode;
    if (theme == ThemeMode.dark) {
      return _instanceDark;
    } else if (theme == ThemeMode.light) {
      return _instanceLight;
    }
    final brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) return _instanceDark;

    return _instanceLight;
  }
}
