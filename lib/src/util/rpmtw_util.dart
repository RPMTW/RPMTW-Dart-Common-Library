class RPMTWUtil {
  static String formatDuration(
    Duration duration, {
    required String i18nHours,
    required String i18nMinutes,
    required String i18nSeconds,
  }) {
    String str = '';
    final int hours = duration.inHours;
    final int minutes = duration.inMinutes.remainder(60);
    final int seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      str += '$hours $i18nHours ';
    }
    if (minutes > 0) {
      str += '$minutes $i18nMinutes ';
    }
    if (seconds > 0) {
      str += '$seconds $i18nSeconds';
    }

    return (str);
  }
}
