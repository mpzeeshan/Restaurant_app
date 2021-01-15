import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class CheckCouponService {

  final link = 'http://newsteam.in/foodapp/api/UserApi/checkCoupon';

  Future checkCoupon(String couponCode,String amount) async {
    return await http.post(link, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(<String, String>{"couponCode": "$couponCode", "baseamount":"$amount"}))
        .then((data) {
      print('From checkCoupon');
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        if(jsonData['Status'] == "TRUE"){
          return "TRUE";
        }else{
          return "FALSE";}
      }else{
        print(data.statusCode);
      return "API response error";
      }
    })
        .catchError((_) => print('Error'));
  }
}



