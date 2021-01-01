import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:simplify/screens/home.dart';
import 'package:simplify/models/otp_model.dart';
import 'package:get_it/get_it.dart';
import 'package:simplify/services/otp_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

OtpModel otpModel;

class Ottp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Ottp> {

  OtpService get serviceOtp => GetIt.I<OtpService>();
  bool isFilled = false;
  bool _wrong = false;
  String errorMessage;

  var pinn;

  TextEditingController _myController = TextEditingController();

  static var receivedPinn;

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _myController.text = '';
    _myController.addListener(() {
      setState(() {}); // setState every time text changes
    });
    serviceOtp.getOTP().then((response) {
      if (response.error) {
        errorMessage = response.errorMessage ?? 'An error occurred';
      }
      otpModel = response.data;
      receivedPinn = otpModel.otp;
      sharedPref();
    });
  }

  void sharedPref() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", otpModel.data.password);
    sharedPreferences.setString("fullName", otpModel.data.fullname);
    sharedPreferences.setString("email", otpModel.data.email);
    sharedPreferences.setString("phone", otpModel.data.mobile);
    sharedPreferences.setString("wallet", otpModel.data.wallet);
    print(sharedPreferences.get("token"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[700],
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                Material(
                  elevation: 2.0,
                  child: Container(
                    color: Colors.red[50],
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, top: 10.0, right: 40.0, bottom: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 6.0, bottom: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'VERIFY NUMBER',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          letterSpacing: 2.0),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'OTP sent to ' + serviceOtp.phone,
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Image(
                                  image: AssetImage(
                                    'imgs/mobile.png',
                                  ),
                                  height: 55.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 100.0, bottom: 20.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPTextField(
                        length: 4,
                        width: MediaQuery.of(context).size.width * 0.62,
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldWidth: 50,
                        fieldStyle: FieldStyle.underline,
                        style: TextStyle(fontSize: 35),
                        onCompleted: (pin) {
                          setState(() {
                            isFilled = true;
                          });
                          print("Completed: " + pin);
                          pinn = int.parse(pin);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 13.0, right: 13.0, bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: (_wrong),
                          child: Text(
                            'Wrong Otp Entered',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 46.0,
                          child: RaisedButton(
                            color: isFilled ? Colors.green : Colors.grey[400],
                            child: Center(
                                child: Text(
                              isFilled ? 'VERIFY' : 'ENTER OTP',
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontSize: 17.0),
                            )),
                            onPressed: () {
                              var ph = int.parse(receivedPinn);

                              if (ph == pinn) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Home()),
                                    (Route<dynamic> route) => false);
                              } else if (ph != pinn) {
                                setState(() {
                                  _wrong = !_wrong;
                                });

                                print('Wrong otp');
                                print(pinn);
                                print(ph);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
