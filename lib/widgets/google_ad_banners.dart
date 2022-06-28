import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:investerings_kalkulator/config.dart';
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
      // alignment: AlignmentDirectional(0, 1.08),
      alignment: AlignmentDirectional(0, 1.05),
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
                  showsTestAd: false,
                  iOSAdUnitID: iOSAdUnitIdSmall,
                  androidAdUnitID: androidAdUnitIdSmall),
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
