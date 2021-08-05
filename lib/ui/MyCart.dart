import 'package:flutter/material.dart';
import 'package:flutter_app/models/FoodItem.dart';
import 'package:flutter_app/utils/MyUtils.dart';
import 'package:flutter_app/widgets/CustomSpace.dart';
import 'package:flutter_app/widgets/RoundedCornerImage.dart';

List<FoodItem> mList = MyUtils().getFoodItems();

class MyCart extends StatelessWidget {
  const MyCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: <Widget>[
      Opacity(
        opacity: 0.6,
        child: Image.network(
          'https://images.pexels.com/photos/2280573/pexels-photo-2280573.jpeg?cs=srgb&dl=pexels-chokniti-khongchum-2280573.jpg&fm=jpg',
          fit: BoxFit.cover,
        ),
      ),
      Column(
        children: <Widget>[
          CustomSpace(size: 350),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: mList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 50,
                          child: Row(
                            children: [
                              RoundedCornerImage(
                                  imageUrl: mList[index].foodImage),
                              Text(mList[index].foodName),
                            ],
                          ));
                    }),
              ),
            ),
          ),
        ],
      ),
    ]));
  }
}
