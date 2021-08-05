import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Constants.dart';
import 'package:flutter_app/widgets/CircularImage.dart';
import 'package:flutter_app/widgets/RoundedCornerImage.dart';
import 'package:flutter_app/widgets/TitlePriceRating.dart';
import 'package:flutter_app/widgets/order_button.dart';
import 'package:get/get.dart';

import 'MyCart.dart';

class ItemDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 260,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.network(
                        'https://images.everydayhealth.com/images/go-green-for-better-health-00-1440x810.jpg?w=768',
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned.fill(
                  //top: 100,
                  bottom: -120,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: CircularImage(
                        imageUrl:
                            "https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_960_720.jpg",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ItemInfo(),
          ),
        ],
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.all(20),
          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: <Widget>[
              shopeName(name: "Sandwich House"),
              TitlePriceRating(
                name: "Avocado Sandwich",
                numOfReviews: 24,
                rating: 4,
                price: 15,
                onRatingChanged: (value) {},
              ),
              Text(
                Constants.ITEM_DESCRIPTION,
                style: TextStyle(
                  height: 1.5,
                ),
              ),

              SizedBox(height: size.height * 0.1),

              // Free space  10% of total height
              OrderButton(
                size: size,
                press: () {

                  Get.to(MyCart());

                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.green,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}
