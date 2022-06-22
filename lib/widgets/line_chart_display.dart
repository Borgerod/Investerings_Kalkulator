import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:investerings_kalkulator/utilities/color_variables.dart';
import 'package:investerings_kalkulator/state_provider.dart';
import 'package:investerings_kalkulator/utilities/custom_box_shadow.dart';
import 'package:investerings_kalkulator/calculators/long_result.dart';

//* ___________ LINE CHART DISPLAY _____________________________________________
class LineChartDisplay extends StatefulWidget {
  const LineChartDisplay({Key key}) : super(key: key);
  @override
  State<LineChartDisplay> createState() => _LineChartDisplayState();
}

class _LineChartDisplayState extends State<LineChartDisplay> {
  @override
  Widget build(BuildContext context) {
    double principleAmt = context.watch<InputCalcProvider>().principleAmt;
    double timeDeltaInYears = context.watch<InputCalcProvider>().terms;
    double periods = context.watch<InputCalcProvider>().compoundsPerYear;
    double interestRate = context.watch<InputCalcProvider>().annualRate;
    double additionalContributions =
        context.watch<InputCalcProvider>().monthlyContribution;
    int beforeAfterVal = context.watch<BeforeAfterProvider>().buttondata;

    List seriesList = GetRows().resultat(principleAmt, timeDeltaInYears,
        periods, interestRate, additionalContributions, beforeAfterVal);

    List<dynamic> interestSeries = seriesList[3];
    List<dynamic> endprincipalSeries = seriesList[4];
    List<dynamic> endBalanceSeries = seriesList[5];

    List<FlSpot> balanceData = endBalanceSeries.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();

    List<FlSpot> interestData = interestSeries.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();

    List<FlSpot> principleData = endprincipalSeries.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value);
    }).toList();

    return Container(
      decoration: BoxDecoration(
        color: colorSection,
        boxShadow: customBoxShadow(),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(00.0, 0.0, 00.0, 0.0),
            child: Container(
              color: colorSection,
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Container(
                  constraints: BoxConstraints.expand(
                    height: 60,
                  ),
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: colorDarkGreen,
                    boxShadow: customBoxShadow(),
                  ),
                  child: Text(
                    'Graf',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorHeadline, fontSize: 30),
                  )),
            ),
          ),
          Padding(
            // padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Container(
              // padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              width: 400,
              height: 200,
              color: colorSection,
              child: PageView(
                children: [
                  LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          fitInsideVertically: true,
                          fitInsideHorizontally: true,
                          tooltipBgColor: colorDarkGrayBlue,
                          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                            return lineBarsSpot.map((lineBarSpot) {
                              return LineTooltipItem(
                                  '${lineBarSpot.y.toStringAsFixed(2)},-',
                                  TextStyle(color: colorWhite));
                            }).toList();
                          },
                        ),

                        // getTouchedSpotIndicator: TouchedSpotIndicatorData(),
                      ),
                      rangeAnnotations: RangeAnnotations(),
                      gridData: FlGridData(),
                      borderData: FlBorderData(show: true),
                      maxY: ((endBalanceSeries.last * 2.1)),
                      // baselineY: 1,
                      clipData: FlClipData(
                          top: true, bottom: true, left: false, right: true),
                      lineBarsData: [
                        //* END BALANCE LINE
                        LineChartBarData(
                          dotData: FlDotData(
                            show: false,
                          ),
                          spots: balanceData,
                          isCurved: true,
                          barWidth: 3,
                          color: colorSpringGreen,
                        ),
                        //* INTEREST LINE
                        LineChartBarData(
                            dotData: FlDotData(
                              show: false,
                            ),
                            spots: interestData,
                            isCurved: true,
                            barWidth: 3,
                            color: colorAmber),
                        //* PRINCIPLE LINE
                        LineChartBarData(
                            dotData: FlDotData(
                              show: false,
                            ),
                            spots: principleData,
                            isCurved: true,
                            barWidth: 3,
                            color: colorLightBlue)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
