import 'package:logger/logger.dart';

class RPMTWLogger {
  static final Logger _logger =
      Logger(printer: PrettyPrinter(colors: false), filter: _LogFilter());

  static final Logger _loggerWithoutStackTrace = Logger(
      printer: PrettyPrinter(methodCount: 0, colors: false),
      filter: _LogFilter());

  static void info(String message) {
    _loggerWithoutStackTrace.i(message);
  }

  static void debug(String message, {StackTrace? stackTrace}) {
    if (stackTrace != null) {
      _logger.d(message, null, stackTrace);
    } else {
      _loggerWithoutStackTrace.d(message);
    }
  }

  static void warning(String message, {StackTrace? stackTrace}) {
    if (stackTrace != null) {
      _logger.w(message, null, stackTrace);
    } else {
      _loggerWithoutStackTrace.w(message);
    }
  }

  static void error(String message, {String? error, StackTrace? stackTrace}) {
    if (stackTrace != null) {
      _logger.e(message, error, stackTrace);
    } else {
      _loggerWithoutStackTrace.e(message, error);
    }
  }
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    /// always log
    return true;
  }
}
