import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';
import 'package:investerings_kalkulator/state_provider.dart';
import 'package:investerings_kalkulator/utilities/custom_box_shadow.dart';
import 'package:investerings_kalkulator/utilities/color_variables.dart';
import 'package:investerings_kalkulator/calculators/short_restult.dart';

//* ___________ RESULT DISPLAY ______________________________________________
class ResultDisplay extends StatefulWidget {
  const ResultDisplay({Key key}) : super(key: key);
  @override
  State<ResultDisplay> createState() => _ResultDisplayState();
}

class _ResultDisplayState extends State<ResultDisplay> {
  // final ctrl1 =
  //     MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');
  final ctrl2 =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');
  final ctrl3 =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');
  final ctrl4 =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');
  final ctrl5 =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');
  final ctrl6 =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ' ');

  @override
  Widget build(BuildContext context) {
    double principle = context.watch<InputCalcProvider>().principleAmt;
    double timeDeltaInYears = context.watch<InputCalcProvider>().terms;
    double periods = context.watch<InputCalcProvider>().compoundsPerYear;
    double interestRate = context.watch<InputCalcProvider>().annualRate;
    double additionalContributions =
        context.watch<InputCalcProvider>().monthlyContribution;
    int beforeAfterVal = context.watch<BeforeAfterProvider>().buttondata;

    List resultList = GetResults().resultat(principle, timeDeltaInYears,
        periods, interestRate, additionalContributions, beforeAfterVal);

    final ctrl0 = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ' ',
        initialValue: resultList[0]);

    final ctrl1 = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ' ',
        initialValue: resultList[1]);
    final ctrl2 = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ' ',
        initialValue: resultList[2]);
    final ctrl3 = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ' ',
        initialValue: resultList[3]);
    final ctrl4 = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ' ',
        initialValue: resultList[4]);
    final ctrl5 = MoneyMaskedTextController(
        decimalSeparator: ',',
        thousandSeparator: ' ',
        initialValue: resultList[5]);
    return Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
        child: Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Column(children: [
              // HEADER: TITLE
              Container(
                  constraints: BoxConstraints.expand(height: 50),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: colorSection, boxShadow: customBoxShadow()),
                  child: Text(
                    'Resultat',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  )),
              // BODY: RESULTAT CONTAINER
              Container(
                  decoration: BoxDecoration(
                      boxShadow: customBoxShadow(), color: colorAmber),
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(children: [
                    Row(children: [
                      Text('Slutt Balanse: ',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Spacer(),
                      // ctrl1.value = resultList[0],

                      Text(' kr  ${ctrl0.text} ,-',
                          // Text(' kr  ${resultList[0].toStringAsFixed(2)},-',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ]),
                    Divider(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('StartSum: ',
                                      style: TextStyle(
                                          color: colorTextblack, fontSize: 16)),
                                  Text('Totale tilskudd: ',
                                      style: TextStyle(
                                          color: colorTextblack, fontSize: 16)),
                                  Text('Total Dividende:',
                                      style: TextStyle(
                                          color: colorTextblack, fontSize: 16)),
                                ]),
                            Spacer(),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('${ctrl1.text}  ,-',
                                      style: TextStyle(
                                          color: colorTextblack, fontSize: 16)),
                                  Text('${ctrl2.text}  ,-',
                                      style: TextStyle(
                                          color: colorTextblack, fontSize: 16)),
                                  Text('${ctrl3.text}  ,-',
                                      style: TextStyle(
                                          color: colorTextblack, fontSize: 16))
                                ])
                          ]),
                    )
                  ])),
              // FOOTER: TOTAL GROWTH %
              Center(
                  child: Container(
                      constraints: BoxConstraints.expand(height: 80),
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: customBoxShadow(),
                            color: colorSection,
                          ),
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: colorDarkGreen,
                                boxShadow: customBoxShadow()),
                            constraints: BoxConstraints.expand(),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Totalt utbytte: ',
                                          style: TextStyle(
                                              color: colorWhite, fontSize: 20),
                                        ),
                                        Text(
                                          'Annualiset utbytte: ',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: colorWhite, fontSize: 20),
                                        ),
                                      ]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text('${ctrl4.text} %',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: colorWhite,
                                                fontSize: 20)),
                                        Text('${ctrl5.text} %',
                                            style: TextStyle(
                                                color: colorWhite,
                                                fontSize: 20))
                                      ])
                                ]),
                          ))))
            ])));
  }
}
