import 'flutter_flow/flutter_flow_ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quiver/iterables.dart';
import 'color_variables.dart';
import 'package:provider/provider.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'state_provider.dart';
import 'widget/custom_box_shadow.dart';
import 'widget/custom_texts.dart';

//* ___________ UI _____________________________________________________________
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd _bannerAd;
  bool _isAdLoaded = false;
  @override
  void initState() {
    super.initState();
    _initBannerAd();
  }

  _initBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-5221781377408365/2391796173',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {},
      ),
      request: AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                InputForm(),
                // SizedBox(height: 30),
                ButtonContainer(),
                // BeforAfterSwitch(),
                // SizedBox(height: 30),
                // StartButton(),
                SizedBox(height: 30),
                // AdBanner(),
                // Text("_________RESULTAT_________",
                // style: TextStyle(color: colorTextblack)),
                ResultDisplay(),
                SizedBox(height: 30),
                // Text('PIE CHART:', style: TextStyle(color: colorTextblack)),
                PieChartDisplay(),
                SizedBox(height: 30),
                LineChartDisplay(),
                SizedBox(height: 30),
                DataTableDisplay(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          // constraints: BoxConstraints.expand(),
          height: 55,
          // width: 300,
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(3),
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
                  style: TextStyle(color: colorCharcoal),
                  textAlign: TextAlign.end,
                  decoration: inputDecor('Startsum', 'kr'),
                  controller: _ctrl1,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      context
                          .read<InputProvider>()
                          .changePrincipleAmt(double.parse(("0")));
                    } else {
                      context
                          .read<InputProvider>()
                          .changePrincipleAmt(double.parse((val)));
                    }
                  }),
              SizedBox(height: 10),
              TextFormField(
                  style: TextStyle(color: colorCharcoal),
                  textAlign: TextAlign.end,
                  decoration: inputDecor('antall år', 'år'),
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
                  decoration: inputDecor('perioder *', 'ant'),
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
                  decoration: inputDecor('dividende', '%'),
                  controller: _ctrl4,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      context
                          .read<InputProvider>()
                          .changeAnnualRate(double.parse(("0")));
                    } else {
                      context
                          .read<InputProvider>()
                          .changeAnnualRate(double.parse((val)));
                    }
                  }),
              SizedBox(height: 10),
              TextFormField(
                  style: TextStyle(color: colorCharcoal),
                  textAlign: TextAlign.end,
                  decoration: inputDecor('tilleggsbidrag', 'kr'),
                  controller: _ctrl5,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  onChanged: (val) {
                    if (val.isEmpty) {
                      context
                          .read<InputProvider>()
                          .changeMonthlyContribution(double.parse(("0")));
                    } else {
                      context
                          .read<InputProvider>()
                          .changeMonthlyContribution(double.parse((val)));
                    }
                  }),
            ],
          ),
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
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

  inputDecor(label, hintlabel) {
    return InputDecoration(
      focusColor: colorHazyGreen,
      alignLabelWithHint: true,
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      prefixIcon:
          Text("      $label   ", style: TextStyle(color: colorTextblack)),
      contentPadding: const EdgeInsets.only(left: 20.0, right: 10.0),
      filled: true,
      fillColor: colorWhite,
      hintText: hintlabel,
      hintStyle: TextStyle(
        color: colorTextGray,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

//* ___________ BUTTON CONTAINER _______________________________________________
class ButtonContainer extends StatefulWidget {
  const ButtonContainer({Key key}) : super(key: key);
  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            BeforAfterSwitch(),
            SizedBox(height: 20),
            StartButton(),
          ],
        ));
  }
}

//* ___________ BEFORE/AFTER SWITCH ____________________________________________
class BeforAfterSwitch extends StatefulWidget {
  const BeforAfterSwitch({Key key}) : super(key: key);
  @override
  State<BeforAfterSwitch> createState() => _BeforAfterSwitchState();
}

class _BeforAfterSwitchState extends State<BeforAfterSwitch> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: 15),
        // padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          // boxShadow: customBoxShadow(),
          color: colorWhite,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  'Skal tilleggsbidragene betales før eller etter hver periode?  ',
                  style: TextStyle(color: colorTextblack)),
            )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: colorLightBackgroundGray,
                thumbColor: colorWhite,
                padding: EdgeInsets.all(2),
                groupValue: groupValue,
                children: {
                  0: buildSegment("før"),
                  1: buildSegment("etter"),
                },
                onValueChanged: (value) {
                  context
                      .read<BeforeAfterProvider>()
                      .setButtonState(groupValue);
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            ),
          ],
        ));
  }

  Widget buildSegment(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: colorCharcoal),
      ),
    );
  }
}

