import 'package:flutter/material.dart';
import 'package:investerings_kalkulator/utilities/color_variables.dart';
import 'package:provider/provider.dart';
import 'package:investerings_kalkulator/state_provider.dart';
import 'package:investerings_kalkulator/utilities/custom_texts.dart';
import 'package:investerings_kalkulator/utilities/custom_box_shadow.dart';
import 'package:investerings_kalkulator/utilities/number_formatter.dart';

//* ___________ INPUT FORM _____________________________________________________
class InputForm extends StatefulWidget {
  const InputForm({Key key}) : super(key: key);
  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  TextEditingController _ctrl1 = TextEditingController(),
      _ctrl2 = TextEditingController(),
      _ctrl3 = TextEditingController(),
      _ctrl4 = TextEditingController(),
      _ctrl5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // HEADER
        Container(
          height: 55,
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 7.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
          decoration: BoxDecoration(
            color: colorWhite,
            boxShadow: customBoxShadow(),
          ),
          child: titleGreyBig('investering'),
        ),
        // BODY
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: colorDarkGreen,
            boxShadow: customBoxShadow(),
          ),
          child: Column(
            children: [
              TextFormField(
                  // initialValue: null,
                  style: TextStyle(color: colorCharcoal),
                  textAlign: TextAlign.end,
                  decoration: inputDecor('Startsum', 'kr', 7.0),
                  controller: controller1,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      String newVal = "0";
                      context
                          .read<InputProvider>()
                          .changePrincipleAmt(double.parse(newVal));
                    } else {
                      print(val);
                      print(val.runtimeType);
                      context
                          .read<InputProvider>()
                          .changePrincipleAmt(numberTextReformat(val));
                    }
                  }),
              SizedBox(height: 10),
              TextFormField(
                  style: TextStyle(color: colorCharcoal),
                  textAlign: TextAlign.end,
                  decoration: inputDecor('antall år', 'år', 7.0),
                  controller: _ctrl2,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      context
                          .read<InputProvider>()
                          .changeTerms(double.parse(("0")));
                    } else {
                      context
                          .read<InputProvider>()
                          .changeTerms(double.parse((val)));
                    }
                  }),
              SizedBox(height: 10),
              TextFormField(
                  style: TextStyle(color: colorCharcoal),
                  textAlign: TextAlign.end,
                  decoration: inputDecor('perioder *', 'ant', 0.0),
                  controller: _ctrl3,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      context
                          .read<InputProvider>()
                          .changeCompoundsPerYear(double.parse(("0")));
                    } else {
                      context
                          .read<InputProvider>()
                          .changeCompoundsPerYear(double.parse((val)));
                    }
                  }),
              SizedBox(height: 10),
              TextFormField(
                  style: TextStyle(color: colorCharcoal),
                  textAlign: TextAlign.end,
                  decoration: inputDecor('dividende', '%', 7.0),
                  controller: controller4,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      String newVal = "0";
                      context
                          .read<InputProvider>()
                          .changeAnnualRate(double.parse(newVal));
                    } else {
                      context
                          .read<InputProvider>()
                          .changeAnnualRate(numberTextReformat(val));
                    }
                  }),
              SizedBox(height: 10),
              TextFormField(
                  style: TextStyle(color: colorCharcoal),
                  textAlign: TextAlign.end,
                  decoration: inputDecor('tilleggsbidrag', 'kr', 7.0),
                  controller: controller5,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      String newVal = "0";
                      context
                          .read<InputProvider>()
                          .changeMonthlyContribution(double.parse(newVal));
                    } else {
                      context
                          .read<InputProvider>()
                          .changeMonthlyContribution(numberTextReformat(val));
                    }
                  }),
            ],
          ),
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 27.0),
          decoration: BoxDecoration(
            color: colorWhite,
            boxShadow: customBoxShadow(),
          ),
          child: Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: [
                const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                    child: Align(
                        alignment: AlignmentDirectional(0, -1.3),
                        child: Text('*'))),
                Flexible(
                    child: noramlGreyText(
                        '''Hvor mange ganger i året skal tilleggsbidragene og
dividenden betales. F.eks.  Én gang hver måned vil
da være 12 perioder.''')),
              ],
            ),
          ),
        ),
      ],
    );
  }

  inputDecor(label, hintlabel, spacing) {
    return InputDecoration(
      focusColor: colorHazyGreen,
      alignLabelWithHint: true,
      suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Text("$hintlabel",
              style: TextStyle(color: colorTextGray, fontSize: 16))),
      suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      prefixIcon:
          Text("      $label   ", style: TextStyle(color: colorCharcoal)),
      // Text("      $label   ", style: TextStyle(color: colorTextGray)),
      contentPadding: EdgeInsets.only(left: spacing, right: 10.0),
      filled: true,
      fillColor: colorWhite,
      hintText: '0',
      hintStyle: TextStyle(
        // color: colorTextGray,
        color: colorCharcoal,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
