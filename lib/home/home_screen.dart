import 'package:flutter/material.dart';
import 'package:vernost/util/colors.dart';
import 'package:vernost/util/utility.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility.commonAppBar(title: "Home", isCenter: true),
      backgroundColor: colorBg,
    );
  }
}
