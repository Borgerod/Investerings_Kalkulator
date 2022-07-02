import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
    return Container(
      decoration: BoxDecoration(
          color: colorSection,
          boxShadow: customBoxShadow(),
          borderRadius: BorderRadius.circular(5.0)),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          // ____ HEADER ____
          LineChartHeader(),
          //____ LEGEND ____
          LineChartLegend(),
          //____ GRAPH CONTAINER ____
          LineChartBuilder(),
        ],
      ),
    );
  }
}

// *___________ LINE CHART LEGEND ____________
class LineChartLegend extends StatefulWidget {
  const LineChartLegend({Key key}) : super(key: key);
  @override
  State<LineChartLegend> createState() => _LineChartLegendState();
}

class _LineChartLegendState extends State<LineChartLegend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
      width: 300,
      color: colorSection,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Balanse',
                textAlign: TextAlign.left,
                style: TextStyle(color: colorTextblack),
              ),
              SizedBox(width: 10),
              indicator5,
            ],
          ),

          // STARTSUM
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Prinsipp',
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
            ],
          ),
        ],
      ),
    );
  }
}

// *___________ LINE CHART Builder ____________
class LineChartBuilder extends StatefulWidget {
  const LineChartBuilder({Key key}) : super(key: key);
  @override
  State<LineChartBuilder> createState() => _LineChartBuilderState();
}

class _LineChartBuilderState extends State<LineChartBuilder> {
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

    double newMaxY = getNewMax(endBalanceSeries.last) as double;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 5, 10),
      width: 400,
      height: 400,
      color: colorSection,
      child: LineChart(
        LineChartData(
          //
          // _____ Chart Settings _____
          rangeAnnotations: RangeAnnotations(),
          gridData: FlGridData(),
          maxX: (endBalanceSeries.length * 1.0),
          maxY: newMaxY,
          minX: 0,
          minY: 0,
          baselineY: 0,
          baselineX: 0,
          clipData:
              FlClipData(top: true, bottom: false, left: true, right: false),
          borderData: FlBorderData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          // _____ Touch Settings _____
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
          ),

          // _____ Line Bars Settings _____
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
                color: colorDarkGreen)
            // color: colorLightBlue)
          ],
        ),
      ),
    );
  }

  getNewMax(endBalance) {
    double B = endBalance * 1.5;
    int bInt = B.round();
    var multiplier = pow(
        10,
        bInt.toString().length -
            1); //? "-2" for removing decimals or just convert to int
    var dec = B / multiplier;
    int rounded = dec.round();
    return rounded.toDouble() * multiplier; //? revert back
  }
}

// *___________ LINE CHART Header ____________
class LineChartHeader extends StatefulWidget {
  const LineChartHeader({Key key}) : super(key: key);
  @override
  State<LineChartHeader> createState() => _LineChartHeaderState();
}

class _LineChartHeaderState extends State<LineChartHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(00.0, 0.0, 00.0, 0.0),
      child: Container(
        color: colorSection,
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Container(
            constraints: BoxConstraints.expand(
              height: 60,
              width: 300,
            ),
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: colorDarkGreen,
              boxShadow: customBoxShadow(),
            ),
            child: Text(
              'Utvikling',
              textAlign: TextAlign.center,
              style: TextStyle(color: colorHeadline, fontSize: 30),
            )),
      ),
    );
  }
}


/* 
! PLAN FOR ROUNDING MAXY:

51 695,21 ==> 100 000.00 (48%)
864762,25 ==> 1 000 000.00 (15%)
* ___ ALT 1 _________

  TODO ==> (old) maxY = 51 695,21
  B = endbalance.last;
  multiplier = pow(10, B.length - 2) //? "-2" for removing decimals or just convert to int
  dec = B / multiplier;
  rounded = dec.rounded()
  newB = rounded * multiplier;       //? revert back 
  TODO ==> (new) maxY = 100 000.00 

  double newBd = double.parse(newB); //? if needed
  double newBd = newBd + 0.0;        //? if needed
  

* ___ ALT 2 _________

  TODO ==> (old) maxY = 51 695,21
  B = endbalance.last;
  multiplier = pow(10, B.length - 3) //? "-3" for removing decimals & keep B>1
  chg = B * 1,1                      //? make 10% bigger 
  dec = B / multiplier;
  rounded = dec.rounded(1)           //? round up but keep one decimal 
  newB = rounded * multiplier;       //? revert back 
  TODO ==> (new) maxY = 57 000.00 

  double newBd = double.parse(newB); //? if needed
  double newBd = newBd + 0.0;        //? if needed
  


 */
