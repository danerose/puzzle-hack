//Flutter
import 'package:flutter/material.dart';
import 'package:puzzle_hack/app/flows/home/view/widget/menu_widget.dart';

//Layout
import 'package:puzzle_hack/core/layout/reponsive/responsive_layout_builder.dart';

//Component
import 'package:puzzle_hack/core/components/common/flutter_logo_component.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ResponsiveLayoutBuilder(
        small: (BuildContext context, Widget? child) {
          return Stack(
            children: const [
              Align(
                child: FlutterLogoComponent(
                  isColored: false,
                ),
              )
            ],
          );
        },
        medium: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                FlutterLogoComponent(
                  isColored: false,
                ),
                MenuWidget()
              ],
            ),
          );
        },
        large: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                FlutterLogoComponent(
                  isColored: false,
                ),
                MenuWidget()
              ],
            ),
          );
        },
      ),
    );
  }
}
