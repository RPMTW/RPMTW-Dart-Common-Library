import 'dart:async';

import 'package:rpmtw_dart_common_library/rpmtw_dart_common_library.dart';
import 'package:test/test.dart';

String _logs = '';

void main() {
  test('log a message at verbose level', overridePrint(() {
    RPMTWLogger.verbose(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi auctor aliquam blandit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed rhoncus felis massa, sed dapibus ante pharetra semper. Praesent pharetra quis est vitae faucibus. Vestibulum tristique ipsum enim, interdum accumsan ligula rutrum vitae. Quisque nec maximus sem. Fusce faucibus laoreet faucibus. Praesent elementum nulla eu metus feugiat egestas. Curabitur viverra, lorem ut tempus mattis, nibh massa vulputate nisi, et sollicitudin justo tellus eu purus. ');

    expect(
        _logs,
        contains(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi auctor aliquam blandit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed rhoncus felis massa, sed dapibus ante pharetra semper. Praesent pharetra quis est vitae faucibus. Vestibulum tristique ipsum enim, interdum accumsan ligula rutrum vitae. Quisque nec maximus sem. Fusce faucibus laoreet faucibus. Praesent elementum nulla eu metus feugiat egestas. Curabitur viverra, lorem ut tempus mattis, nibh massa vulputate nisi, et sollicitudin justo tellus eu purus. '));
  }));

  test('log a message at info level', overridePrint(() {
    RPMTWLogger.info('Hello, World!');

    expect(_logs, contains('Hello, World!'));
  }));

  test('log a message at debug level', overridePrint(() {
    RPMTWLogger.debug('The program is running');

    expect(_logs, contains('The program is running'));
  }));

  test('log a message at error level', overridePrint(() {
    RPMTWLogger.error('Something went wrong');

    expect(_logs, contains('Something went wrong'));
  }));

  test('log a message at warning level', overridePrint(() {
    RPMTWLogger.warning('Something is not right');

    expect(_logs, contains('Something is not right'));
  }));

  test('log a fatal message', overridePrint(() {
    RPMTWLogger.fatal('Something is very wrong');

    expect(_logs, contains('Something is very wrong'));
  }));

  group('set the minimum log level', () {
    test('nothing', overridePrint(() {
      RPMTWLogger.setLevel(LoggerLevel.nothing);

      RPMTWLogger.info('Hello, World!');
      RPMTWLogger.debug('The program is running',
          stackTrace: StackTrace.current);
      RPMTWLogger.error('Something went wrong',
          error: Exception('Something went wrong'),
          stackTrace: StackTrace.current);
      RPMTWLogger.warning('Something is not right',
          stackTrace: StackTrace.current);
      RPMTWLogger.fatal('Something is very wrong',
          error: Exception('Something is very wrong'),
          stackTrace: StackTrace.current);

      expect(_logs, isEmpty);
    }));

    test('verbose', overridePrint(() {
      RPMTWLogger.setLevel(LoggerLevel.verbose);

      String loremText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi auctor aliquam blandit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed rhoncus felis massa, sed dapibus ante pharetra semper. Praesent pharetra quis est vitae faucibus. Vestibulum tristique ipsum enim, interdum accumsan ligula rutrum vitae. Quisque nec maximus sem. Fusce faucibus laoreet faucibus. Praesent elementum nulla eu metus feugiat egestas. Curabitur viverra, lorem ut tempus mattis, nibh massa vulputate nisi, et sollicitudin justo tellus eu purus.

Aliquam mattis aliquet sagittis. Morbi ut dapibus quam. Vivamus id feugiat dui. Nulla non sem at odio ullamcorper sagittis. Sed venenatis dolor quis nisl gravida dapibus. Curabitur pellentesque scelerisque dui ac rutrum. Nulla eget tincidunt dui. Duis ornare, nisi in tincidunt tristique, odio lectus sagittis est, ac porta metus felis in nibh. Quisque ut placerat mi, eget cursus urna. Quisque auctor interdum semper. Cras cursus posuere placerat. Praesent ac sodales sapien. Nulla sodales sagittis iaculis. Praesent placerat velit bibendum dolor vehicula lacinia. Vivamus non risus vel eros dictum facilisis sit amet eget orci. Proin tristique massa nec arcu lobortis varius.

Vestibulum tempor egestas vehicula. Aenean dapibus urna a urna finibus gravida. Curabitur purus purus, consectetur id commodo nec, venenatis sit amet dui. Phasellus eu arcu sodales, aliquam urna at, egestas dui. Ut accumsan tellus eget dignissim fermentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris a gravida risus. Phasellus sollicitudin, ex ac volutpat aliquam, turpis metus ullamcorper ex, euismod suscipit lorem quam in elit. Morbi metus urna, finibus in gravida iaculis, lobortis tempor ex. Vivamus finibus, justo in imperdiet fermentum, nisi purus dignissim ante, sed maximus risus turpis imperdiet lacus.

Nulla facilisis ultrices justo nec tempus. Vivamus tincidunt laoreet justo. Nunc et elementum lorem. Morbi accumsan, libero non feugiat vestibulum, velit neque eleifend tortor, quis auctor arcu velit at turpis. Sed posuere efficitur magna nec sodales. Sed a est lobortis, mollis dui non, suscipit erat. Mauris sit amet dui quis arcu sagittis placerat.

Cras ac nunc aliquet, dapibus ex id, semper est. Suspendisse eu fringilla mi. Pellentesque vel justo leo. Aliquam quis fringilla neque. Etiam a sapien arcu. Proin rutrum ultrices leo, non blandit nunc convallis sit amet. Phasellus fermentum mauris ornare rutrum pharetra. Maecenas laoreet erat vel dui elementum, ac cursus dui scelerisque. Sed lacinia interdum tellus eget gravida. Pellentesque cursus turpis metus, vel rhoncus massa ultrices at. Vivamus interdum sollicitudin purus vel sollicitudin. Nunc semper arcu porttitor odio luctus laoreet. Suspendisse dapibus augue vel leo aliquet volutpat. Cras euismod diam id enim maximus porttitor. Fusce ac consectetur libero. 
''';

      RPMTWLogger.verbose(loremText,
          error: Exception('Test verbose'), stackTrace: StackTrace.current);
      RPMTWLogger.info('Hello, World!');
      RPMTWLogger.debug('The program is running',
          stackTrace: StackTrace.current);
      RPMTWLogger.error('Something went wrong',
          error: Exception('Something went wrong'),
          stackTrace: StackTrace.current);
      RPMTWLogger.warning('Something is not right',
          stackTrace: StackTrace.current);
      RPMTWLogger.fatal('Something is very wrong',
          error: Exception('Something is very wrong'),
          stackTrace: StackTrace.current);

      loremText.split('\n').forEach((line) {
        expect(_logs, contains(line));
      });
      expect(_logs, contains('Test verbose'));

      expect(_logs, contains('Hello, World!'));
      expect(_logs, contains('The program is running'));
      expect(_logs, contains('Something went wrong'));
      expect(_logs, contains('Something is not right'));
      expect(_logs, contains('Something is very wrong'));
    }));

    test('verbose without stack trace', overridePrint(() {
      RPMTWLogger.setLevel(LoggerLevel.verbose);

      String loremText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi auctor aliquam blandit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed rhoncus felis massa, sed dapibus ante pharetra semper. Praesent pharetra quis est vitae faucibus. Vestibulum tristique ipsum enim, interdum accumsan ligula rutrum vitae. Quisque nec maximus sem. Fusce faucibus laoreet faucibus. Praesent elementum nulla eu metus feugiat egestas. Curabitur viverra, lorem ut tempus mattis, nibh massa vulputate nisi, et sollicitudin justo tellus eu purus.

Aliquam mattis aliquet sagittis. Morbi ut dapibus quam. Vivamus id feugiat dui. Nulla non sem at odio ullamcorper sagittis. Sed venenatis dolor quis nisl gravida dapibus. Curabitur pellentesque scelerisque dui ac rutrum. Nulla eget tincidunt dui. Duis ornare, nisi in tincidunt tristique, odio lectus sagittis est, ac porta metus felis in nibh. Quisque ut placerat mi, eget cursus urna. Quisque auctor interdum semper. Cras cursus posuere placerat. Praesent ac sodales sapien. Nulla sodales sagittis iaculis. Praesent placerat velit bibendum dolor vehicula lacinia. Vivamus non risus vel eros dictum facilisis sit amet eget orci. Proin tristique massa nec arcu lobortis varius.

Vestibulum tempor egestas vehicula. Aenean dapibus urna a urna finibus gravida. Curabitur purus purus, consectetur id commodo nec, venenatis sit amet dui. Phasellus eu arcu sodales, aliquam urna at, egestas dui. Ut accumsan tellus eget dignissim fermentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris a gravida risus. Phasellus sollicitudin, ex ac volutpat aliquam, turpis metus ullamcorper ex, euismod suscipit lorem quam in elit. Morbi metus urna, finibus in gravida iaculis, lobortis tempor ex. Vivamus finibus, justo in imperdiet fermentum, nisi purus dignissim ante, sed maximus risus turpis imperdiet lacus.

Nulla facilisis ultrices justo nec tempus. Vivamus tincidunt laoreet justo. Nunc et elementum lorem. Morbi accumsan, libero non feugiat vestibulum, velit neque eleifend tortor, quis auctor arcu velit at turpis. Sed posuere efficitur magna nec sodales. Sed a est lobortis, mollis dui non, suscipit erat. Mauris sit amet dui quis arcu sagittis placerat.

Cras ac nunc aliquet, dapibus ex id, semper est. Suspendisse eu fringilla mi. Pellentesque vel justo leo. Aliquam quis fringilla neque. Etiam a sapien arcu. Proin rutrum ultrices leo, non blandit nunc convallis sit amet. Phasellus fermentum mauris ornare rutrum pharetra. Maecenas laoreet erat vel dui elementum, ac cursus dui scelerisque. Sed lacinia interdum tellus eget gravida. Pellentesque cursus turpis metus, vel rhoncus massa ultrices at. Vivamus interdum sollicitudin purus vel sollicitudin. Nunc semper arcu porttitor odio luctus laoreet. Suspendisse dapibus augue vel leo aliquet volutpat. Cras euismod diam id enim maximus porttitor. Fusce ac consectetur libero. 
''';

      RPMTWLogger.verbose(loremText,
          error: Exception('Test'), stackTrace: StackTrace.current);
      RPMTWLogger.info('Hello, World!');
      RPMTWLogger.debug('The program is running',
          stackTrace: StackTrace.current);
      RPMTWLogger.error('Something went wrong',
          error: Exception('Something went wrong'),
          stackTrace: StackTrace.current);
      RPMTWLogger.warning('Something is not right',
          stackTrace: StackTrace.current);
      RPMTWLogger.fatal('Something is very wrong',
          error: Exception('Something is very wrong'),
          stackTrace: StackTrace.current);

      loremText.split('\n').forEach((line) {
        expect(_logs, contains(line));
      });
      expect(_logs, isNot(contains('Test verbose')));

      expect(_logs, contains('Hello, World!'));
      expect(_logs, contains('The program is running'));
      expect(_logs, contains('Something went wrong'));
      expect(_logs, contains('Something is not right'));
      expect(_logs, contains('Something is very wrong'));
    }));

    test('debug', overridePrint(() {
      RPMTWLogger.setLevel(LoggerLevel.debug);

      RPMTWLogger.info('Hello, World!');
      RPMTWLogger.debug('The program is running',
          stackTrace: StackTrace.current);
      RPMTWLogger.error('Something went wrong',
          error: Exception('Something went wrong'),
          stackTrace: StackTrace.current);
      RPMTWLogger.warning('Something is not right',
          stackTrace: StackTrace.current);
      RPMTWLogger.fatal('Something is very wrong',
          error: Exception('Something is very wrong'),
          stackTrace: StackTrace.current);

      expect(_logs, contains('The program is running'));
      expect(_logs, contains('Hello, World!'));
      expect(_logs, contains('Something is not right'));
      expect(_logs, contains('Something went wrong'));
      expect(_logs, contains('Something is very wrong'));
    }));

    test('info', overridePrint(() {
      RPMTWLogger.setLevel(LoggerLevel.info);

      RPMTWLogger.info('Hello, World!');
      RPMTWLogger.debug('The program is running',
          stackTrace: StackTrace.current);
      RPMTWLogger.error('Something went wrong',
          error: Exception('Something went wrong'),
          stackTrace: StackTrace.current);
      RPMTWLogger.warning('Something is not right',
          stackTrace: StackTrace.current);
      RPMTWLogger.fatal('Something is very wrong',
          error: Exception('Something is very wrong'),
          stackTrace: StackTrace.current);

      expect(_logs, isNot(contains('The program is running')));

      expect(_logs, contains('Hello, World!'));
      expect(_logs, contains('Something is not right'));
      expect(_logs, contains('Something went wrong'));
      expect(_logs, contains('Something is very wrong'));
    }));

    test('warning', overridePrint(() {
      RPMTWLogger.setLevel(LoggerLevel.warning);

      RPMTWLogger.info('Hello, World!');
      RPMTWLogger.debug('The program is running',
          stackTrace: StackTrace.current);
      RPMTWLogger.error('Something went wrong',
          error: Exception('Something went wrong'),
          stackTrace: StackTrace.current);
      RPMTWLogger.warning('Something is not right',
          stackTrace: StackTrace.current);
      RPMTWLogger.fatal('Something is very wrong',
          error: Exception('Something is very wrong'),
          stackTrace: StackTrace.current);

      expect(_logs, isNot(contains('The program is running')));
      expect(_logs, isNot(contains('Hello, World!')));

      expect(_logs, contains('Something is not right'));
      expect(_logs, contains('Something went wrong'));
      expect(_logs, contains('Something is very wrong'));
    }));

    test('error', overridePrint(() {
      RPMTWLogger.setLevel(LoggerLevel.error);

      RPMTWLogger.info('Hello, World!');
      RPMTWLogger.debug('The program is running',
          stackTrace: StackTrace.current);
      RPMTWLogger.error('Something went wrong',
          error: Exception('Something went wrong'),
          stackTrace: StackTrace.current);
      RPMTWLogger.warning('Something is not right',
          stackTrace: StackTrace.current);
      RPMTWLogger.fatal('Something is very wrong',
          error: Exception('Something is very wrong'),
          stackTrace: StackTrace.current);

      expect(_logs, isNot(contains('The program is running')));
      expect(_logs, isNot(contains('Hello, World!')));
      expect(_logs, isNot(contains('Something is not right')));

      expect(_logs, contains('Something went wrong'));
      expect(_logs, contains('Something is very wrong'));
    }));

    test('fatal', overridePrint(() {
      RPMTWLogger.setLevel(LoggerLevel.fatal);

      RPMTWLogger.info('Hello, World!');
      RPMTWLogger.debug('The program is running',
          stackTrace: StackTrace.current);
      RPMTWLogger.error('Something went wrong',
          error: Exception('Something went wrong'),
          stackTrace: StackTrace.current);
      RPMTWLogger.warning('Something is not right',
          stackTrace: StackTrace.current);
      RPMTWLogger.fatal('Something is very wrong',
          error: Exception('Something is very wrong'),
          stackTrace: StackTrace.current);

      expect(_logs, isNot(contains('The program is running')));
      expect(_logs, isNot(contains('Hello, World!')));
      expect(_logs, isNot(contains('Something is not right')));
      expect(_logs, isNot(contains('Something went wrong')));

      expect(_logs, contains('Something is very wrong'));
    }));
  });
}

void Function() overridePrint(void Function() fun) => () {
      _logs = '';
      final ZoneSpecification spec =
          ZoneSpecification(print: (_, __, ___, String msg) {
        _logs += '$msg\n';
      });

      return Zone.current.fork(specification: spec).run<void>(fun);
    };
