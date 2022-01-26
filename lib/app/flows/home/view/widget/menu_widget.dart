//Flutter
import 'package:flutter/material.dart';

//Layout
import 'package:puzzle_hack/core/layout/reponsive/responsive_layout_builder.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResponsiveLayoutBuilder(
          small: (_, child) => child!,
          medium: (_, child) => child!,
          large: (_, child) => child!,
          child: (currentSize) {
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
