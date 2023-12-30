import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vernost/util/strings.dart';

class NoDataWidget extends StatefulWidget {
  const NoDataWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return NoDataWidgetState();
  }
}

class NoDataWidgetState extends State<NoDataWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildNoDataWidget();
  }

  Widget _buildNoDataWidget() {
    return const Center(
      child: Text(Strings.noData),
    );
  }
}
