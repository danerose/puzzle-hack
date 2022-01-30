//Flutter
import 'package:flutter/material.dart';

import 'package:puzzle_hack/app/flows/home/view/components/menu_component.dart';
import 'package:puzzle_hack/core/components/common/flutter_logo_component.dart';

import 'package:puzzle_hack/core/widget/audio/audio_control.dart';

import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ResponsiveLayoutBuilder(
        small: (context, child) => Stack(
          children: [
            const Align(
              child: FlutterLogoComponent(
                isColored: false,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 34),
                child: AudioControl(
                  key: GlobalKey(debugLabel: 'audio_control'),
                ),
              ),
            ),
          ],
        ),
        medium: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FlutterLogoComponent(
                isColored: false,
              ),
              MenuComponent()
            ],
          ),
        ),
        large: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FlutterLogoComponent(
                isColored: false,
              ),
              MenuComponent()
            ],
          ),
        ),
      ),
    );
  }
}
