import 'package:rpmtw_dart_common_library/rpmtw_dart_common_library.dart';
import 'package:test/test.dart';

void main() {
  test('get UTC+0 time', () {
    DateTime time = RPMTWUtil.getUTCTime();

    expect(time.isUtc, true);
    expect(time.timeZoneOffset, Duration(hours: 0));
    expect(time.timeZoneName, 'UTC');
  });

  group('format duration', () {
    test('general', () {
      String str = RPMTWUtil.formatDuration(
        Duration(days: 4, hours: 5, minutes: 3, seconds: 2),
        i18nDay: 'days',
        i18nHour: 'hours',
        i18nMinute: 'minutes',
        i18nSecond: 'seconds',
      );

      expect(str, '4 days 5 hours 3 minutes 2 seconds');
    });

    test('abbreviate', () {
      String str = RPMTWUtil.formatDuration(
        Duration(days: 4, hours: 5, minutes: 3, seconds: 2),
        i18nDay: 'days',
        i18nHour: 'hours',
        i18nMinute: 'minutes',
        i18nSecond: 'seconds',
        abbreviate: true,
      );

      expect(str, '4d 5h 3m 2s');
    });

    test('force show seconds', () {
      String str = RPMTWUtil.formatDuration(
        Duration(days: 4, hours: 5, minutes: 3, seconds: 0),
        i18nDay: 'days',
        i18nHour: 'hours',
        i18nMinute: 'minutes',
        i18nSecond: 'seconds',
        forceShowSeconds: true,
      );

      expect(str, '4 days 5 hours 3 minutes 0 seconds');
    });

    test('force show minutes', () {
      String str = RPMTWUtil.formatDuration(
        Duration(days: 4, hours: 5, minutes: 0, seconds: 0),
        i18nDay: 'days',
        i18nHour: 'hours',
        i18nMinute: 'minutes',
        i18nSecond: 'seconds',
        forceShowMinutes: true,
      );

      expect(str, '4 days 5 hours 0 minutes');
    });

    test('force show hours', () {
      String str = RPMTWUtil.formatDuration(
        Duration(),
        i18nDay: 'days',
        i18nHour: 'hours',
        i18nMinute: 'minutes',
        i18nSecond: 'seconds',
        forceShowHours: true,
      );

      expect(str, '0 hours');
    });

    test('force show days', () {
      String str = RPMTWUtil.formatDuration(
        Duration(days: 0),
        i18nDay: 'days',
        i18nHour: 'hours',
        i18nMinute: 'minutes',
        i18nSecond: 'seconds',
        forceShowDays: true,
      );

      expect(str, '0 days');
    });

    test('force show all', () {
      String str = RPMTWUtil.formatDuration(Duration(),
          i18nDay: 'days',
          i18nHour: 'hours',
          i18nMinute: 'minutes',
          i18nSecond: 'seconds',
          forceShowSeconds: true,
          forceShowMinutes: true,
          forceShowHours: true,
          forceShowDays: true);

      expect(str, '0 days 0 hours 0 minutes 0 seconds');
    });

    test('force show all with abbreviate', () {
      String str = RPMTWUtil.formatDuration(
        Duration(),
        i18nDay: 'days',
        i18nHour: 'hours',
        i18nMinute: 'minutes',
        i18nSecond: 'seconds',
        forceShowSeconds: true,
        forceShowMinutes: true,
        forceShowHours: true,
        forceShowDays: true,
        abbreviate: true,
      );

      expect(str, '0d 0h 0m 0s');
    });

    test('over 24 hours', () {
      String str = RPMTWUtil.formatDuration(
        Duration(hours: 25),
        i18nDay: 'days',
        i18nHour: 'hours',
        i18nMinute: 'minutes',
        i18nSecond: 'seconds',
      );

      expect(str, '1 days 1 hours');
    });
  });
}
