import 'dart:convert';

OffersModel offersModelFromJson(String str) => OffersModel.fromJson(json.decode(str));

String offersModelToJson(OffersModel data) => json.encode(data.toJson());

class OffersModel {
  OffersModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
    status: json["Status"],
    message: json["Message"],
    data: List<Datum>.from(json["Data"].map((x)  => Datum.fromJson(x))),
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
    this.name,
    this.code,
    this.discpercent,
    this.baseamount,
    this.fromdate,
    this.todate,
    this.createdOn,
    this.updatedOn,
    this.status,
  });

  String id;
  String name;
  String code;
  String discpercent;
  String baseamount;
  String fromdate;
  String todate;
  DateTime createdOn;
  DateTime updatedOn;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"] == null ? null : json["name"],
    code: json["code"],
    discpercent: json["discpercent"],
    baseamount: json["baseamount"],
    fromdate: json["fromdate"],
    todate: json["todate"],
    createdOn: DateTime.parse(json["created_on"]),
    updatedOn: DateTime.parse(json["updated_on"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? null : name,
    "code": code,
    "discpercent": discpercent,
    "baseamount": baseamount,
    "fromdate": fromdate,
    "todate": todate,
    "created_on": createdOn.toIso8601String(),
    "updated_on": updatedOn.toIso8601String(),
    "status": status,
  };
}
