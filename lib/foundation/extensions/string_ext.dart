import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String removeWidthSpace() => replaceAll('', '\u200B');

  String reduceFileName() {
    if (length > 25) {
      /// Get the first 15 character from file name
      /// longexamplefilenamewith25letter.pdf => longexamplefile
      /// Get the last 10 character
      /// longexamplefilenamewith25letter.pdf => letter.pdf
      /// After combine we got:
      /// longexamplefile...letter.pdf
      return '${substring(0, 15)}'
              '...${substring(length - 10)}'
          .removeWidthSpace();
    }
    return this;
  }

  /// Convert string to date
  DateTime toDateTimeObj() {
    return DateTime.parse(this);
  }

  String toLocalDateTimeSlash() {
    return DateFormat('yyyy/MM/dd HH:mm').format(
      toDateTimeObj().toLocal(),
    );
  }
}
