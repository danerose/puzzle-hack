class DurationHelper {
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  static String getDurationLabel(Duration duration) {
    return '${duration.inHours.toString()} hours '
    '${duration.inMinutes.remainder(60).toString()} minutes '
    '${duration.inSeconds.remainder(60).toString()} seconds ';
  }

}
