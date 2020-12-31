import 'package:flutter/material.dart';
import 'package:simplify/screens/cart.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';


var appliedOffer;
var appliedOfferPrice = 0;

class Offers extends StatefulWidget {
  bool received;
  Offers(this.received);
  @override
  _OffersState createState() => _OffersState(this.received);
}

class _OffersState extends State<Offers> {

  bool received;
  _OffersState(this.received);

  bool card = false;
  bool cash = false;
  int selectedRadioTile;


  setSelectedRadioTile(int val) {
    appliedOffer = offerName[val];
    appliedOfferPrice = offerPrice[val];
    setState(() {
      selectedRadioTile = val;
    });
  }

  List<String> offerName = ['OFF50', 'DINNER20', 'BF40'];
  List<int> offerPrice = [4,5,7];
  List<String> offerDesc = [
    'This is a dummy text, this area will be used to describe the offer and its validity',
    'This is a dummy text this area will be used to describe the offer and its validity',
    'This is a dummy text this area will be used to describe the offer and its validity'
  ];



  Column availableOffers(image) {
    return Column(
      children: [
        Stack(
          children: [
            Image(
              width: MediaQuery.of(context).size.width,
              image: AssetImage(image),
            ),
            Positioned(
              top: 15.0,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.045),
          child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
          height: MediaQuery.of(context).size.height * 0.635,
          child: ListView.builder(
          itemCount: offerName.length,
          itemBuilder: (context, index) => Row(

            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.91,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                        visible: index == 0,
                        child: Column(
                          children: [
                            Text('Offers',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
                            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                          ],
                        )),
                    Visibility(
                      visible: index > 0,
                      child: SizedBox(height: MediaQuery.of(context).size.height*0.015,),),
                    Visibility(
                      visible: received == false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                            colors: [Colors.teal[500], Colors.green[200]]),
                          ),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height*0.043,
                              width: MediaQuery.of(context).size.width*0.25,
                              child: Center(child: Text(offerName[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(offerDesc[index],style: TextStyle(color: Colors.grey[500]),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                      ],),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //     colors: [Colors.teal[500], Colors.green[200]]),
                    //   ),
                    //   child: SizedBox(
                    //       height: MediaQuery.of(context).size.height*0.043,
                    //       width: MediaQuery.of(context).size.width*0.25,
                    //       child: Center(child: Text(offerName[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                    // ),
                    // SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    // Text(offerDesc[index],style: TextStyle(color: Colors.grey[500]),),
                    // SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                    // Divider(thickness:0.7 ,color: Colors.black,),
                    Visibility(
                      visible: received == true,
                      child: RadioListTile(
                        value: index,

                        groupValue: selectedRadioTile,
                        title: Row(children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                              colors: [Colors.teal[500], Colors.green[200]]),
                            ),
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height*0.043,
                                width: MediaQuery.of(context).size.width*0.25,
                                child: Center(child: Text(offerName[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                          ),

                        ],),
                        subtitle: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                            Text(offerDesc[index],style: TextStyle(color: Colors.black),),
                          ],
                        ),
                        onChanged: (val) {

                          print("pressed offer: $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.teal,
                      ),
                    ),
                    Divider(thickness:0.7 ,color: Colors.grey,),
                  ],
                ),
              ),


            ],
          ),),),),
        ),
        Visibility(
          visible: received == true,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 46.0,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    child: Center(
                        child: Text(
                          'PROCEED',
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.0,
                              fontSize: 17.0),
                        )),
                    onPressed: () {
                      setState(() {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cart(true,selectedAddress),
                          ),
                        );

                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal[700], fontFamily: 'Robot'),
      home: Container(
        color: Colors.teal[700],
        child: Builder(
          builder: (context) => SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: availableOffers(
                        'imgs/snack_img.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
