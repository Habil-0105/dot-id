import 'package:intl/intl.dart';

extension NumUtils on num{
  String get convertToIdr{
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return currencyFormatter.format(this);
  }
}