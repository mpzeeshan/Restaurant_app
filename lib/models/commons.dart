import 'package:flutter/material.dart';



class Commons {
  // ignore: non_constant_identifier_names
  List<String> image_list = [
    "imgs/pimgone.jpeg",
    "imgs/pimgthree.jpeg",
    "imgs/pimgthree.jpeg",
    "imgs/pimgone.jpeg",
    "imgs/pimgone.jpeg",
    "imgs/pimgthree.jpeg"
  ];
  List<String> cat_list = [
    "Regular",
    "Beverages",
    "Lunch",
    "Daily Special",
    "Regular",
    "Beverages"
  ];
  List<String> pname_list = [
    "Ika Pirikara",
    "Sashimi Salad",
    "Spicy Trio",
    "Tai Cilantro",
    "Ika Parikara",
    "Sashimi Salad"
  ];
  List<String> coins_list = ["100", "200", "300", "400", "500", "600"];
  List<int> coun_list = [0, 0, 0, 0, 0, 0];
  List<int> price_list = [10, 10, 10, 10, 10, 10];
  List<bool> flag_list = [true, true, true, true, true, true];

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

  Row cartTotal() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40.0,
            //width: MediaQuery.of(context).size.width,
            color: Colors.blue[900],
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 34.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$15',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
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


}


