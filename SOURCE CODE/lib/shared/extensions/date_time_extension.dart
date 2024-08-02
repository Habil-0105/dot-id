import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime{
  String get toUniqueDate {
    return DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(this);
  }

  String get toUniqueMonth {
    return DateFormat('MMMM yyyy').format(this);
  }

  String get dailyExpense{
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final data = DateTime(year, month, day);

    Duration difference = today.difference(data);
    int diff = difference.inDays;

    if(diff == 0){
      return "Hari ini";
    }else if(diff == 1){
      return "Kemarin";
    }else{
      return toUniqueDate;
    }
  }
}