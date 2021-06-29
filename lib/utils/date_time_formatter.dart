import 'package:intl/intl.dart';

class DateFormatter {
  static const String _patternDayAbbrMonthHoursMinutes =
      '${DateFormat.DAY} ${DateFormat.ABBR_MONTH} hh:mm';
  static const String _patternDayMonthHoursMinutes =
      '${DateFormat.DAY} ${DateFormat.MONTH} hh:mm';

  static const String _patternDayMonth = ' ${DateFormat.DAY} MMM';

  static final DateFormat _formatterDayAbbrMonthHoursMinutes =
      DateFormat(_patternDayAbbrMonthHoursMinutes, 'ru_RU');
  static final DateFormat _formatterDayMonthHoursMinutes =
      DateFormat(_patternDayMonthHoursMinutes, 'ru_RU');
  static final DateFormat _formatterDayMonth =
      DateFormat(_patternDayMonth, 'ru_RU');

  const DateFormatter._();

  /// Pattern: d MMM hh:mm
  static String formatToDayAbbrMonthHoursMinutes(DateTime date) =>
      _formatterDayAbbrMonthHoursMinutes.format(date);

  /// Pattern: d MMMM hh:mm
  static String formatToDayMonthHoursMinutes(DateTime date) =>
      _formatterDayMonthHoursMinutes.format(date);

  /// Pattern: dd MMM
  static String formatToDayMonth(DateTime date) =>
      _formatterDayMonth.format(date);

  static String formatToDayMonthDuration(DateTime date, int days) =>
      _formatterDayMonth.format(
        date.subtract(
          Duration(days: days),
        ),
      );
}
