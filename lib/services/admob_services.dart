import 'dart:io';

class AdMobServices {
// Class implements helper methods that provive unit IDs and app ID

  // Method provides app ID
  String getAdmobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4117522516334526~2284903907';
    }
    return null;
  }

  // Method provides banner unit ID
  String getBannerAddId() {
     if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }

  // Method provides interstial unit ID
  String getFullPageAddId() {
     if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    return null;
  }
  
  // Method provides reward unit ID
  String getRewardAddId() {
     if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    }
    return null;
  }

  // Method provides lyout unit ID
  String getLayoutAddId() {
     if (Platform.isAndroid) {
      return 'ca-app-pub-4117522516334526/7380725010';
    }
    return null;
  }


}
