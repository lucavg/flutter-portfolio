import 'package:flutter/material.dart';
import 'package:flutter_template/util/locale/Localization.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:provider/provider.dart';

class SelectLanguageDialog extends StatelessWidget {
  final VoidCallback goBack;

  const SelectLanguageDialog({
    required this.goBack,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalViewModel = Provider.of<GlobalViewModel>(context);
    return DataProviderWidget(
      childBuilderLocalization: (context, localization) => AlertDialog(
        title: Text(Localization.debugLocaleSelector),
        content: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width / 1.2,
          child: ListView(
            shrinkWrap: true,
            children: [
              SelectorItem(
                title: Localization.generalLabelSystemDefault,
                selected: globalViewModel.isLanguageSelected(null),
                onClick: () {
                  globalViewModel.onSwitchToSystemLanguage();
                  goBack();
                },
              ),
              SelectorItem(
                title: 'English',
                selected: globalViewModel.isLanguageSelected('en'),
                onClick: () {
                  globalViewModel.onSwitchToEnglish();
                  goBack();
                },
              ),
              SelectorItem(
                title: 'Nederlands',
                selected: globalViewModel.isLanguageSelected('nl'),
                onClick: () {
                  globalViewModel.onSwitchToDutch();
                  goBack();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
