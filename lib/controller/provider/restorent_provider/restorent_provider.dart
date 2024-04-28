import 'dart:developer';

import 'package:eatfud/controller/services/fetch_restorents/fetch_restorent_services.dart';
import 'package:eatfud/model/food_model.dart';
import 'package:flutter/material.dart';

import '../../../model/restorent_model.dart';

class RestorentProvider extends ChangeNotifier {
  List<RestaurantModel> restorents = [];
  List<FoodModel> foods = [];

  addRestorents(String restorentID) async {
    print("Iam okok");
    RestaurantModel data =
        await RestorentServices.fetchRestaurantData(restorentID);
    restorents.add(data);
    notifyListeners();
    print("DPDP >>> ${restorents.length.toString()}");
  }

  addFoods(String restorentID) async {
    print("Iam okok");
    List<FoodModel> data = await RestorentServices.fetchFoodData(restorentID);
    foods.addAll(data);
    notifyListeners();
    print("DPDP >>> ${foods.length.toString()}");
  }
}
