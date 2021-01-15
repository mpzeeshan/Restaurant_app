import 'dart:convert';
import 'dart:async';
import 'package:simplify/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:simplify/models/productsListing_model.dart';


class ProductListingService {

  final link = 'http://newsteam.in/foodapp/api/UserApi/ProductList';

  Future<APIResponse<ProductListingModel>> getProducts() async {
    return await http.post(link, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{"categoryid": "CAT33C"}))
        .then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<ProductListingModel>(data: ProductListingModel.fromJson(jsonData));
      }
      return APIResponse<ProductListingModel>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<ProductListingModel>(error: true, errorMessage: 'An error occured'));
  }
}



