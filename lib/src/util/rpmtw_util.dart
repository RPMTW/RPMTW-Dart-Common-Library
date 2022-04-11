/// Utility functions for RPMTW.
class RPMTWUtil {
  /// Get the now time in UTC+0 time zone.
  static DateTime getUTCTime() {
    return DateTime.now().toUtc();
  }

  /// Format the [duration] as a readable string.
  /// [i18nDay], [i18nHour], [i18nMinute], [i18nSecond] are used to translate `hours`, `minutes` and `seconds`
  ///
  /// [abbreviate] is used to abbreviate the duration. (e.g. `hours` -> `h`, `minutes` -> `m`, `seconds` -> `s`)
  static String formatDuration(
    Duration duration, {
    required String i18nDay,
    required String i18nHour,
    required String i18nMinute,
    required String i18nSecond,
    bool forceShowSeconds = false,
    bool forceShowMinutes = false,
    bool forceShowHours = false,
    bool forceShowDays = false,
    bool abbreviate = false,
  }) {
    String str = '';
    final int days = duration.inDays;
    final int hours = duration.inHours.remainder(Duration.hoursPerDay);
    final int minutes = duration.inMinutes.remainder(Duration.minutesPerHour);
    final int seconds = duration.inSeconds.remainder(Duration.secondsPerMinute);

    if (days > 0 || forceShowDays) {
      if (abbreviate) {
        str += '${days}d ';
      } else {
        str += '$days $i18nDay ';
      }
    }

    if (hours > 0 || forceShowHours) {
      if (abbreviate) {
        str += '${hours}h ';
      } else {
        str += '$hours $i18nHour ';
      }
    }
    if (minutes > 0 || forceShowMinutes) {
      if (abbreviate) {
        str += '${minutes}m ';
      } else {
        str += '$minutes $i18nMinute ';
      }
    }
    if (seconds > 0 || forceShowSeconds) {
      if (abbreviate) {
        str += '${seconds}s';
      } else {
        str += '$seconds $i18nSecond ';
      }
    }

    return str.trimRight();
  }
}
