import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatfud/controller/provider/restorent_provider/restorent_provider.dart';
import 'package:eatfud/controller/services/location_services/location_services.dart';
import 'package:eatfud/model/restorentIDandLOcationMOdel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../model/food_model.dart';
import '../../../model/restorent_model.dart';

class RestorentServices {
  static getNearbyRestorents(BuildContext context) async {
    Geofire.initialize('Restaurants');
    Position currentPosition = await LocationServices.getCurrrentLocation();
    print("Iam here 1");
    Geofire.queryAtLocation(
            currentPosition.latitude, currentPosition.longitude, 20)!
        .listen((event) async {
      print("Iam here 2");
      if (event != null) {
        print('Event is not Null');
        var callback = await event['callBack'];
        switch (callback) {
          case Geofire.onKeyEntered:
            RestorentLocationIDModel model = RestorentLocationIDModel(
                id: event['key'],
                latitude: event['latitude'],
                longitude: event['longitude']);
            context.read<RestorentProvider>().addRestorents(model.id);
            context.read<RestorentProvider>().addFoods(model.id);
            print("Getting restorents");
            break;
          case Geofire.onGeoQueryReady:
            log("Query ready");
            break;
        }
      } else {
        print("Iam null");
      }
    });
    //20km radius
  }

  static fetchRestaurantData(String restorentID) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('Resturant').doc(restorentID).get();

      RestaurantModel data = RestaurantModel.fromMap(snapshot.data()!);
      return data;
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  static fetchFoodData(String restorentID) async {
    List<FoodModel> foodData = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Food')
          .orderBy('uploadTime', descending: true)
          .where('restaurantUID', isEqualTo: restorentID)
          .get();

      snapshot.docs.forEach((element) {
        foodData.add(FoodModel.fromMap(element.data()));
      });
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
    return foodData;
  }
}
