import 'package:rpmtw_dart_common_library/src/util/rpmtw_util.dart';

extension DurationExtension on Duration {
  /// See also [RPMTWUtil.formatDuration]
  String format({
    required String i18nDay,
    required String i18nHour,
    required String i18nMinute,
    required String i18nSecond,
    bool forceShowSeconds = false,
    bool forceShowMinutes = false,
    bool forceShowHours = false,
    bool forceShowDays = false,
    bool abbreviate = false,
  }) =>
      RPMTWUtil.formatDuration(this,
          i18nDay: i18nDay,
          i18nHour: i18nHour,
          i18nMinute: i18nMinute,
          i18nSecond: i18nSecond,
          forceShowSeconds: forceShowSeconds,
          forceShowMinutes: forceShowMinutes,
          forceShowHours: forceShowHours,
          forceShowDays: forceShowDays,
          abbreviate: abbreviate);
}
