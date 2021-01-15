import 'dart:convert';

ProductListingModel productListingModelFromJson(String str) => ProductListingModel.fromJson(json.decode(str));

String productListingModelToJson(ProductListingModel data) => json.encode(data.toJson());

class ProductListingModel {
  ProductListingModel({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory ProductListingModel.fromJson(Map<String, dynamic> json) => ProductListingModel(
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
    this.productId,
    this.price,
    this.saleprice,
    this.productName,
    this.productimage,
    this.description,
    this.categoryid,
    this.categoryname,
    this.subcategoryid,
    this.subcategoryname,
    this.date,
    this.tags,
    this.points,
  });

  String productId;
  String price;
  String saleprice;
  String productName;
  String productimage;
  String description;
  String categoryid;
  String categoryname;
  String subcategoryid;
  String subcategoryname;
  DateTime date;
  String tags;
  String points;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productId: json["product_id"],
    price: json["price"],
    saleprice: json["saleprice"],
    productName: json["product_name"],
    productimage: json["productimage"],
    description: json["description"],
    categoryid: json["categoryid"],
    categoryname: json["categoryname"],
    subcategoryid: json["subcategoryid"],
    subcategoryname: json["subcategoryname"],
    date: DateTime.parse(json["date"]),
    tags: json["tags"],
    points: json["points"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "price": price,
    "saleprice": saleprice,
    "product_name": productName,
    "productimage": productimage,
    "description": description,
    "categoryid": categoryid,
    "categoryname": categoryname,
    "subcategoryid": subcategoryid,
    "subcategoryname": subcategoryname,
    "date": date.toIso8601String(),
    "tags": tags,
    "points": points,
  };
}
