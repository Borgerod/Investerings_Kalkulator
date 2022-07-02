import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:investerings_kalkulator/utilities/color_variables.dart';
import 'package:provider/provider.dart';
import 'package:investerings_kalkulator/state_provider.dart';
import 'package:investerings_kalkulator/utilities/custom_box_shadow.dart';
import 'package:investerings_kalkulator/calculators/short_restult.dart';

//* ___________ PIE CHART DISPLAY ______________________________________________
class PieChartDisplay extends StatefulWidget {
  const PieChartDisplay({Key key}) : super(key: key);
  @override
  State<PieChartDisplay> createState() => _PieChartDisplayState();
}

class _PieChartDisplayState extends State<PieChartDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
        decoration: BoxDecoration(
          color: colorSection,
          boxShadow: customBoxShadow(),
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: 282,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                color: colorDarkGreen,
                boxShadow: customBoxShadow(),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Oversikt',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: colorHeadline, fontSize: 30),
                      ),
                    )),
              ),
            ),
            Row(children: [
              Container(
                  width: 110,
                  height: 217,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: [
                      // TILLEGGSBIDRAG
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Tilleggsbidrag',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: colorTextblack),
                          ),
                          SizedBox(width: 10),
                          indicator2,
                        ],
                      ),

                      // DIVIDENDE
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Dividende',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: colorTextblack),
                          ),
                          SizedBox(width: 10),
                          indicator1,
                          // indicator3
                        ],
                      ),

                      // STARTSUM
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Startsum',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: colorTextblack),
                          ),
                          SizedBox(width: 10),
                          indicator3,
                        ],
                      ),
                    ]),
                  )),
              Container(
                width: 180,
                height: 100,
                child: PieChart(PieChartData(
                  centerSpaceRadius: 50,
                  sections: getSections(),
                )),
              ),
            ]),
          ],
        ));
  }

  getSections() {
    double principleAmt = context.watch<InputCalcProvider>().principleAmt;
    double timeDeltaInYears = context.watch<InputCalcProvider>().terms;
    double periods = context.watch<InputCalcProvider>().compoundsPerYear;
    double interestRate = context.watch<InputCalcProvider>().annualRate;
    double additionalContributions =
        context.watch<InputCalcProvider>().monthlyContribution;
    int beforeAfterVal = context.watch<BeforeAfterProvider>().buttondata;
    List resultList = GetResults().resultat(principleAmt, timeDeltaInYears,
        periods, interestRate, additionalContributions, beforeAfterVal);
    double totalContributions = resultList[2];
    double interestAccrued = resultList[3];
    double total = principleAmt + totalContributions + interestAccrued;

    List<PieChartSectionData> data = [
      // STARTSUM
      PieChartSectionData(
        color: colorHazyGreen,
        value: principleAmt / total,
        title: '${(((principleAmt / total) * 100).toStringAsFixed(0))}%',
        titleStyle: TextStyle(
          color: colorWhite,
          fontWeight: FontWeight.bold,
        ),
      ),

      //TILLEGGSBIDRAG
      PieChartSectionData(
        color: colorDarkGreen,
        value: totalContributions / total,
        title: '${(((totalContributions / total) * 100).toStringAsFixed(0))}%',
        titleStyle: TextStyle(
          color: colorWhite,
          fontWeight: FontWeight.bold,
        ),
      ),

      // DICIDENDE
      PieChartSectionData(
        color: colorAmber,
        value: interestAccrued / total,
        title: '${(((interestAccrued / total) * 100).toStringAsFixed(0))}%',
        titleStyle: TextStyle(
          color: colorWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
    return data;
  }
}
