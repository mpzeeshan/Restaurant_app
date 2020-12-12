import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:simplify/screens/home.dart';

int phone = 9876545321;

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  bool isFilled = false;

  TextEditingController _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _myController.text = '';
    _myController.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
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

                    color:  Colors.red[50],
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left:12.0,top: 10.0 ,right:40.0 ,bottom: 25.0 ),
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
                                padding: const EdgeInsets.only(left:6.0,bottom: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('VERIFY NUMBER',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0, letterSpacing: 2.0),),
                                    SizedBox(height: 5.0,),
                                    Text('OTP sent to $phone', style: TextStyle(fontSize: 12.0, color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Image(image: AssetImage('imgs/mobile.png',),height: 55.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,top:100.0, bottom: 20.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPTextField(

                        length: 4,
                        width: MediaQuery.of(context).size.width*0.62,
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldWidth: 50,

                        fieldStyle: FieldStyle.underline,
                        style: TextStyle(
                            fontSize: 17
                        ),
                        onCompleted: (pin) {
                          setState(() {
                            isFilled = true;
                          });
                          print("Completed: " + pin);
                        },


                      ),


                    ],),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:13.0,right: 13.0,bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 46.0,
                          child: RaisedButton(
                            color: isFilled? Colors.green:Colors.grey[400],
                            child: Center(
                                child: Text( isFilled?'VERIFY':'ENTER OTP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.0,
                                      fontSize: 17.0),
                                )),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
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
