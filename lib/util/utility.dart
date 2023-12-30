import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vernost/util/colors.dart';

class Utility{

  ///All Screens common app bar
  static commonAppBar({
    required String title,
    required bool isCenter,
  }){
    return AppBar(
      title: Text(title,
        style: const TextStyle(color: colorBlack),
      ),
      backgroundColor: appTheme,
      centerTitle: isCenter,
    );
  }

  ///Check Internet connectivity
  static Future<bool> isNetworkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }


  ///Show alert toast message
  static showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
