import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/util/env/flavor_config.dart';
import 'package:my_flutter_portfolio/widget/provider/data_provider_widget.dart';

class MFPProgressIndicator extends StatelessWidget {
  final bool dark;

  const MFPProgressIndicator({
    required this.dark,
    super.key,
  });

  const MFPProgressIndicator.dark({Key? key})
      : dark = true,
        super(key: key);

  const MFPProgressIndicator.light({Key? key})
      : dark = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        if (FlavorConfig.isInTest()) {
          return Container(
            color: theme.colorsTheme.accent,
            height: 50,
            width: 50,
            child: const Text(
              'CircularProgressIndicator',
              style: TextStyle(fontSize: 8),
            ),
          );
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(dark ? theme.colorsTheme.progressIndicator : theme.colorsTheme.inverseProgressIndicator),
        );
      },
    );
  }
}
