import 'package:flutter_app/models/FoodItem.dart';

class MyUtils {
  List<String> foodNames = [
    'Sandwich',
    'Burger',
    'Salad',
    'Samosa',
    'Lemonade',
    'Juice',
    'Cake',
    'Avocado toast',
    "Pani puri"
  ];

  List<double> foodPrices = [15, 10.0, 15.0, 12.0, 5.0, 5.0, 20.0, 18.0, 10.0];

  List<String> foodImages = [
    'https://cdn.pixabay.com/photo/2013/11/22/12/23/club-215639_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/09/18/16/53/burger-2762371_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/15/10/37/salad-2068210_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/06/26/22/46/india-1481500_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/07/21/11/17/drink-1532300_960_720.jpg',
    'https://cdn.pixabay.com/photo/2018/11/11/19/25/smoothies-3809509_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_960_720.jpg',
    'https://cdn.pixabay.com/photo/2014/09/15/16/53/tomatoes-447170_960_720.jpg',
    'https://cdn.pixabay.com/photo/2013/01/15/11/22/panipuri-74974_960_720.jpg'
  ];

  List<FoodItem> getFoodItems() {
    List<FoodItem> mList = [];

    /*foodItem.foodName= "Sandwich";
      foodItem.foodImage = "https://cdn.pixabay.com/photo/2014/09/15/16/53/tomatoes-447170_960_720.jpg";
      foodItem.foodPrice = 15.0;*/

    for (var i = 0; i < foodNames.length; i++) {
    FoodItem foodItem = FoodItem();
      foodItem.foodName = foodNames[i];
      foodItem.foodImage = foodImages[i];
      foodItem.foodPrice = foodPrices[i];
      mList.add(foodItem);
    }

    print("M_LIST:${mList.length}");

    return mList;
  }
}
