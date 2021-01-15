import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
    this.catid,
    this.cateName,
    this.cateStatus,
    this.picFile,
  });

  String id;
  String catid;
  String cateName;
  String cateStatus;
  String picFile;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    catid: json["catid"],
    cateName: json["cate_name"],
    cateStatus: json["cate_status"],
    picFile: json["pic_file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "catid": catid,
    "cate_name": cateName,
    "cate_status": cateStatus,
    "pic_file": picFile,
  };
}
