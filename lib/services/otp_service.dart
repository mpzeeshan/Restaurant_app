import 'dart:convert';
import 'dart:async';
import 'package:simplify/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:simplify/models/otp_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OtpService {

  final link = 'https://newsteam.in/foodapp/api/UserApi/checkUserByOtp';
  static var _phoneNumb;

  void getPhone(String phoneNumber) {
    _phoneNumb = phoneNumber;
    print(_phoneNumb);
  }

  final phone = _phoneNumb;

  Future<APIResponse<OtpModel>> getOTP() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await http.post(link, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{'mobile': _phoneNumb}))
     .then((data) {
       print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        //sharedPreferences.setString("token", jsonData.Data['password']);
        return APIResponse<OtpModel>(data: OtpModel.fromJson(jsonData));
      }
      return APIResponse<OtpModel>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<OtpModel>(error: true, errorMessage: 'An error occured'));
  }
}



