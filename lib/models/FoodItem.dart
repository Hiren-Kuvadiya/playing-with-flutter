class FoodItem {

  String foodName;
  String foodImage;
  double foodPrice;

  FoodItem({
    this.foodName,
    this.foodImage,
    this.foodPrice,
  });

  FoodItem.fromMap(Map map)
      : this(
          foodName: map['foodName'],
          foodImage: map['foodImage'],
          foodPrice: map['foodPrice'],
        );

  asMap() => {
        'foodName': foodName,
        'foodImage': foodImage,
        'foodPrice': foodPrice,
      };
}
