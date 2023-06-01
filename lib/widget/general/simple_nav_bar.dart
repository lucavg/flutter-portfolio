import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/widget/provider/data_provider_widget.dart';

class SimpleNavBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? leading;
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double elevation;
  final bool centerTitle;

  const SimpleNavBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor,
    this.elevation = 0.0,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen = true;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: isLargeScreen
                ? Row(
                    children: [
                      if (leading != null)
                        Row(
                          children: leading!,
                        ),
                      if (title != null) ...[
                        const SizedBox(width: 16),
                        Text(
                          title!,
                          textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                          style: theme.coreTextTheme.titleBig,
                        ),
                      ],
                      if (actions != null)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                              actions!.length,
                              (index) {
                                final action = actions![index];
                                if (index == 0) {
                                  return SizedBox(
                                    width: 100,
                                    child: action,
                                  );
                                } else {
                                  return Row(
                                    children: [
                                      const SizedBox(width: 16),
                                      SizedBox(
                                        width: 100,
                                        child: action,
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                    ],
                  )
                : Column(
                    children: [
                      if (leading != null)
                        Column(
                          children: leading!,
                        ),
                      if (title != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          title!,
                          textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                          style: theme.coreTextTheme.titleBig,
                        ),
                      ],
                      if (actions != null) ...[
                        const SizedBox(height: 16),
                        if (actions != null)
                          Expanded(
                            child: Column(
                              children: List.generate(
                                actions!.length,
                                (index) {
                                  final action = actions![index];
                                  if (index == 0) {
                                    return SizedBox(
                                      width: 100,
                                      child: action,
                                    );
                                  } else {
                                    return Row(
                                      children: [
                                        const SizedBox(height: 16),
                                        SizedBox(
                                          width: 100,
                                          child: action,
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                      ],
                    ],
                  ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