//* ___________ START BUTTON ___________________________________________________
class StartButton extends StatefulWidget {
  const StartButton({Key key}) : super(key: key);
  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    double newPrincipleAmt = context.watch<InputProvider>().principleAmt;
    double newTerms = context.watch<InputProvider>().terms;
    double newCompoundsPerYear =
        context.watch<InputProvider>().compoundsPerYear;
    double newAnnualRate = context.watch<InputProvider>().annualRate;
    double newMonthlyContribution =
        context.watch<InputProvider>().monthlyContribution;

    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minWidth: 300,
      height: 50,
      color: colorHazyGreen,
      onPressed: () {
        context.read<InputCalcProvider>().changePrincipleAmt(newPrincipleAmt);
        context.read<InputCalcProvider>().changeTerms(newTerms);
        context
            .read<InputCalcProvider>()
            .changeCompoundsPerYear(newCompoundsPerYear);
        context.read<InputCalcProvider>().changeAnnualRate(newAnnualRate);
        context
            .read<InputCalcProvider>()
            .changeMonthlyContribution(newMonthlyContribution);
      },
      child: Text("Regn Ut", style: TextStyle(color: colorWhite)),
    );
  }
}

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

class GetResults {
  resultat(principle, timeDeltaInYears, periods, interestRate,
      additionalContributions, beforeAfterVal) {
    double raisedtopower2 = (periods * timeDeltaInYears);
    double dividend = interestRate / 100;

    // VALUE OF CONTRIBUTION END OF MONTH (AFTER)
    double pmtA = additionalContributions *
        (pow((1 + dividend / periods), (periods * timeDeltaInYears)) - 1) /
        (dividend / periods);

    // VALUE OF CONTRIBUTION BEGINNING OF MONTH (BEFORE)
    double extra = (1 + (dividend / periods));
    double pmtB = pmtA * extra;

    // VALUE OF INVESTMENT WITHOUT CONTRIBUTION
    double PV = principle *
        (pow((1 + (dividend / periods)), (periods * timeDeltaInYears)));

    double FVa = PV + pmtA;
    double FVb = PV + pmtB;

    double startPrinciple = principle;
    double totalContributions =
        additionalContributions * (periods * timeDeltaInYears);
    double interestAccruedBefore = FVb - startPrinciple - totalContributions;
    double interestAccruedAfter = FVa - startPrinciple - totalContributions;

    double roiB = (FVb - (startPrinciple + totalContributions)) /
        (startPrinciple + totalContributions) *
        100;
    double roiA = (FVa - (startPrinciple + totalContributions)) /
        (startPrinciple + totalContributions) *
        100;
    double annualizedRoiB = (pow((FVb / (startPrinciple + totalContributions)),
                (1 / timeDeltaInYears)) -
            1) *
        100;
    double annualizedRoiA = (pow((FVa / (startPrinciple + totalContributions)),
                (1 / timeDeltaInYears)) -
            1) *
        100;
    double totalGrowthBefore = (FVb - (totalContributions + startPrinciple)) /
        (totalContributions + startPrinciple) *
        100;
    if (beforeAfterVal == 0) {
      return [
        FVb,
        principle,
        totalContributions,
        interestAccruedBefore,
        roiB,
        annualizedRoiA,
        totalGrowthBefore,
        raisedtopower2,
        dividend,
      ];
    } else {
      return [
        FVa,
        principle,
        totalContributions,
        interestAccruedAfter,
        roiA,
        annualizedRoiB,
        raisedtopower2,
        dividend,
      ];
    }
  }
}

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
                    child: Text(
                      'Oversikt',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: colorHeadline, fontSize: 30),
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
                          indicator1,
                        ],
                      ),
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
                          indicator2,
                          // indicator3
                        ],
                      ),
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
      PieChartSectionData(
        color: colorDarkGreen,
        value: principleAmt / total,
        title: '${(((principleAmt / total) * 100).toStringAsFixed(1))}%',
        titleStyle: TextStyle(
          color: colorBackground,
        ),
      ),
      PieChartSectionData(
        color: colorAmber,
        value: totalContributions / total,
        title: '${(((totalContributions / total) * 100).toStringAsFixed(1))}%',
        titleStyle: TextStyle(
          color: colorBackground,
        ),
      ),
      PieChartSectionData(
        color: colorHazyGreen,
        value: interestAccrued / total,
        title: '${(((interestAccrued / total) * 100).toStringAsFixed(1))}%',
        titleStyle: TextStyle(
          color: colorBackground,
        ),
      ),
    ];
    return data;
  }
}

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

    List SeriesList = GetRows().resultat(principleAmt, timeDeltaInYears,
        periods, interestRate, additionalContributions, beforeAfterVal);

    List<dynamic> interestSeries = SeriesList[2];
    List<dynamic> endprincipalSeries = SeriesList[4];
    List<dynamic> endBalanceSeries = SeriesList[5];

    List<FlSpot> BalanceData = endBalanceSeries.asMap().entries.map((e) {
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
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Container(
              padding: EdgeInsets.all(5),
              width: 340,
              height: 200,
              color: colorSection,
              child: PageView(
                children: [
                  LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      maxY: (endBalanceSeries.last * 1.10),
                      baselineY: 1,
                      clipData: FlClipData(
                          top: true, bottom: true, left: false, right: true),
                      lineBarsData: [
                        //* END BALANCE LINE
                        LineChartBarData(
                          dotData: FlDotData(
                            show: false,
                          ),
                          spots: BalanceData,
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

class GetRows {
  resultat(principle, timeDeltaInYears, periods, interestRate,
      additionalContributions, beforeAfterVal) {
    double raisedtopower2 = (periods * timeDeltaInYears);
    double dividend = interestRate / 100;
    double extra = (1 + (dividend / periods));

    List startPrincipleAfter = [principle];
    List startBalanceAfter = [principle];
    List interestAfter = [(principle * (dividend / periods))];
    List interestAccruedAfter = [(principle * (dividend / periods))];
    List endPrincipleAfter = [];
    List endBalanceAfter = [];

    //* _____ FinalValue [AFTER] _____________________________________
    for (var i = 1; i < raisedtopower2 + 1; i++) {
      double FVa = (principle * (pow((1 + (dividend / periods)), (i)))) +
          (additionalContributions *
              (pow((1 + dividend / periods), (i)) - 1) /
              (dividend / periods));

      //? ___ End Balance ________
      endBalanceAfter.add(FVa);

      //? ___ Start Principle ________
      startPrincipleAfter
          .add(principle + (additionalContributions * i)); //! MULIG OPMVENDT

      //? ___ End Principle ________
      endPrincipleAfter.add(
          principle + (additionalContributions * (i + 1))); //! MULIG OPMVENDT

      //? ___ Interest ________
      interestAfter.add(FVa * (dividend / periods));

      //? ___ interest Accrued ________
      interestAccruedAfter
          .add((interestAccruedAfter[i - 1] + (FVa * (dividend / periods))));
    }

    //? ___ End Balance ________
    for (var i = 0; i < endBalanceAfter.length - 1; i++) {
      startBalanceAfter.add(endBalanceAfter[i]);
    }

    //* _____ FinalValue [AFTER] _____________________________________
    List startPrincipleBefore = [];
    List startBalanceBefore = [];
    List interestBefore = [];
    List interestAccruedBefore = [];
    List endPrincipleBefore = [];
    List endBalanceBefore = [];
    for (var i = 1; i < raisedtopower2 + 1; i++) {
      double FVb =
          (principle * (pow((1 + (dividend / periods)), (periods * i)))) +
              ((additionalContributions *
                      (pow((1 + dividend / periods), (periods * i)) - 1) /
                      (dividend / periods)) *
                  (1 + (dividend / periods)));
      endBalanceBefore.add(FVb);
      interestBefore.add(FVb - additionalContributions - principle);
      interestAccruedBefore
          .add(additionalContributions * i); //! WRONG CHECK _interestList
      startPrincipleBefore
          .add(principle + (additionalContributions * i)); //! MULIG OPMVENDT
      endPrincipleBefore.add(
          principle + (additionalContributions * (i + 1))); //! MULIG OPMVENDT
    }
    for (var i = 0; i < endBalanceBefore.length - 1; i++) {
      startBalanceBefore.add(endBalanceBefore[i]);
    }
    //* _____ Return [AFTER OR BEFORE] _________________________________

    if (beforeAfterVal == 0) {
      return [
        startPrincipleAfter,
        startBalanceAfter,
        interestAfter,
        interestAccruedAfter,
        endPrincipleAfter,
        endBalanceAfter,
      ];
    } else {
      return [
        startPrincipleBefore,
        startBalanceBefore,
        interestBefore,
        interestAccruedBefore,
        endPrincipleBefore,
        endBalanceBefore,
      ];
    }
  }
}

//* ___________ DATAFRAME DISPLAY ______________________________________________
class DataTableDisplay extends StatefulWidget {
  const DataTableDisplay({Key key}) : super(key: key);
  @override
  State<DataTableDisplay> createState() => _DataTableDisplayState();
}

class _DataTableDisplayState extends State<DataTableDisplay> {
  @override
  Widget build(BuildContext context) {
    double principleAmt = context.watch<InputCalcProvider>().principleAmt;
    double timeDeltaInYears = context.watch<InputCalcProvider>().terms;
    double periods = context.watch<InputCalcProvider>().compoundsPerYear;
    double interestRate = context.watch<InputCalcProvider>().annualRate;
    double additionalContributions =
        context.watch<InputCalcProvider>().monthlyContribution;
    int beforeAfterVal = context.watch<BeforeAfterProvider>().buttondata;
    List SeriesList = GetRows().resultat(principleAmt, timeDeltaInYears,
        periods, interestRate, additionalContributions, beforeAfterVal);

    return Container(
      decoration: BoxDecoration(
        boxShadow: customBoxShadow(),
        color: colorSection,
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                boxShadow: customBoxShadow(),
                color: colorDarkGreen,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'Kontantstrøm',
                textAlign: TextAlign.center,
                style: TextStyle(color: colorHeadline, fontSize: 30),
              ),
            ),
          ]),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(),
            child: BuildMap()._createDataTable(SeriesList),
          ),
        ],
      ),
    );
  }
}

class BuildMap {
  // CREATE DATATABLE (as ScrollView)
  SingleChildScrollView _createDataTable(SeriesList) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FittedBox(
                child: DataTable(
                    columnSpacing: 30,
                    horizontalMargin: 10,
                    columns: _createColumns(),
                    rows: _createRows(SeriesList)))));
  }

  // COLUMNS for DATATABLE
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: SizedBox(
          width: 50,
          child: Text(
            'termin',
            maxLines: 2,
            style: TextStyle(color: colorTextblack),
          ),
        ),
      ),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Start prinsipp',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Start Balanse',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Rente',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Løpende Rente',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Slutt Balanse',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Slutt Prinsipp',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
    ];
  }

  List<DataRow> _createRows(SeriesList) {
    List datatableList = DataTableMapper().mapBuilder(SeriesList);

    return datatableList
        .map((results) => DataRow(cells: [
              DataCell(SizedBox(
                  width: 20,
                  child: Text(
                    results['index'].toStringAsFixed(0),
                    style: TextStyle(color: colorTextblack),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ))),
              DataCell(Text(
                  results['startPrinciple'].toStringAsFixed(2) + ' kr',
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['startBalance'].toStringAsFixed(2) + ' kr',
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['interest'].toStringAsFixed(2) + ' kr',
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(
                  results['interestAccrued'].toStringAsFixed(2) + ' kr',
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['endBalance'].toStringAsFixed(2) + ' kr',
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['endPrinciple'].toStringAsFixed(2) + ' kr',
                  style: TextStyle(color: colorTextblack))),
            ]))
        .toList();
  }
}

