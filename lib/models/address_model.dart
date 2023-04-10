// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  AddressModel({
    required this.id,
    required this.uid,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.alternateNumber,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.landmark,
    required this.town,
    required this.state,
  });

  String id;
  String uid;
  String fullName;
  String email;
  String phone;
  String alternateNumber;
  String address;
  String zipCode;
  String state;
  String city;
  String landmark;
  String town;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      id: json["id"],
      uid: json["uid"],
      fullName: json["full_name"],
      email: json["email"],
      phone: json["phone"],
      alternateNumber: json["alternate_number"],
      address: json["address"],
      zipCode: json["zip_code"],
      city: json["city"],
      landmark: json["landmark"],
      town: json["town"],
      state: json["state"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "alternate_number": alternateNumber,
        "address": address,
        "zip_code": zipCode,
        "city": city,
        "landmark": landmark,
        "town": town,
      };
}
