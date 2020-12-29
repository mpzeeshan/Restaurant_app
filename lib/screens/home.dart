import 'package:flutter/material.dart';
import 'package:simplify/Orders/order_history.dart';
import 'package:simplify/models/commons.dart';
import 'package:simplify/screens/cart.dart';
import 'package:simplify/screens/products.dart';
import 'package:simplify/screens/offers.dart';
import 'package:simplify/screens/search.dart';
import 'package:simplify/UserAccount/more.dart';

Commons c = Commons();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Item {
  Item(this.name,this.icon);
  String name;
  Image icon;

  List<Item> restaurants = <Item>[
    Item('KFC',Image(image: AssetImage('imgs/kfc.png'),height: 10.0,)),
    Item('Burger King',Image(image: AssetImage('imgs/kfc.png'),height: 10.0,)),
  ];
}


class _HomeState extends State<Home> {
  //********************************** TOP DISHES ********************************************************//

  final List<String> textList = ['KFC','Burger King'];

  final List<String> imgList = ["imgs/kfc.png","imgs/kfc.png"];
  String _currentItemSelected;
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _currentItemSelected = textList[0];

  }

  GestureDetector topDishes(image, category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Products(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: MediaQuery.of(context).size.height*0.145,
            image: AssetImage('$image'),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.005,),
            child: Text(
              '$category',
              style: TextStyle(color: Colors.black, letterSpacing: 0.3),
            ),
          ),
        ],
      ),
    );
  } // TOP DISHES

  //********************************************************************************************************//

  //****************************************** ON OFFER*****************************************************//

  // ignore: non_constant_identifier_names
  Stack on_offer(image, one, two, three) {
    return Stack(
      children: [
        Image(
          image: AssetImage('$image'),
          height: MediaQuery.of(context).size.height*0.221,
        ),
        Positioned(
            bottom: 0.0,
            child:
                Image(image: AssetImage('imgs/image_shado.png'), height: MediaQuery.of(context).size.height*0.109)),
        Positioned(
          bottom: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                c.offer(),
                Text(
                  "$one",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$two",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$three",
                    style: TextStyle(color: Colors.black, fontSize: 8.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //************************************************************************************************//

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal[700], fontFamily: 'Robot'),
      home: Builder(
        builder: (context) => Container(
          color: Colors.teal[700],
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.024, top: 0.0, right: MediaQuery.of(context).size.width*0.024, bottom:0.0 ),
                child: ListView(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.012),
                      child: Row(
                        children: [
                          // Icon(
                          //   Icons.menu,
                          //   color: Colors.black,
                          // ),
                          // SizedBox(
                          //   width: 10.0,
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image(image: AssetImage('imgs/kfc.png'),height: MediaQuery.of(context).size.height*0.055,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PopupMenuButton<String>(
                                          itemBuilder: (context) {
                                            return textList.map((str) {
                                              return PopupMenuItem(
                                                value: str,
                                                child: Row(
                                                  children: [
                                                    Text(str,style: TextStyle(color: Colors.blue[900]),),
                                                  ],
                                                ),
                                              );
                                          }).toList();
                                          },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(_currentItemSelected,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900],fontSize: 15.0,letterSpacing: 0.7),),

                                              ],
                                            ),
                                            onSelected: (v) {
                                              setState(() {
                                                print('!!!===== $v');
                                                _currentItemSelected = v;
                                                _selected = !_selected;
                                              });
                                            },
                                          ),
                                      Text(_selected?'East Texas, #7 Wall street...':'Tulsa, #1 This street...',style: TextStyle(fontSize: 11.0),),
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => More(),
                                          ),
                                        );
                                      },
                                      child: Icon(Icons.arrow_right,color: Colors.blue[900],size: MediaQuery.of(context).size.height*0.034,)),
                                ],
                              ),
                             // Padding(
                             //   padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.1),
                             //   child: Text('East Texas, #7 Wall street...',style: TextStyle(fontSize: 11.0),),
                             // ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Search(),
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.search))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.005, bottom: MediaQuery.of(context).size.height*0.03),
                      child: Container(

                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  on_offer(
                                      "imgs/image_home1.png",
                                      "45% OFF!",
                                      "COUPON 'STAR200'",
                                      "AMAYA FREN RESIDENCY VADODARA"),
                                  on_offer("imgs/image_home2.png",
                                      "BREAKFAST AT", "50% OFF", "EXPLORE NOW"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                              width: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  on_offer("imgs/image_home3.png", "SANDWICH'S",
                                      "START FROM \$ 20", "EXPLORE NOW"),
                                  on_offer("imgs/image_home4.png",
                                      "BREAKFAST AT", "50% OFF", "EXPLORE NOW"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Products(),
                              ),
                            );
                          },
                          child: Text(
                            'Top Dishes',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17.0),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                      child: Row(
                        //Top Dishes
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          topDishes("imgs/four.jpeg", "Regular"),
                          topDishes("imgs/pimgone.jpeg", "Beverages"),
//
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                      child: Row(
                        //Top Dishes
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          topDishes("imgs/pchickenimg.jpeg", "Daily Special"),
                          topDishes("imgs/six.jpeg", "Lunch"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02,bottom: MediaQuery.of(context).size.height*0.03),
                      child: Row(
                        //Top Dishes
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          topDishes("imgs/pchickenimg.jpeg", "Lunch Special"),
                          topDishes("imgs/six.jpeg", "Dinner"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blue[900],
                unselectedItemColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                currentIndex: 0,
                onTap: (value) {
                  switch (value) {
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Offers()),
                      );
                      break;

                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderHistory()),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cart()),
                      );
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//GestureDetector(
//onTap: () {
//Navigator.push(
//context,
//MaterialPageRoute(
//builder: (context) => SavedAddresses(),
//),
//);
//},
//child: Text(
//'31 A, RK Flats, near Vasushiti Mall. ...',
//style: TextStyle(
//fontSize: 11.0, color: Colors.grey[600]),
//),
//),
