import 'package:flutter/material.dart';
import 'package:flutter_app/models/FoodItem.dart';
import 'package:flutter_app/ui/ItemDetailScreen.dart';
import 'package:flutter_app/utils/Constants.dart';
import 'package:flutter_app/utils/MyColors.dart';
import 'package:flutter_app/utils/MyDimensions.dart';
import 'package:flutter_app/utils/MyUtils.dart';
import 'package:flutter_app/widgets/CustomSpace.dart';
import 'package:flutter_app/widgets/FormSpace.dart';
import 'package:flutter_app/widgets/RoundedCornerImage.dart';
import 'package:flutter_app/widgets/RoundedPagerCornerImage.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<FoodItem> mList;

  /* generateList() {
    mList = [];
    for (var i = 0; i < 100; i++) {
      mList.add("ITEM $i");
    }
  }*/

  List<FoodItem> mList;

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    mList = MyUtils().getFoodItems();
    //generateList();
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
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20 // light
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
                        'https://mir-s3-cdn-cf.behance.net/project_modules/fs/e9fc9230104267.5617c17bc9d1a.jpg'),
                RoundedPagerCornerImage(
                    imageUrl:
                        'https://graphicsfamily.com/wp-content/uploads/edd/2020/11/Tasty-Food-Web-Banner-Design-1180x664.jpg'),
                RoundedPagerCornerImage(
                    imageUrl:
                        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/healthy-food-design-template-5786cb00f9510240bd7149f9ce11a538_screen.jpg?ts=1600321142'),
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
                  print("FOOD_ITEM_NAME${mList[index].foodName}");

                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: InkWell(
                      onTap: () {
                        Get.to(ItemDetailScreen(),
                            arguments: ["First data", "Second data"]);
                      },

                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: RoundedCornerImage(
                                  imageUrl: mList[index].foodImage)),
                          CustomSpace(size: 15),
                          Container(
                            width: double.infinity,
                            child: Text(mList[index].foodName,
                                textAlign: TextAlign.start),
                          ),
                          CustomSpace(size: 20),
                        ],
                      ),

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
