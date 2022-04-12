import 'package:flutter/material.dart';

import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, __) => Material(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: child,
        ),
      ),
      medium: (_, child) => child!,
      large: (_, child) => child!,
      child: (currentSize) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: SizedBox(
            width: currentSize == ResponsiveLayoutSize.large ? 740.0 : 700.0,
            child: child,
          ),
        );
      },
    );
  }
}
