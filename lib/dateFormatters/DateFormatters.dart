import 'package:intl/intl.dart';

class DateFormatters {
  static String shortRange(DateTime startDate, DateTime endDate) {
    final formatter = DateFormat('d/M/yyyy');
    return '${formatter.format(startDate)} - ${formatter.format(endDate)}';
  }

  static String longRange(DateTime startDate, DateTime endDate) {
    final formatter = DateFormat('MMMM d');
    final start = formatter.format(startDate);
    final end = formatter.format(endDate);
    return '$start - $end';
  }

  static String listedShortRange(DateTime date){
    final formatter =  DateFormat('d/M');
    return formatter.format(date);
  }

  static String fullDateDisplay(DateTime date){
    final formatter = DateFormat('EEEE, d MMMM yyyy');
    return formatter.format(date);
  }
}

