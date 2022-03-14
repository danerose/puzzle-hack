//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:gap/gap.dart';
import 'package:puzzle_hack/core/layout/responsive_gap.dart';

//Layout
import 'package:puzzle_hack/core/layout/responsive_layout_builder.dart';


//Component
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/view/components/balls_share_buttom_component.dart';

//widget
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/builder/balls_share_dialog_animated_builder.dart';

class BallsShareYourScoreComponent extends StatelessWidget {
  const BallsShareYourScoreComponent({
    Key? key,
    required this.animation,
  }) : super(key: key);

  /// The entry animation of this widget.
  final BallsShareDialogEnterAnimation animation;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, child) => child!,
      medium: (_, child) => child!,
      large: (_, child) => child!,
      child: (currentSize) {
        return Column(
          key: const Key('balls_share_your_score'),
          crossAxisAlignment: currentSize == ResponsiveLayoutSize.large
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: animation.shareYourScoreOffset,
              child: Opacity(
                opacity: animation.shareYourScoreOpacity.value,
                child: Column(
                  crossAxisAlignment:currentSize == ResponsiveLayoutSize.large
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Thank you for playing!',
                      key: const Key('balls_share_your_score_title'),
                      textAlign:  currentSize == ResponsiveLayoutSize.large
                        ? TextAlign.left
                        : TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    SizedBox(
                      width: currentSize == ResponsiveLayoutSize.large
                        ? double.infinity
                        : (currentSize == ResponsiveLayoutSize.medium 
                        ? 434.0 : 307.0),
                      child: Text(
                        'If you want, you can follow me on Twitter, i will'
                        ' publish the code there after the results',
                        key: const Key('balls_share_your_score_message'),
                        textAlign: currentSize == ResponsiveLayoutSize.large
                          ? TextAlign.left
                          : TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const ResponsiveGap(
              small: 40,
              medium: 40,
              large: 24,
            ),
            SlideTransition(
              position: animation.socialButtonsOffset,
              child: Opacity(
                opacity: animation.socialButtonsOpacity.value,
                child: Row(
                  mainAxisAlignment: currentSize == ResponsiveLayoutSize.large
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                  children: const [
                    BallsTwitterButton(),
                    Gap(16),
                    // BallsGitHubButton(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
