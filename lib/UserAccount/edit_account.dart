import 'dart:ui';

import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

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
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Text('Email',style: TextStyle(color: Colors.black),),
                        TextField(
                          controller: _dobController,
                          decoration: InputDecoration(
                            hintText: '28.04.1998',
                            prefixIcon: Icon(Icons.cake),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
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
                                        'UPDATE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.0,
                                            fontSize: 17.0),
                                      )),
                                  onPressed: () {
                                    setState(() {

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
