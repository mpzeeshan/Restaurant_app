import 'dart:ui';

import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

  final phoneRegex = RegExp(r"([6789]\d\d\d\d\d\d\d\d\d)");
  final emailRegex = RegExp(r"(^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$)");
  final dobRegex = RegExp(r"(^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$)");
  List<bool> _validate = [false,false,false,false];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('EDIT ACCOUNT',style: TextStyle(fontSize: 16.0,color: Colors.black),),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            elevation: 0.5,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.85,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        Text('Name',style: TextStyle(color: Colors.black),),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'John Woosh',

                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            prefixIcon: Icon(Icons.person),
                            errorText: _validate[3]? 'Please enter your name' : null,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Text('Email',style: TextStyle(color: Colors.black),),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'john@gmail.com',
                            prefixIcon: Icon(Icons.email),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            errorText: _validate[0]? 'Please enter a valid email': null,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Text('Phone',style: TextStyle(color: Colors.black),),
                        TextField(
                          controller: _phoneController,
                          keyboardType:
                          TextInputType.number,

                          decoration: InputDecoration(
                            hintText: '9876567890',
                            prefixIcon: Icon(Icons.phone),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            errorText: _validate[1]? 'Please enter a valid phone': null,

                          ),
                          maxLength: 10,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Text('Date of Birth',style: TextStyle(color: Colors.black),),
                        TextField(
                          controller: _dobController,
                          decoration: InputDecoration(
                            hintText: '28/04/1998',
                            prefixIcon: Icon(Icons.cake),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            errorText: _validate[2]? 'Please enter a valid Date': null,
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
                                        'UPDATE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.0,
                                            fontSize: 17.0),
                                      )),
                                  onPressed: () {
                                    setState(() {
                                      if(_nameController.text == ""){
                                        _validate[3] = true;
                                      }
                                      if (emailRegex.hasMatch(_emailController.text)){
                                        _validate[0] = false;
                                      }else{
                                        _validate[0] = true;
                                      }
                                      if (phoneRegex.hasMatch(_phoneController.text)){
                                        _validate[1] = false;
                                      }else{
                                        _validate[1] = true;
                                      }
                                      if (dobRegex.hasMatch(_dobController.text)){
                                        _validate[2] = false;
                                      }else{
                                        _validate[2] = true;
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
