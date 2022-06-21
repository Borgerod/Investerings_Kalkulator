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

// class DecimalTextInputFormatter extends TextInputFormatter {
//   DecimalTextInputFormatter({this.decimalRange})
//       : assert(decimalRange == null || decimalRange > 0);
// 
//   final int decimalRange;
// 
//   get math => null;
// 
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue, // unused.
//     TextEditingValue newValue,
//   ) {
//     TextSelection newSelection = newValue.selection;
//     String truncated = newValue.text;
// 
//     if (decimalRange != null) {
//       String value = newValue.text;
// 
//       if ((value.trim().length > 0 && double.tryParse(value) == null) ||
//           value.split(".").length > 2 ||
//           (value.contains(".") &&
//               value.substring(value.indexOf(".") + 1).length > decimalRange)) {
//         truncated = oldValue.text;
//         newSelection = oldValue.selection;
//       } else if (value == ".") {
//         truncated = "0.";
// 
//         newSelection = newValue.selection.copyWith(
//           baseOffset: math.min(truncated.length, truncated.length + 1),
//           extentOffset: math.min(truncated.length, truncated.length + 1),
//         );
//       }
// 
//       return TextEditingValue(
//         text: truncated,
//         selection: newSelection,
//         composing: TextRange.empty,
//       );
//     }
//     return newValue;
//   }
// }
