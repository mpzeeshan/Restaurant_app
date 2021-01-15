import 'dart:convert';
import 'dart:async';
import 'package:simplify/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:simplify/models/offers_model.dart';

class OffersService{
  final _link = 'http://newsteam.in/foodapp/api/UserApi/alloffers';

  Future<APIResponse<OffersModel>> getOffers() async {

    return await http.get(_link, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},)
        .then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<OffersModel>(data: OffersModel.fromJson(jsonData));
      }
      return APIResponse<OffersModel>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<OffersModel>(error: true, errorMessage: 'An error occured'));
  }
}