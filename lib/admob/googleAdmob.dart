import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import '../screensPage.dart';
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
    widget.ad..load();
  }

  void dispose() {
    widget.ad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              widget.ad..load();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MyHomePage(1,'Flutter Demo Home Page');
              }));
            },
          ),
          title: Text('Full Page'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return FutureBuilder(
                future: widget.ad.isLoaded,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == true) {
                      widget.ad.show();
                      return Center(child: Text('Another Page'));
                    } else {
                      return Center(
                          child: Text('Ad Lunch failed in another page'));
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                });
          },
        ));
  }
}
