import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Constants.dart';
import 'package:flutter_app/utils/MyColors.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final Color color, textColor;

  const CustomAppBar({
    Key key,
    this.text,
    this.color = kToolbarColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
    );
  }
}
