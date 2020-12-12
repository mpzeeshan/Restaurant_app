import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  Column availableOffers(image, percentageText, code) {
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
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  percentageText.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Use Code : ',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12.0,
                          letterSpacing: 1.0),
                    ),
                    Text(
                      code,
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Valid once every 2 hours | Additional RS 30 Cashback via\nAmazon pay (Valid 10 times per user till 12th june)',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
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
      home: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: availableOffers(
                  'imgs/snack_img.png', 'GET UPTO 60% OFF', 'TIPTOP60'),
            ),
          ),
        ),
      ),
    );
  }
}
