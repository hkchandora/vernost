import 'package:flutter/material.dart';
import 'package:vernost/util/colors.dart';
import 'package:vernost/util/strings.dart';
import 'package:vernost/util/utility.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility.commonAppBar(title: Strings.homeScreenTitle, isCenter: true),
      backgroundColor: colorBg,
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Utility.isNetworkConnection().then((isNetwork) {
              if (isNetwork) {
                Navigator.of(context).pushNamed('/students');
              } else {
                Utility.showToastMessage(Strings.noInternet);
              }
            });
          },
          color: colorBlack,
          elevation: 2,
          child: const Text(Strings.allStudents,
            style: TextStyle(color: colorWhite),
          ),
        ),
      ),
    );
  }
}
