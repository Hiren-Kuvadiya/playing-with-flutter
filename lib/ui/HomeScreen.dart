import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Constants.dart';
import 'package:flutter_app/utils/MyDimensions.dart';
import 'package:flutter_app/widgets/CustomSpace.dart';
import 'package:flutter_app/widgets/FormSpace.dart';
import 'package:flutter_app/widgets/RoundedCornerImage.dart';
import 'package:flutter_app/widgets/RoundedPagerCornerImage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> mList;

  generateList() {
    mList = [];
    for (var i = 0; i < 100; i++) {
      mList.add("ITEM $i");
    }
  }

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    generateList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          FormSpace(),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(FORM_PADDING),
              child: Text(
                Constants.BESO_BESO,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w900,
                    fontSize: 30 // light
                    ),
              ),
            ),
          ),

          Container(
            height: 200,
            child: PageView(
              controller: controller,
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                RoundedPagerCornerImage(
                    imageUrl:
                        'https://graphicsfamily.com/wp-content/uploads/edd/2020/11/Tasty-Food-Web-Banner-Design-1180x664.jpg'),
                RoundedPagerCornerImage(
                    imageUrl:
                        'https://graphicsfamily.com/wp-content/uploads/edd/2020/11/Tasty-Food-Web-Banner-Design-1180x664.jpg'),
                RoundedPagerCornerImage(
                    imageUrl:
                        'https://graphicsfamily.com/wp-content/uploads/edd/2020/11/Tasty-Food-Web-Banner-Design-1180x664.jpg'),
              ],
            ),
          ),

          CustomSpace(size: 10.0),
          Container(
            padding: EdgeInsets.all(15),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 10.0,
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              primary: false,
              children: List.generate(
                mList.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: RoundedCornerImage(
                                imageUrl:
                                    "https://expertphotography.com/wp-content/uploads/2019/04/burger-photography-tips-serving.jpg")),
                        CustomSpace(size: 15),
                        Container(
                          width: double.infinity,
                          child: Text(mList[index], textAlign: TextAlign.start),
                        ),
                        CustomSpace(size: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
