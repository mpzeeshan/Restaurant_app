// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);
import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    this.status,
    this.message,
    this.otp,
    this.mobile,
    this.data,
  });

  String status;
  String message;
  String otp;
  String mobile;
  Data data;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    status: json["Status"],
    message: json["Message"],
    otp: json["OTP"],
    mobile: json["Mobile"],
    data: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "OTP": otp,
    "Mobile": mobile,
    "Data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.fullname,
    this.mobile,
    this.email,
    this.password,
    this.gender,
    this.country,
    this.state,
    this.city,
    this.address,
    this.postcode,
    this.status,
    this.date,
    this.profilePic,
    this.dob,
    this.createdOn,
    this.updatedOn,
    this.deliveryLocation,
    this.deliveryHouseNo,
    this.deliveryLandmark,
    this.deliverySaveAs,
    this.deliveryLat,
    this.deliveryLng,
    this.wallet,
  });

  String id;
  String fullname;
  String mobile;
  String email;
  String password;
  dynamic gender;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic address;
  dynamic postcode;
  String status;
  DateTime date;
  dynamic profilePic;
  dynamic dob;
  DateTime createdOn;
  DateTime updatedOn;
  String deliveryLocation;
  String deliveryHouseNo;
  String deliveryLandmark;
  String deliverySaveAs;
  String deliveryLat;
  String deliveryLng;
  String wallet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    fullname: json["fullname"],
    mobile: json["mobile"],
    email: json["email"],
    password: json["password"],
    gender: json["gender"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    address: json["address"],
    postcode: json["postcode"],
    status: json["status"],
    date: DateTime.parse(json["date"]),
    profilePic: json["profile_pic"],
    dob: json["dob"],
    createdOn: DateTime.parse(json["created_on"]),
    updatedOn: DateTime.parse(json["updated_on"]),
    deliveryLocation: json["delivery_location"],
    deliveryHouseNo: json["delivery_house_no"],
    deliveryLandmark: json["delivery_landmark"],
    deliverySaveAs: json["delivery_save_as"],
    deliveryLat: json["delivery_lat"],
    deliveryLng: json["delivery_lng"],
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "mobile": mobile,
    "email": email,
    "password": password,
    "gender": gender,
    "country": country,
    "state": state,
    "city": city,
    "address": address,
    "postcode": postcode,
    "status": status,
    "date": date.toIso8601String(),
    "profile_pic": profilePic,
    "dob": dob,
    "created_on": createdOn.toIso8601String(),
    "updated_on": updatedOn.toIso8601String(),
    "delivery_location": deliveryLocation,
    "delivery_house_no": deliveryHouseNo,
    "delivery_landmark": deliveryLandmark,
    "delivery_save_as": deliverySaveAs,
    "delivery_lat": deliveryLat,
    "delivery_lng": deliveryLng,
    "wallet": wallet,
  };
}
