import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:admob_flutter/admob_flutter.dart';
import './services/admob_services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ads_integration_flutter/admob/googleAdmob.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.tabIndex, this.title, {Key key}) : super(key: key);
  final String title;
  final int tabIndex;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // initializes our admob service
  final ams = AdMobServices();
  //Define ad Units variables
  AdmobInterstitial myInterstitial;
  AdmobReward admobReward;
  final _nativeAdController = NativeAdmobController();

  int _currentIndex = 0;
  int _rewardAmount = 0;

  @override
  void dispose() {
    myInterstitial?.dispose();
    admobReward?.dispose();
    _nativeAdController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // initializes the admob package
    var appID = ams.getAdmobAppId();
    Admob.initialize(testDeviceIds: [appID]);
    // initialize interstitial variable
    myInterstitial = new AdmobInterstitial(
      adUnitId: ams.getFullPageAddId(),
    );

    // load interstitial variable
    myInterstitial.load();
    // initialize Reward variable
    admobReward = new AdmobReward(
      adUnitId: ams.getRewardAddId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) admobReward.load();
        handleEvent(args);
      },
    );
    // load Reward variable
    admobReward.load();
    // assign the widget passed index value
    _currentIndex = widget.tabIndex;
  }

  //handler method for the reward ad
  void handleEvent(Map<String, dynamic> args) {
    print('3943444444444444444444934344444444 $args');
    if (args.isNotEmpty && args != null)
      setState(() {
        _rewardAmount += args['amount'];
      });
  }

//  Bottom navigator items
  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.google),
      label: 'Google Admob',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.facebook),
      label: 'Facebook Ads',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.games),
      label: 'Unity Ads',
      backgroundColor: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List screens = [
      // first screen
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextLiquidFill(
              text: 'ADS APP Flutter',
              waveColor: Colors.blueAccent,
              boxBackgroundColor: Colors.redAccent,
              textStyle: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      // second screen
      Align(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Center(
                  child: Text('Banner Add'),
                ),
                SizedBox(height: 10),
                AdmobBanner(
                  adSize: AdmobBannerSize.FULL_BANNER,
                  adUnitId: ams.getBannerAddId(),
                ),
              ]),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return AdmobFullPage(myInterstitial);
                  }));
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: Colors.blue[200]),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text('Full Page Add'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (await admobReward.isLoaded)
                    admobReward.show();
                  else
                    print('ne');
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: Colors.green),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reward Ad',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '$_rewardAmount Coins',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Column(children: [
                Center(
                  child: Text('Native Ad'),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        color: Colors.orange),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: NativeAdmob(
                        adUnitID: ams.getLayoutAddId(),
                        numberAds: 3,
                        controller: _nativeAdController,
                        type: NativeAdmobType.full,
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
      ),
      // third screen
      Align(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Banner Add'),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: Colors.blue[200]),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text('Full Page Add'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: Colors.green),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text('Reward Ad'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: Colors.orange),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text('Layout Ad'),
                  ),
                ),
              ),
            ]),
      ),
      // fourth screen
      Align(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Banner Add'),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: Colors.blue[200]),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text('Full Page Add'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: Colors.green),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text('Reward Ad'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: Colors.orange),
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text('Layout Ad'),
                  ),
                ),
              ),
            ]),
      ),
    ];

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          currentIndex: _currentIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: screens[_currentIndex]);
  }
}
