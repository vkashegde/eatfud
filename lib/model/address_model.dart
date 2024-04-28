import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddressModel {
  double? latitude;
  double? logitude;
  AddressModel({
    this.latitude,
    this.logitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'logitude': logitude,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      logitude: map['logitude'] != null ? map['logitude'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}






// class AddressModel {
//   String? name;
//   String? secondaryname;
//   String? description;
//   String? placeID;
//   double? latitudes;
//   double? longitude;
//   AddressModel({
//     this.name,
//     this.secondaryname,
//     this.description,
//     this.placeID,
//     this.latitudes,
//     this.longitude,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'secondaryname': secondaryname,
//       'description': description,
//       'placeID': placeID,
//       'latitudes': latitudes,
//       'longitude': longitude,
//     };
//   }

//   factory AddressModel.fromMap(Map<String, dynamic> map) {
//     return AddressModel(
//       name: map['name'] != null ? map['name'] as String : null,
//       secondaryname:
//           map['secondaryname'] != null ? map['secondaryname'] as String : null,
//       description:
//           map['description'] != null ? map['description'] as String : null,
//       placeID: map['placeID'] != null ? map['placeID'] as String : null,
//       latitudes: map['latitudes'] != null ? map['latitudes'] as double : null,
//       longitude: map['longitude'] != null ? map['longitude'] as double : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AddressModel.fromJson(String source) =>
//       AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }
