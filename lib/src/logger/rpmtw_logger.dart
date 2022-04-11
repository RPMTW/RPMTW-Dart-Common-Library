import 'package:logger/logger.dart';
import 'package:rpmtw_dart_common_library/src/logger/logger_level.dart';

LoggerLevel? _level;

/// Logger for the RPMTW applications.
class RPMTWLogger {
  static final Logger _logger =
      Logger(printer: PrettyPrinter(colors: false), filter: _LogFilter());

  static final Logger _loggerWithoutStackTrace = Logger(
      printer: PrettyPrinter(methodCount: 0, colors: false),
      filter: _LogFilter());

  /// Logs a message at the [LoggerLevel.verbose] level.
  static void verbose(String message, {Object? error, StackTrace? stackTrace}) {
    if (stackTrace != null) {
      _logger.v(message, error.toString(), stackTrace);
    } else {
      _loggerWithoutStackTrace.v(message, error);
    }
  }

  /// Logs a message at the [LoggerLevel.info] level.
  static void info(String message) {
    _loggerWithoutStackTrace.i(message);
  }

  /// Logs a message at the [LoggerLevel.debug] level.
  static void debug(String message, {StackTrace? stackTrace}) {
    if (stackTrace != null) {
      _logger.d(message, null, stackTrace);
    } else {
      _loggerWithoutStackTrace.d(message);
    }
  }

  /// Logs a message at the [LoggerLevel.warning] level.
  static void warning(String message, {StackTrace? stackTrace}) {
    if (stackTrace != null) {
      _logger.w(message, null, stackTrace);
    } else {
      _loggerWithoutStackTrace.w(message);
    }
  }

  /// Logs a message at the [LoggerLevel.error] level.
  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    if (stackTrace != null) {
      _logger.e(message, error.toString(), stackTrace);
    } else {
      _loggerWithoutStackTrace.e(message, error);
    }
  }

  /// Logs a message at the [LoggerLevel.fatal] level.
  static void fatal(String message, {Object? error, StackTrace? stackTrace}) {
    if (stackTrace != null) {
      _logger.wtf(message, error.toString(), stackTrace);
    } else {
      _loggerWithoutStackTrace.wtf(message, error);
    }
  }

  /// Sets the minimum log level.
  static void setLevel(LoggerLevel level) {
    _level = level;
  }
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    Enum? level = _level ?? this.level ?? Logger.level;

    if (event.level.index >= level.index) {
      return true;
    } else {
      return false;
    }
  }
}
