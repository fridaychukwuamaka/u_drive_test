part of 'extension.dart';

extension DateTimeExtension on DateTime {
  // Temp Solution
  bool isSameTime(DateTime other) {
    return year == year &&
        month == month &&
        hour == other.hour &&
        minute == other.minute;
  }
}
