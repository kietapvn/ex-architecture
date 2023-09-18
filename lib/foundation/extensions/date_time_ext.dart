import 'package:easy_localization/easy_localization.dart';

extension DateTimeExt on DateTime {
  String formatJa() {
    return DateFormat('yyyy年M月d日 HH:mm').format(this);
  }

  String formatEn() {
    return DateFormat('yyyy/MM/dd HH:mm').format(this);
  }

  String formatTime() {
    return DateFormat('HH:mm').format(this);
  }

  static const defaultDateTime = '0000-00-00T00:00:00Z';
}