class DataTableMapper {
  mapBuilder(SeriesList) {
    List<dynamic> startPrinciple = SeriesList[0];
    List<dynamic> startBalance = SeriesList[1];
    List<dynamic> interest = SeriesList[2];
    List<dynamic> interestAccrued = SeriesList[3];
    List<dynamic> endPrinciple = SeriesList[4];
    List<dynamic> endBalance = SeriesList[5];
    List index = [for (var i = 1; i <= startPrinciple.length; i++) i];

    // REORGANISERING AV DATA STRUKTUREN (COLUMN BASED LIST -> ROW BASED MAP/DICT):
    List datatableList = [];
    for (final i in zip([
      index,
      startPrinciple,
      startBalance,
      interest,
      interestAccrued,
      endBalance,
      endPrinciple,
    ])) {
      var iterationMap = {
        'datatableMap': i,
      };
      var datatableMap = {
        'index': iterationMap['datatableMap'][0],
        'startPrinciple': iterationMap['datatableMap'][1],
        'startBalance': iterationMap['datatableMap'][2],
        'interest': iterationMap['datatableMap'][3],
        'interestAccrued': iterationMap['datatableMap'][4],
        'endBalance': iterationMap['datatableMap'][5],
        'endPrinciple': iterationMap['datatableMap'][6],
      };
      datatableList.add(datatableMap);
    }
    // RETURNING "DATA TABLE LIST" to --> "_createDataTable()"
    return datatableList;
  }
}

