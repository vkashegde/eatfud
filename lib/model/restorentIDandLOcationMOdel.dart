import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RestorentLocationIDModel {
  String id;
  double latitude;
  double longitude;
  RestorentLocationIDModel({
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory RestorentLocationIDModel.fromMap(Map<String, dynamic> map) {
    return RestorentLocationIDModel(
      id: map['id'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestorentLocationIDModel.fromJson(String source) =>
      RestorentLocationIDModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
