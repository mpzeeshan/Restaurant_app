import 'package:flutter/material.dart';
import 'package:simplify/models/commons.dart';


final List<String> recentOrders = [
  "imgs/myAccount/pavbhaji.png",
  "imgs/myAccount/chana_img.png",
  "imgs/myAccount/pavbhaji.png",
  "imgs/myAccount/chana_img.png",
];

Commons h = Commons();

class OrderHistory extends StatelessWidget {

  var screenHeight;
  var screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          color: Colors.teal,
          child: SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'ORDER HISTORY',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
                bottom: TabBar(
                  indicatorColor: Colors.teal,
                  tabs: [
                    Tab(icon: Icon(Icons.history_toggle_off_rounded,color: Colors.black),),
                    Tab(icon: Icon(Icons.history,color: Colors.black),),
                  ],
                ),
                backgroundColor: Colors.white,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  h.orderHist(screenHeight, screenWidth, recentOrders, 1, true,context),
                  h.orderHist(screenHeight, screenWidth, recentOrders, 4, false,context),

                ],
              ),
              ),
            ),
          ),
        ),
    );
  }
}