//* ___________ DATAFRAME INDEX SWITCH _________________________________________
// class IndexSwitch extends StatefulWidget {
//   const IndexSwitch({Key? key}) : super(key: key);
//   @override
//   State<IndexSwitch> createState() => _IndexSwitchState();
// }

// class _IndexSwitchState extends State<IndexSwitch> {
//   @override
//   Widget build(BuildContext context) {

//   }
// }

// class TableReorganiser extends StatefulWidget {
//   const TableReorganiser({Key? key}) : super(key: key);
//   @override
//   State<TableReorganiser> createState() => _TableReorganiserState();
// }

// class _TableReorganiserState extends State<TableReorganiser> {
//   @override
//   Widget build(BuildContext context) {

//   }
// }

// //* ___________ GOOGLE ADS _________________________________________
// class SmallAds extends StatefulWidget {
//   const SmallAds({Key? key}) : super(key: key);
//   @override
//   State<SmallAds> createState() => _SmallAdsState();
// }

// class _SmallAdsState extends State<SmallAds> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(10, 100, 10, 10),
//       child: FlutterFlowAdBanner(
//         width: 320,
//         height: 100,
//         showsTestAd: true,
//         androidAdUnitID: ' ca-app-pub-5221781377408365/4288112022',
//         iOSAdUnitID: 'ca-app-pub-5221781377408365/6095754389',
//         // key: ,
//       ),
//     );
//   }
// }

