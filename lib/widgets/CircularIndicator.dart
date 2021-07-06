import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Constants.dart';
import 'package:flutter_app/utils/MyColors.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
      strokeWidth: 2,
    );
  }

}
