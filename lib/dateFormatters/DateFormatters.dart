import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateFormatters {
  static String shortRange(DateTimeRange range) {
    final formatter = DateFormat('d/M/yyyy');
    return '${formatter.format(range.start)} - ${formatter.format(range.end)}';
  }

  static String longRange(DateTimeRange range) {
    final formatter = DateFormat('MMMM d');
    final start = formatter.format(range.start);
    final end = formatter.format(range.end);
    return '$start - $end';
  }

  static String listedShortRange(DateTime date){
    final formatter =  DateFormat('d/M');
    return formatter.format(date);
  }
}
