
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';
import 'package:simplify/Orders/order_history.dart';
import 'package:simplify/Orders/track_order.dart';
import 'package:simplify/UserAccount/more.dart';
import 'package:simplify/screens/home.dart';
import 'package:simplify/screens/offers.dart';
import 'package:simplify/screens/products.dart';
import 'package:simplify/screens/cart.dart';

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

  List<List<dynamic>> extrasFlag = [[true,10,0],[true,10,0],[true,10,0],[true,10,0],[true,10,0],[true,10,0]];
  List<List<int>> extrasPriceList = [[10,10,10], [10,10,10], [10,10,10], [10,10,10], [10,10,10], [10,10,10]];
  List<List<int>> extrasCounList = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]];



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

  Row cartTotal(height,total) {
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
                    '\$'+total.toString()+'.00',
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
//***************************************************************************************//


//*********************** Order History *************************************************//
Container orderHist(height,width,recentOrders, buildCount, orderFlag,context){
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
            Visibility(visible: !orderFlag,child: getRange(context)),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: orderFlag?height * 0.83: height* 0.774,
                child: ListView.builder(
                  itemCount: buildCount,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.28,
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
                            Padding(
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    ],
                                  ),
                                  Text(
                                    'Order No: 34521',
                                    style: TextStyle(height: 1.3),
                                  ),
                                ],
                              ),
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
//***************************************************************************************//
RaisedButton getRange(context){
    bool pickedFlag = false;
    var date = DateTime.now();
      return RaisedButton(
          elevation: 0.0,
          color: Colors.white,
          onPressed: () async {
            final List<DateTime> picked = await DateRagePicker.showDatePicker(
                context: context,
                initialFirstDate: DateTime.now().subtract(Duration(days: 6)),
                initialLastDate: (DateTime.now()).add( Duration(days: 0)),
                firstDate: DateTime(2017).subtract(Duration(days: 7)),
                lastDate: DateTime.now().add(Duration(days: 366))
            );
            if (picked != null && picked.length == 2) {
              print(picked);
              pickedFlag = true;

            }
          },
          child: Column(
            children: [
              Row(
                children: [
                  Text("Pick Date"),
                  SizedBox(width: 5.0,),
                  Icon(Icons.date_range),
                ],
              ),
              Visibility(
                  visible: pickedFlag,
                  child: Text(pickedFlag?date.toString():'')),


        ])
      );
    }

  void checkCart(BuildContext context) {
    if (cartCount.length == 0) {
      print('Cart is empty!');
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: Text(
                'Your cart is empty! :(',
                style: TextStyle(fontSize: 15.0),
              ),
            );
          });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cart(false, 0)),
      );
    }
  }

  BottomNavigationBar bottomNav(BuildContext context,int index){
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue[900],
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (value) {
        switch (value) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Offers(false)),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderHistory()),
            );
            break;
          case 3:
            checkCart(context);
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => More()),
            );
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          // ignore: deprecated_member_use
          title: Text(
            'Home',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          // ignore: deprecated_member_use
          title: Text(
            'Offers',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          // ignore: deprecated_member_use
          title: Text(
            'Orders',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business_center),
          // ignore: deprecated_member_use
          title: Text(
            'Cart',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          // ignore: deprecated_member_use
          title: Text(
            'More',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

}
