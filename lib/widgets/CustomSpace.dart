import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Constants.dart';

class CustomSpace extends StatelessWidget {

  final double size;

  const CustomSpace({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:size);
  }

}
