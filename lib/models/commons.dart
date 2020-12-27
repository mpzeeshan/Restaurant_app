

import 'package:flutter/material.dart';
import 'package:simplify/Orders/track_order.dart';

class Commons {
  List<String> imageList = [
    "imgs/pimgone.jpeg",
    "imgs/pimgthree.jpeg",
    "imgs/pimgthree.jpeg",
    "imgs/pimgone.jpeg",
    "imgs/pimgone.jpeg",
    "imgs/pimgthree.jpeg"
  ];
  List<String> catList = [
    "Regular",
    "Beverages",
    "Lunch",
    "Daily Special",
    "Regular",
    "Beverages"
  ];
  List<String> pnameList = [
    "Ika Pirikara",
    "Sashimi Salad",
    "Spicy Trio",
    "Tai Cilantro",
    "Ika Parikara",
    "Sashimi Salad"
  ];

  List<String> coinsList = ["100", "200", "300", "400", "500", "600"];
  List<int> counList = [0, 0, 0, 0, 0, 0];
  List<int> priceList = [10, 10, 10, 10, 10, 10];
  List<bool> flagList = [true, true, true, true, true, true];

  var price = 10;
  bool pressed_1 = false;
  bool pressed_2 = false;
  bool pressed_3 = true;

  //**************************OFFER*********************************//

  Padding offer() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 90.0),
      child: Container(
          height: 13.0,
          width: 35.0,
          color: Colors.white,
          child: Center(
            child: Text(
              'OFFER',
              style: TextStyle(
                  color: Colors.black, fontSize: 8.0, letterSpacing: 0.8),
            ),
          )),
    );
  }

  //****************************************************************************************//

  //*********************************CART TOTAL BOTTOM NAV**********************************//

  Row cartTotal(height) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: height*0.062,
            //width: MediaQuery.of(context).size.width,
            color: Colors.blue[900],
            child: Padding(
              padding: EdgeInsets.only(left: height*0.02, right: height*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        ),
                  ),
                  Text(
                    '\$15.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
//***************************************************************************************

Container OrderHist(height,width,recentOrders, buildCount, orderFlag){
    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, top: 0.0, right: 15.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: height * 0.83,
                child: ListView.builder(
                  itemCount: buildCount,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 250.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            border: Border.all(
                              color: Colors.grey[350],
                              width: 0.5,
                            )),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: height *
                                          0.015,
                                      top: height *
                                          0.015,
                                      right: height *
                                          0.015,
                                      bottom: height *
                                          0.01),
                                  child: SizedBox(
                                    height: height *
                                        0.05,
                                    width: width *
                                        0.7,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              recentOrders[index]),
                                          height: 35.0,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Santushti Smoothies and Shakes',
                                              style: TextStyle(
                                                  fontSize: 13.0),
                                            ),
                                            Text(
                                              'Fatehgunj',
                                              style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.grey[600],
                                                  height: 2.0),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                              color: Colors.grey[350],
                              height: 1.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                  height *
                                      0.015,
                                  top:
                                  height *
                                      0.015,
                                  right: height *
                                      0.015,
                                  bottom: height *
                                      0.002),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ITEMS',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 11.0),
                                      ),
                                      Text(
                                        '2 X French Fries',
                                        style: TextStyle(height: 1.3),
                                      ),
                                      SizedBox(
                                        height: height *
                                            0.015,
                                      ),
                                      Text(
                                        'ORDERED ON',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 11.0),
                                      ),
                                      Text(
                                        '10 May 2019 at 12:08 PM',
                                        style: TextStyle(height: 1.3),
                                      ),
                                      SizedBox(
                                        height: height *
                                            0.015,
                                      ),
                                      Text(
                                        'TOTAL AMOUNT',
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 11.0),
                                      ),
                                      Text(
                                        '\$15.00',
                                        style: TextStyle(height: 1.3),
                                      ),
                                      SizedBox(
                                        height: height *
                                            0.016,
                                      ),
                                      SizedBox(
                                        height: height *
                                            0.03,
                                        child: RaisedButton(
                                          onPressed: () {
                                            orderFlag ? Navigator.push(context,MaterialPageRoute(
                                                builder: (context) => TrackOrder()
                                            ),) : index = 0 ;
                                          },
                                          child: Text(
                                            orderFlag
                                                ? 'TRACK ORDER'
                                                : 'DELIVERED',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0),
                                          ),
                                          color: orderFlag
                                              ? Colors.green
                                              : Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}

}
