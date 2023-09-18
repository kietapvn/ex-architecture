import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogHelper {
  static late Logger _instance;

  static bool _initialised = false;

  static void _initialiseLogger() {
    if (!_initialised) {
      final logger = Logger(
        filter: _FlutterTemplateLogFilter(),
        printer: PrettyPrinter(printEmojis: false),
        level: Level.info,
      );

      _instance = logger;
      _initialised = true;
    }
  }

  static Logger get logger {
    _initialiseLogger();
    return _instance;
  }
}

Logger get log => LogHelper.logger;

class _FlutterTemplateLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    try {
      return kDebugMode;
    } catch (_) {
      return true;
    }
  }
}
