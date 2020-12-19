import 'dart:convert';
import 'dart:async';
import 'package:simplify/models/api_response.dart';
import 'package:simplify/login/login.dart';
import 'package:http/http.dart' as http;
import 'package:simplify/models/otp_model.dart';

final link = 'https://newsteam.in/foodapp/api/UserApi/checkUserByOtp';



class OtpService {
  var re_otp;
  static var phone_numb;
  void get_phone(String phone_number){
    phone_numb = phone_number;
    print(phone_numb);
  }
//  Future<APIResponse<Otp>> getOTP(int phone_number) async {
//    var bodyy = {'mobile': phone_number,};
//    return http.post(link, body: bodyy).then((data) {
//      if(data.statusCode == 201) {
//        final jsonData = json.decode(data.body);
//
//        return APIResponse<Otp>(data: Otp.fromJson(jsonData));
//      }
//      return APIResponse<Otp>(error: true, errorMessage: 'An error Occured');
//
//      })
//        .catchError((_) => APIResponse<Otp>(error: true, errorMessage: 'An error Occured'));
   Future<String> getOTP() async{

     Future<OtpModel> otpModel;
//     var otpModel = null;
     var otp_model= null;
     var otp_pin = null;

      var ph = phone_numb;
      print(ph);
      var response = await http.post(link,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body:
      jsonEncode(<String, String>{'mobile': ph}));
      print(response.statusCode);
      if (response.statusCode == 200){
        var jsonMap = json.decode(response.body);
        otp_model = OtpModel.fromJson(jsonMap);
        otp_pin = json.decode(response.body)["OTP"];
        print(otp_pin);
        //re_otp = jsonDecode(response.body)['OTP'];
      }
      if(response.statusCode == 400){
        return otp_pin = "Bad Request, Data Doesn't exist";
      }
      return otp_pin;
   }

}