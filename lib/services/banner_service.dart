import 'dart:convert';
import 'dart:async';
import 'package:simplify/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:simplify/models/banner_model.dart';

class BannerService{
  final _link = 'http://newsteam.in/foodapp/api/UserApi/allBanner';

  Future<APIResponse<BannerModel>> getBanners() async {

    return await http.get(_link, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},)
        .then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<BannerModel>(data: BannerModel.fromJson(jsonData));
      }
      return APIResponse<BannerModel>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<BannerModel>(error: true, errorMessage: 'An error occured'));
  }
}