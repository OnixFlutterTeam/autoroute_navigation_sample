import 'package:flutter/foundation.dart';

class Logger {
  static bool _isEnabled = !kReleaseMode;
  static String _globalTag = '[__LOG__]';

  static void log(String message) {
    if (_isEnabled) {
      _printWrapped('$_globalTag $message [${DateTime.now()}]');
    }
  }

  static void logTag(Type objectTag, String message) {
    if (_isEnabled) {
      _printWrapped('[${DateTime.now()}] [${objectTag.toString()}] $message');
    }
  }

  static void setEnable(bool isEnable) {
    _isEnabled = isEnable;
  }

  static void setGlobalTag(String globalTag) {
    _globalTag = globalTag;
  }

  static void printException(dynamic e) {
    if (_isEnabled) {
      print(e);
    }
  }

  static void _printWrapped(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
