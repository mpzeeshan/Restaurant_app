import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {

  List<String> offerName = ['OFF50', 'DINNER20', 'BF40'];
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
          height: MediaQuery.of(context).size.height * 0.735,
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
                    Divider(thickness:0.7 ,color: Colors.black,),
                  ],
                ),
              ),


            ],
          ),),),),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal[700], fontFamily: 'Robot'),
      home: Builder(
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
    );
  }
}
