import 'package:flutter/material.dart';
import 'package:investerings_kalkulator/homepage_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'flutter_flow/flutter_flow_ad_banner.dart';
import 'homepage_widget.dart';

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
      backgroundColor: Colors.transparent,
      // backgroundColor: colorBackground,
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 170),
                InputForm(),
                SizedBox(height: 10),
                BeforAfterSwitch(),
                SizedBox(height: 30),
                StartButton(),
                SizedBox(height: 30),
                FlutterFlowAdBanner(width: 336, height: 280, showsTestAd: true),
                SizedBox(height: 30),
                ResultDisplay(),
                SizedBox(height: 30),
                FlutterFlowAdBanner(width: 320, height: 100, showsTestAd: true),
                SizedBox(height: 30),
                PieChartDisplay(),
                SizedBox(height: 30),
                LineChartDisplay(),
                SizedBox(height: 30),
                FlutterFlowAdBanner(width: 320, height: 50, showsTestAd: true),
                SizedBox(height: 30),
                DataTableDisplay(),
                SizedBox(height: 30),
                FlutterFlowAdBanner(width: 320, height: 50, showsTestAd: true),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _isAdLoaded
          ? Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : SizedBox(),
    );
  }
}
