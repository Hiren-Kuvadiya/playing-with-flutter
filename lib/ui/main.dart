import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/ui/HomeScreen.dart';
import 'package:flutter_app/ui/SecondScreen.dart';
import 'package:flutter_app/utils/SharedPreferencesHelper.dart';
import 'package:flutter_app/utils/StreamUtil.dart';
import 'package:flutter_app/utils/Constants.dart';
import 'package:flutter_app/widgets/CircularIndicator.dart';
import 'package:flutter_app/widgets/FormSpace.dart';
import 'package:flutter_app/widgets/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'LoginScreen.dart';
import '../widgets/MyCustomWidget.dart';
import 'MyTestingWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {"/secondRoute": (context) => SecondScreen()},
      title: 'Flutter Demo',
      /* theme: ThemeData(
          primarySwatch: pinkColor,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.black54))),*/
      home: MyHomePage(title: 'Find the food'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> mList;
  TextEditingController editTextController = new TextEditingController();
  SharedPreferencesHelper m_shared_pref_helper = new SharedPreferencesHelper();

  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/splashcreative.png",
          width: size.width * 0.4,
        ),

        FormSpace(),

        Text(Constants.HALO_KHAVA,
          style: TextStyle(
          fontWeight: FontWeight.w900,
            fontSize: 30// light
        ),),

        FormSpace(),

        CircularIndicator()
      ],
    )));


  }
}
