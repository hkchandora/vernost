import 'package:flutter/material.dart';
import 'package:vernost/util/colors.dart';

class Utility{

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

}