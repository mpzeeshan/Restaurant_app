// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    status: json["Status"],
    message: json["Message"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.image,
    this.type,
    this.itemid,
    this.date,
    this.status,
  });

  String id;
  String title;
  String image;
  String type;
  String itemid;
  DateTime date;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    type: json["type"],
    itemid: json["itemid"],
    date: DateTime.parse(json["date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "type": type,
    "itemid": itemid,
    "date": date.toIso8601String(),
    "status": status,
  };
}
