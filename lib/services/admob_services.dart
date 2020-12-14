import 'dart:io';

class AdMobServices {
  String getAdmobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4117522516334526~2284903907';
    }
    return null;
  }

  String getBannerAddId() {
     if (Platform.isAndroid) {
      return 'ca-app-pub-4117522516334526/3110900414';
    }
    return null;
  }

  String getFullPageAddId() {
     if (Platform.isAndroid) {
      return 'ca-app-pub-4117522516334526/4455911297';
    }
    return null;
  }


}
