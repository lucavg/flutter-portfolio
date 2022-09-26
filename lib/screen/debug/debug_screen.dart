import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/navigator/route_names.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/util/locale/Localization.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_template/widget/debug/debug_row_title.dart';
import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:provider/provider.dart';

class DebugScreen extends StatefulWidget {
  static const String routeName = RouteNames.debugScreen;

  const DebugScreen({
    Key? key,
  }) : super(key: key);

  @override
  DebugScreenState createState() => DebugScreenState();
}

@visibleForTesting
class DebugScreenState extends State<DebugScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugViewModel>(
      consumerWithThemeAndLocalization: (context, viewModel, child, _, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(Localization.settingsTitle),
        ),
        body: ResponsiveWidget(
          builder: (context, info) => ListView(
            children: [
              DebugRowTitle(title: Localization.debugAnimationsTitle),
              DebugRowSwitchItem(
                key: Keys.debugSlowAnimations,
                title: Localization.debugSlowAnimations,
                value: viewModel.slowAnimationsEnabled,
                onChanged: viewModel.onSlowAnimationsChanged,
              ),
              DebugRowTitle(title: Localization.debugThemeTitle),
              DebugRowItem(
                key: Keys.debugTargetPlatform,
                title: Localization.debugTargetPlatformTitle,
                subTitle: Localization.debugTargetPlatformSubtitle(Localization.getTranslation(Provider.of<GlobalViewModel>(context).getCurrentPlatform())),
                onClick: viewModel.onTargetPlatformClicked,
              ),
              DebugRowItem(
                key: Keys.debugThemeMode,
                title: Localization.debugThemeModeTitle,
                subTitle: Localization.debugThemeModeSubtitle,
                onClick: viewModel.onThemeModeClicked,
              ),
              DebugRowTitle(title: Localization.debugLocaleTitle),
              DebugRowItem(
                key: Keys.debugSelectLanguage,
                title: Localization.debugLocaleSelector,
                subTitle: Localization.debugLocaleCurrentLanguage(Provider.of<GlobalViewModel>(context).getCurrentLanguage()),
                onClick: viewModel.onSelectLanguageClicked,
              ),
              DebugRowSwitchItem(
                key: Keys.debugShowTranslations,
                title: Localization.debugShowTranslations,
                value: Provider.of<GlobalViewModel>(context, listen: false).showsTranslationKeys,
                onChanged: (_) => Provider.of<GlobalViewModel>(context, listen: false).toggleTranslationKeys(),
              ),
              DebugRowTitle(title: Localization.debugLicensesTitle),
              DebugRowItem(
                key: Keys.debugLicense,
                title: Localization.debugLicensesGoTo,
                onClick: viewModel.onLicensesClicked,
              ),
              DebugRowTitle(title: Localization.debugDatabase),
              DebugRowItem(
                key: Keys.debugDatabase,
                title: Localization.debugViewDatabase,
                onClick: viewModel.goToDatabase,
              ),
            ],
          ),
        ),
      ),
      create: () => GetIt.I()..init(),
    );
  }
}
