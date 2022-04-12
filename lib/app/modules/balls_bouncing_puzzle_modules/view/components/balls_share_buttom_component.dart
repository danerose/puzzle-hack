//Darrt
import 'dart:async';

//Flutter
import 'package:flutter/material.dart';

//Dependencies
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

//Repository
import 'package:puzzle_hack/app/modules/balls_bouncing_puzzle_modules/data/repository/link_repository.dart';

//Extensions
import 'package:puzzle_hack/core/utils/extensions/audio_player_extension.dart';

//Widget
import 'package:puzzle_hack/core/widget/audio/audio_control_listener.dart';


/// The url to share for this Flutter Puzzle challenge.

class BallsTwitterButton extends StatelessWidget {
  const BallsTwitterButton({Key? key}) : super(key: key);

  String _twitterShareUrl(BuildContext context) {
    return 'https://twitter.com/AlexisAvalencia';
  }

  @override
  Widget build(BuildContext context) {
    return BallsShareButton(
      title: 'Twitter',
      icon: SvgPicture.asset(
        'assets/icons/icon_twitter.svg',
        width: 13.13,
        height: 10.67,
        color: Colors.white,
      ),
      color: const Color(0xFF13B9FD),
      onPressed: () => LinkRepository.openLink(_twitterShareUrl(context)),
    );
  }
}


class BallsGitHubButton extends StatelessWidget {
  const BallsGitHubButton({Key? key}) : super(key: key);

  String _gitHubShareUrl(BuildContext context) {
    return 'https://github.com/Shmuell';
  }

  @override
  Widget build(BuildContext context) {
    return BallsShareButton(
      title: 'GitHub',
      icon: SvgPicture.asset(
        'assets/icons/icon_github.svg',
        width: 6.56,
        height: 13.13,
        color: Colors.white,
      ),
      color: Colors.black,
      onPressed: () => LinkRepository.openLink(_gitHubShareUrl(context)),
    );
  }
}

class BallsShareButton extends StatefulWidget {
  const BallsShareButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
    required this.color,
    AudioPlayerFactory? audioPlayer,
  })  : _audioPlayerFactory = audioPlayer ?? getAudioPlayer,
        super(key: key);

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// The title of this button.
  final String title;

  /// The icon of this button.
  final Widget icon;

  /// The color of this button.
  final Color color;

  final AudioPlayerFactory _audioPlayerFactory;

  @override
  State<BallsShareButton> createState() => _BallsShareButtonState();
}

class _BallsShareButtonState extends State<BallsShareButton> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = widget._audioPlayerFactory()
      ..setAsset('assets/audio/click.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AudioControlListener(
      audioPlayer: _audioPlayer,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: widget.color),
          borderRadius: BorderRadius.circular(32),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            backgroundColor: Colors.transparent,
          ),
          onPressed: () async {
            widget.onPressed();
            unawaited(_audioPlayer.replay());
          },
          child: Row(
            children: [
              const Gap(12),
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  color: widget.color,
                  child: widget.icon,
                ),
              ),
              const Gap(10),
              Text(
                widget.title,
                style: const TextStyle(),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
