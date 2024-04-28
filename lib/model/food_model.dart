import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodModel {
  String name;
  String restaurantUID;
  DateTime uploadTime;
  String foodID;
  String description;
  String foodImageURL;
  bool isVegetarian;
  String price;
  FoodModel({
    required this.name,
    required this.restaurantUID,
    required this.uploadTime,
    required this.foodID,
    required this.description,
    required this.foodImageURL,
    required this.isVegetarian,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'restaurantUID': restaurantUID,
      'uploadTime': uploadTime.millisecondsSinceEpoch,
      'foodID': foodID,
      'description': description,
      'foodImageURL': foodImageURL,
      'isVegetarian': isVegetarian,
      'price': price,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      name: map['name'] as String,
      restaurantUID: map['restaurantUID'] as String,
      uploadTime: DateTime.fromMillisecondsSinceEpoch(map['uploadTime'] as int),
      foodID: map['foodID'] as String,
      description: map['description'] as String,
      foodImageURL: map['foodImageURL'] as String,
      isVegetarian: map['isVegetarian'] as bool,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModel.fromJson(String source) =>
      FoodModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
