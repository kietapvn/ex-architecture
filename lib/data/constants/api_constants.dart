import 'package:flutter/foundation.dart';

@immutable
mixin HeaderKey {
  static const authorization = 'Authorization';
  static const contentType = 'Content-Type';
  static const osTypeKey = 'X-OS-TYPE';
  static const osVersionKey = 'X-OS-VERSION';
  static const appVersionKey = 'X-APP-VERSION';
}
