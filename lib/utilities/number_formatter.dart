import 'package:flutter_masked_text/flutter_masked_text.dart';

final controller1 =
    MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');

final controller4 =
    MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');

final controller5 =
    MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');

numberTextReformat(oldValue) {
  String value1 = oldValue.replaceAll(" ", '');
  String value2 = value1.replaceAll("kr", '');
  String value3 = value2.replaceAll("%", '');
  var newValue = value3.replaceAll(",", '.');
  return double.parse(newValue);
}
