import 'dart:io';

class AdMobServices {
  String getAdmobAppId() {
    if (Platform.isAndroid) {
      return 'your-key';
    }
    return null;
  }

  String getBannerAddId() {
     if (Platform.isAndroid) {
      return 'your-key';
    }
    return null;
  }

  String getFullPageAddId() {
     if (Platform.isAndroid) {
      return 'your-key';
    }
    return null;
  }


}
