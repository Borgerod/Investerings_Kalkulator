import 'package:flutter/material.dart';
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
                      Text(' kr  ${resultList[0].toStringAsFixed(2)},-',
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
                                      style: TextStyle(color: colorTextblack)),
                                  Text('Totale tilskudd: ',
                                      style: TextStyle(color: colorTextblack)),
                                  Text('Total Dividende:',
                                      style: TextStyle(color: colorTextblack)),
                                ]),
                            Spacer(),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      '${resultList[1].toStringAsFixed(2)},  ,-',
                                      style: TextStyle(color: colorTextblack)),
                                  Text(
                                      '${resultList[2].toStringAsFixed(2)},  ,-',
                                      style: TextStyle(color: colorTextblack)),
                                  Text(
                                      '${resultList[3].toStringAsFixed(2)},  ,-',
                                      style: TextStyle(color: colorTextblack))
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
                                              color: Colors.white,
                                              fontSize: 20),
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
                                        Text(
                                            '${resultList[5].toStringAsFixed(2)} %',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: colorWhite,
                                                fontSize: 20)),
                                        Text(
                                            '${resultList[4].toStringAsFixed(2)} %',
                                            style: TextStyle(
                                                color: colorWhite,
                                                fontSize: 20))
                                      ])
                                ]),
                          ))))
            ])));
  }
}
