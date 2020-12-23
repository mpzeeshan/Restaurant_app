import 'package:flutter/material.dart';

var buttonOne = true;
var buttonTwo = false;
var buttonThree = false;

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
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
                Container(
                  height: MediaQuery.of(context).size.height*0.365,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.06),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Set Delivery Location',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,letterSpacing: 0.8),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Text('LOCATION',style: TextStyle(fontSize: 11.0),),
                        Stack(
                          children: [
                            TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.grey[500]),
                              decoration: InputDecoration(
                                  hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13.0),
                                  border: InputBorder.none,
                                  hintText: 'Bay terrace, cross island prey'),
                            ),
                            Positioned(
                              child: Padding(
                                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                                child: Divider(
                                  thickness: 1.5,
                                ),
                              ),
                            ),
                            Positioned(
                              child: Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.81,top:MediaQuery.of(context).size.height*0.01),
                                child: Icon(Icons.gps_fixed,color: Colors.blue[900],),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text('HOUSE/FLAT NO.',style: TextStyle(fontSize: 11.0),),
                        Stack(
                          children: [
                            TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.grey[500]),
                              decoration: InputDecoration(
                                  hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13.0),
                                  border: InputBorder.none,
                                  hintText: 'Enter house/Flat number'),
                            ),
                            Positioned(
                              child: Padding(
                                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                                child: Divider(
                                  thickness: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text('LANDMARK',style: TextStyle(fontSize: 11.0),),
                        Stack(
                          children: [
                            TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.grey[500]),
                              decoration: InputDecoration(
                                  hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13.0),
                                  border: InputBorder.none,
                                  hintText: 'Enter Landmark'),
                            ),
                            Positioned(
                              child: Padding(
                                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                                child: Divider(
                                  thickness: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                        Text('SAVE AS'),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          GestureDetector(
                             onTap: (){
                               setState(() {
                                 buttonOne = true;
                                 buttonTwo = false;
                                 buttonThree = false;
                               });
                             },
                            child: Container(
                              height: 25.0,
                              width: 57.0,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: buttonOne ? Colors.blue[900]: Colors.white,),
                              ),),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Icon(Icons.home_outlined,color: buttonOne ? Colors.blue[900]: Colors.black,size: 21.0  ,),
                                Text('HOME',style: TextStyle(color: buttonOne ? Colors.blue[900]: Colors.black,fontSize: 11.0),),
                              ],),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                buttonOne = false;
                                buttonTwo = true;
                                buttonThree = false;
                              });
                            },
                            child: Container(
                              height: 26.0,
                              width: 59.0,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: buttonTwo ? Colors.blue[900]: Colors.white,),
                                ),),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.work_outline,color: buttonTwo ? Colors.blue[900]: Colors.black,size: 21.0  ,),
                                  Text('OFFICE',style: TextStyle(color: buttonTwo ? Colors.blue[900]: Colors.black,fontSize: 11.0),),
                                ],),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.1),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  buttonOne = false;
                                  buttonTwo = false;
                                  buttonThree = true;
                                });
                              },
                              child: Container(
                                height: 25.0,
                                width: 57.0,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: buttonThree ? Colors.blue[900]: Colors.white,),
                                  ),),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.more_horiz,color: buttonThree ? Colors.blue[900]: Colors.black,size: 21.0  ,),
                                    Text('OTHER',style: TextStyle(color: buttonThree ? Colors.blue[900]: Colors.black,fontSize: 11.0),),
                                  ],),
                              ),
                            ),
                          ),


                        ],),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Container(
              height: 50.0,
              color: Colors.deepOrangeAccent,
              child: Center(child: Text('SAVE LOCATION',style: TextStyle(color: Colors.white,fontSize: 18.0),),),
            ),
          ),
        ],
      ),
    );
  }
}
