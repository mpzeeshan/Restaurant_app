import 'package:flutter/material.dart';
import 'package:simplify/services/otp_service.dart';
import 'package:simplify/login/otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phoneController = new TextEditingController();

  final phoneRegex = RegExp(r"([6789]\d\d\d\d\d\d\d\d\d)");
  bool _validate = true;


  @override
  void initState() {
    super.initState();
  }

  // checkLoginStatus().then((success) {
  // if (success) {
  // Navigator.pushReplacementNamed(context, '/home');
  // } else {
  // Navigator.pushReplacementNamed(context, '/login');
  // }
  // });

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
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 10.0, right: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                    height: 15.0, width: MediaQuery.of(context).size.width),
                Text(
                  'Kushiyu Restaurant',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 25.0),
                ),
                SizedBox(
                    height: 90.0, width: MediaQuery.of(context).size.width),
                Text(
                  'LOGIN TO YOUR ACCOUNT',
                  style: TextStyle(
                      color: Colors.black, fontSize: 11.0, letterSpacing: 0.7),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Stack(
                      children: [
                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.grey[500]),
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                            border: InputBorder.none,
                            hintText: 'Enter Mobile Number',
                            errorText: _validate
                                ? null
                                : 'Please enter a valid 10 digit phone number',
                          ),
                          maxLength: 10,
                        ),
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Divider(
                              thickness: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 46.0,
                        child: RaisedButton(
                          color: Colors.deepOrange[400],
                          child: Center(
                              child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontSize: 17.0),
                          )),
                          onPressed: () {
                            setState(() {
                              if (phoneRegex.hasMatch(phoneController.text)) {
                                _validate = true;
                                OtpService().getPhone(phoneController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Ottp(),
                                  ),
                                );
                              } else {
                                _validate = false;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
