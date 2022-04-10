import 'package:rpmtw_dart_common_library/src/util/rpmtw_util.dart';

extension DurationExtension on Duration {
  String format(
          {required String i18nHours,
          required String i18nMinutes,
          required String i18nSeconds}) =>
      RPMTWUtil.formatDuration(this,
          i18nHours: i18nHours,
          i18nMinutes: i18nMinutes,
          i18nSeconds: i18nSeconds);
}
