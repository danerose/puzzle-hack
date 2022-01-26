//Flutter
import 'package:flutter/material.dart';

//Themes

//Layout
import 'package:puzzle_hack/core/layout/reponsive/responsive_layout_builder.dart';

class FlutterLogoComponent extends StatelessWidget {
  const FlutterLogoComponent({
    Key? key,
    this.isColored = true,
    this.height,
  }) : super(key: key);


  /// The optional height of this logo.
  final bool isColored;
  final double? height;

  @override
  Widget build(BuildContext context) {

    return AnimatedSwitcher(
      duration:const  Duration(milliseconds: 530),
      child: height != null
        ? Image.asset(
            'assets/logo/logo_flutter_${isColored?'color':'white'}.png',
            height: height,
          )
        : ResponsiveLayoutBuilder(
            key: Key('assets/logo/logo_flutter_${isColored?'color':'white'}.png'),
            small: (_, __) => Image.asset(
              'assets/logo/logo_flutter_${isColored?'color':'white'}.png',
              height: 24,
            ),
            medium: (_, __) => Image.asset(
              'assets/logo/logo_flutter_${isColored ?'color':'white'}.png',
              height: 29,
            ),
            large: (_, __) => Image.asset(
              'assets/logo/logo_flutter_${isColored ?'color':'white'}.png',
              height: 32,
            ),
          ),
    );
  }
}
