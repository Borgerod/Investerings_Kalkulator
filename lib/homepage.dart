import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:investerings_kalkulator/config.dart';
import 'package:investerings_kalkulator/flutter_flow/flutter_flow_ad_banner.dart';
import 'package:investerings_kalkulator/flutter_flow/flutter_flow_ad_rewarded.dart';
import 'package:investerings_kalkulator/widgets/dataframe_display.dart';
import 'package:investerings_kalkulator/widgets/google_ad_banners.dart';
import 'package:investerings_kalkulator/widgets/input_form.dart';
import 'package:investerings_kalkulator/widgets/line_chart_display.dart';
import 'package:investerings_kalkulator/widgets/pie_chart_display.dart';
import 'package:investerings_kalkulator/widgets/result_display.dart';
import 'package:investerings_kalkulator/widgets/switches.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BannerAd staticAd;
  // late BannerAd staticAd;
  bool staticAdLoaded = false;
  BannerAd inlineAd;
  // late BannerAd inlineAd;
  bool inlineAdLoaded = false;

  static const AdRequest request = AdRequest(
    // keywords: ['',''],
    // contentUrl: [''],
    nonPersonalizedAds: false,
  );

  void laodStaticBannerAd() {
    staticAd = BannerAd(
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      request: request,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(
            () {
              staticAdLoaded = true;
            },
          );
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("ad failed to load  ${error.message}");
        },
      ),
    );
    staticAd.load();
  }

  void laodInlineBannerAd() {
    inlineAd = BannerAd(
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      request: request,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(
            () {
              inlineAdLoaded = true;
            },
          );
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("ad failed to load  ${error.message}");
        },
      ),
    );
    inlineAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                      // Container(
                      //   child: AdWidget(ad: staticAd),
                      //   width: 336,
                      //   height: 280,
                      //   // width: staticAd.size.width.toDouble(),
                      //   // height: staticAd.size.height.toDouble(),
                      // ),
                      // FlutterFlowAdBanner(
                      //   width: 336,
                      //   height: 280,
                      //   showsTestAd: true,
                      //   iOSAdUnitID: BannerAd.testAdUnitId,
                      //   androidAdUnitID: BannerAd.testAdUnitId,
                      // ),
                      FlutterFlowAdRewarded(
                          width: 320,
                          height: 480,
                          showsTestAd: false,
                          iOSAdUnitID: 'ca-app-pub-5221781377408365/6321567785',
                          androidAdUnitID:
                              'ca-app-pub-5221781377408365/5439715046'),
                      SizedBox(height: 30),
                      ResultDisplay(),
                      SizedBox(height: 30),
                      FlutterFlowAdBanner(
                          width: 320,
                          height: 100,
                          showsTestAd: false,
                          iOSAdUnitID: 'ca-app-pub-5221781377408365/6095754389',
                          androidAdUnitID:
                              'ca-app-pub-5221781377408365/2591886975'),
                      SizedBox(height: 30),
                      PieChartDisplay(),
                      SizedBox(height: 30),
                      LineChartDisplay(),
                      SizedBox(height: 30),
                      FlutterFlowAdBanner(
                          width: 320,
                          height: 50,
                          showsTestAd: false,
                          iOSAdUnitID: 'ca-app-pub-5221781377408365/6095754389',
                          androidAdUnitID:
                              'ca-app-pub-5221781377408365/2591886975'),
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
      ),
    );
  }
}
