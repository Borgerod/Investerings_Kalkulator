import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:investerings_kalkulator/flutter_flow/flutter_flow_ad_banner.dart';
import 'package:investerings_kalkulator/utilities/color_variables.dart';

//* ___________ FOOTER AD BANNER _______________________________________________
class AdFooter extends StatefulWidget {
  const AdFooter(
      {Key key,
      @required this.showsTestAd,
      this.width,
      this.height,
      this.iOSAdUnitID,
      this.androidAdUnitID})
      : super(key: key);
  final double width;
  final double height;
  final bool showsTestAd;
  final String iOSAdUnitID;
  final String androidAdUnitID;
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
          color: colorFooter,
          shape: BoxShape.rectangle,
        ),
        alignment: AlignmentDirectional(0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              // padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 30),
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: FlutterFlowAdBanner(
                width: 320,
                height: 50,
                showsTestAd: widget.showsTestAd,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//* ___________ AD BANNER [MULIG IKKE I BRUK] __________________________________
class AdBanner extends StatefulWidget {
  const AdBanner(
      {Key key,
      @required this.showsTestAd,
      this.width,
      this.height,
      this.iOSAdUnitID,
      this.androidAdUnitID})
      : super(key: key);
  final double width;
  final double height;
  final bool showsTestAd;
  final String iOSAdUnitID;
  final String androidAdUnitID;
  @override
  _AdBannerState createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  @override
  Widget build(BuildContext context) {
    return FlutterFlowAdBanner(
      width: 320,
      height: 50,
      showsTestAd: widget.showsTestAd,
    );
  }
}

// //* _________ AD BANNERS [MIGRERT FRA HOMEPAGE] [NOT IN USE]________________________________
// class GoogleAdBanner extends StatefulWidget {
//   const GoogleAdBanner({Key key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _GoogleAdBannerState();
// }

// class _GoogleAdBannerState extends State<MyHomePage> {
//   BannerAd _bannerAd;
//   @override
//   void initState() {
//     super.initState();
//     _initBannerAd();
//   }

//   _initBannerAd() {
//     _bannerAd = BannerAd(
//       size: AdSize.banner,
//       adUnitId: 'ca-app-pub-5221781377408365/2391796173',
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           setState(() {});
//         },
//         onAdFailedToLoad: (ad, error) {},
//       ),
//       request: AdRequest(),
//     );
//     _bannerAd.load();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//   }
// }



// //* ______ OTHER ____________________________________________________________
// class AdBanner extends StatefulWidget {
//   const AdBanner({Key key}) : super(key: key);

//   @override
//   _AdBannerState createState() => _AdBannerState();
// }

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