import 'dart:convert';
import 'dart:async';
import 'package:simplify/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:simplify/models/category_model.dart';

class CategoryService{
  final _link = 'http://newsteam.in/foodapp/api/UserApi/allCategories';

  Future<APIResponse<CategoryModel>> getCategories() async {

    return await http.get(_link, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},)
        .then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<CategoryModel>(data: CategoryModel.fromJson(jsonData));
      }
      return APIResponse<CategoryModel>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<CategoryModel>(error: true, errorMessage: 'An error occured'));
  }
}