// class BigAds extends StatefulWidget {
//   const BigAds({Key? key}) : super(key: key);
//   @override
//   State<BigAds> createState() => _BigAdsState();
// }

// class _BigAdsState extends State<BigAds> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(10, 100, 10, 10),
//       child: FlutterFlowAdBanner(
//         width: 320,
//         height: 100,
//         showsTestAd: true,
//         androidAdUnitID: 'ca-app-pub-5221781377408365/7419626107',
//         iOSAdUnitID: 'ca-app-pub-5221781377408365/4288112022',
//         // key: null,
//       ),
//     );
//   }
// }

// big
// ca-app-pub-5221781377408365~1458505379
// ca-app-pub-5221781377408365/4288112022

// android small
// ca-app-pub-5221781377408365~9157295323
// ca-app-pub-5221781377408365/2591886975

// android big
// ca-app-pub-5221781377408365~9157295323
// ca-app-pub-5221781377408365/7419626107

class AdBanner extends StatefulWidget {
  const AdBanner({Key key}) : super(key: key);

  @override
  _AdBannerState createState() => _AdBannerState();
}

// class _AdBannerState extends State<AdBanner> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height * 1,
//         children: [
//           FlutterFlowAdBanner(
//             width: 320,
//             height: 100,
//             showsTestAd: true,
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

class _AdBannerState extends State<AdBanner> {
  @override
  Widget build(BuildContext context) {
    return FlutterFlowAdBanner(
      width: 320,
      height: 50,
      showsTestAd: true,
    );
  }
}

//     Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         if (responsiveVisibility(
//           context: context,
//           tablet: false,
//           tabletLandscape: false,
//           desktop: false,
//         ))
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
//             child: FlutterFlowAdBanner(
//               width: 320,
//               height: 100,
//               showsTestAd: true,
//             ),
//           ),
//         if (responsiveVisibility(
//           context: context,
//           phone: false,
//         ))
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
//             child: FlutterFlowAdBanner(
//               width: 970,
//               height: 90,
//               showsTestAd: true,
//             ),
//           ),
//       ],
//       ),
//     );
//   }
// }

class AdFooter extends StatefulWidget {
  const AdFooter({Key key}) : super(key: key);

  @override
  _AdFooterState createState() => _AdFooterState();
}

class _AdFooterState extends State<AdFooter> {
  @override
  Widget build(BuildContext context) {
    return Align(
      // alignment: AlignmentDirectional(0, 1.13),
      alignment: AlignmentDirectional(0, 1.08),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(
          color: Color(0xA9C4C4C4),
          shape: BoxShape.rectangle,
        ),
        alignment: AlignmentDirectional(0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 30),
              child: FlutterFlowAdBanner(
                width: 320,
                height: 50,
                showsTestAd: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
