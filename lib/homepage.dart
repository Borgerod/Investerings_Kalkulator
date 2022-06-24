import 'package:flutter/material.dart';
import 'package:investerings_kalkulator/flutter_flow/flutter_flow_ad_banner.dart';
import 'package:investerings_kalkulator/widgets/dataframe_display.dart';
import 'package:investerings_kalkulator/widgets/google_ad_banners.dart';
import 'package:investerings_kalkulator/widgets/input_form.dart';
import 'package:investerings_kalkulator/widgets/line_chart_display.dart';
import 'package:investerings_kalkulator/widgets/pie_chart_display.dart';
import 'package:investerings_kalkulator/widgets/result_display.dart';
import 'package:investerings_kalkulator/widgets/switches.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String iOSAdUnitIdBig = 'ca-app-pub-5221781377408365/4288112022';
  String androidAdUnitIdBig = 'ca-app-pub-5221781377408365/7419626107';
  String iOSAdUnitIdSmall = 'ca-app-pub-5221781377408365/6095754389';
  String androidAdUnitIdSmall = 'ca-app-pub-5221781377408365/2591886975';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 170),
                    InputForm(),
                    SizedBox(height: 15),
                    ButtonContainer(),
                    SizedBox(height: 30),
                    FlutterFlowAdBanner(
                        width: 336,
                        height: 280,
                        showsTestAd: false,
                        iOSAdUnitID: iOSAdUnitIdBig,
                        androidAdUnitID: androidAdUnitIdBig),
                    SizedBox(height: 30),
                    ResultDisplay(),
                    SizedBox(height: 30),
                    FlutterFlowAdBanner(
                        width: 320,
                        height: 100,
                        showsTestAd: false,
                        iOSAdUnitID: iOSAdUnitIdSmall,
                        androidAdUnitID: androidAdUnitIdSmall),
                    SizedBox(height: 30),
                    PieChartDisplay(),
                    SizedBox(height: 30),
                    LineChartDisplay(),
                    SizedBox(height: 30),
                    FlutterFlowAdBanner(
                        width: 320,
                        height: 50,
                        showsTestAd: false,
                        iOSAdUnitID: iOSAdUnitIdSmall,
                        androidAdUnitID: androidAdUnitIdSmall),
                    SizedBox(height: 30),
                    DataTableDisplay(),
                    SizedBox(height: 30),
                    FlutterFlowAdBanner(
                        width: 320,
                        height: 100,
                        showsTestAd: false,
                        iOSAdUnitID: iOSAdUnitIdSmall,
                        androidAdUnitID: androidAdUnitIdSmall),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
          AdFooter(
              width: 320,
              height: 50,
              showsTestAd: false,
              iOSAdUnitID: iOSAdUnitIdSmall,
              androidAdUnitID: androidAdUnitIdSmall),
        ],
      ),
    );
  }
}
