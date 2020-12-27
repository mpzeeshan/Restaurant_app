import 'dart:ui';

import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<Help> {

  TextEditingController _helpController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('HELP',style: TextStyle(fontSize: 16.0,color: Colors.black),),
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

                        TextField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: _helpController,
                          decoration: InputDecoration(
                            hintText: 'Enter your Query here...',
                            helperText: 'You will receive a response through email within the next 24 hours.',
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
                                        'SUBMIT',
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
