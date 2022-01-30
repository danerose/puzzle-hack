import 'dart:async';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:just_audio/just_audio.dart';
import 'package:puzzle_hack/app/modules/sakura_jp_puzzle_modules/data/repository/link_repository.dart';
import 'package:puzzle_hack/core/utils/extensions/audio_player_extension.dart';
import 'package:puzzle_hack/core/widget/audio/audio_control_listener.dart';


/// The url to share for this Flutter Puzzle challenge.
const _shareUrl = 'https://flutterhack.devpost.com/';


class SakuraTwitterButton extends StatelessWidget {
  /// {@macro Sakura_twitter_button}
  const SakuraTwitterButton({Key? key}) : super(key: key);

  String _twitterShareUrl(BuildContext context) {
    const shareText = 'Just solved the #FlutterPuzzleHack! Check it out ↓';
    final encodedShareText = Uri.encodeComponent(shareText);
    return 'https://twitter.com/intent/tweet?url=$_shareUrl&text=$encodedShareText';
  }

  @override
  Widget build(BuildContext context) {
    return SakuraShareButton(
      title: 'Twitter',
      icon: Image.asset(
        'assets/images/twitter_icon.png',
        width: 13.13,
        height: 10.67,
      ),
      color: const Color(0xFF13B9FD),
      onPressed: () => LinkRepository.openLink(_twitterShareUrl(context)),
    );
  }
}


class SakuraFacebookButton extends StatelessWidget {
  const SakuraFacebookButton({Key? key}) : super(key: key);

  String _facebookShareUrl(BuildContext context) {
    const shareText = 'Just solved the #FlutterPuzzleHack! Check it out ↓';
    final encodedShareText = Uri.encodeComponent(shareText);
    return 'https://www.facebook.com/sharer.php?u=$_shareUrl&quote=$encodedShareText';
  }

  @override
  Widget build(BuildContext context) {
    return SakuraShareButton(
      title: 'Facebook',
      icon: Image.asset(
        'assets/images/facebook_icon.png',
        width: 6.56,
        height: 13.13,
      ),
      color: const Color(0xFF0468D7),
      onPressed: () => LinkRepository.openLink(_facebookShareUrl(context)),
    );
  }
}

class SakuraShareButton extends StatefulWidget {
  /// {@macro Sakura_share_button}
  const SakuraShareButton({
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
  State<SakuraShareButton> createState() => _SakuraShareButtonState();
}

class _SakuraShareButtonState extends State<SakuraShareButton> {
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