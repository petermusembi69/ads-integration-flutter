import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import '../services/admob_services.dart';

class AdmobFullPage extends StatefulWidget {
  AdmobFullPage({Key key}) : super(key: key);

  @override
  _AdmobFullPageState createState() => _AdmobFullPageState();
}

class _AdmobFullPageState extends State<AdmobFullPage> {
  final ams = AdMobServices();
  AdmobInterstitial myInterstitial;

  @override
  void dispose() {
    myInterstitial.dispose();
    super.dispose();
  }

  showAd() async {
    if (await myInterstitial.isLoaded) {
      myInterstitial.show();
    }
  }

  @override
  void initState() {
    super.initState();
    // initializes the admob package
    var appID = ams.getAdmobAppId();
    Admob.initialize(testDeviceIds: [appID]);
    myInterstitial = AdmobInterstitial(
      adUnitId: ams.getFullPageAddId(),
    );
    myInterstitial..load();
    showAd();
  }

  @override
  Widget build(BuildContext context) {
    showAd();
    return Scaffold(
        appBar: AppBar(
          title: Text('Full Page'),
        ),
        body: Container(
          child: Center(child: Text('Go back')),
        ));
  }
}
