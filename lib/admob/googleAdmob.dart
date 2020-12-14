import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import '../services/admob_services.dart';

class AdmobFullPage extends StatefulWidget {
  AdmobFullPage(this.ad, {Key key}) : super(key: key);
  final ad;
  @override
  _AdmobFullPageState createState() => _AdmobFullPageState();
}

class _AdmobFullPageState extends State<AdmobFullPage> {
  final ams = AdMobServices();

  @override
  void initState() {
    super.initState();
    // initializes the admob package
    var appID = ams.getAdmobAppId();
    Admob.initialize(testDeviceIds: [appID]);
    widget.ad..load()..show();
  }

  void dispose() {
    widget.ad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Full Page'),
        ),
        body: Container(
          child: Center(child: Text('Full Page Ad')),
        ));
  }
}
