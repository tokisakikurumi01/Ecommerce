part of 'shared.dart';

class FunctionHelper{
  static String moneyChanger(double value) {
    return NumberFormat.currency(name: 'Rp', decimalDigits: 0, locale: 'id')
        .format(value.round());
  }
}