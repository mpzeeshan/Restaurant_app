import 'package:flutter/material.dart';

final List<String> recentOrders = [
  "imgs/myAccount/pavbhaji.png",
  "imgs/myAccount/chana_img.png",
  "imgs/myAccount/pavbhaji.png",
  "imgs/myAccount/chana_img.png",
];

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORDER HISTORY',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
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
      body: Container(
        color: Colors.teal[700],
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                      height: MediaQuery.of(context).size.height * 0.89,
                      child: ListView.builder(
                        itemCount: 4,
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
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.015,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.015,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.015,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                        right:
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                        bottom:
                                            MediaQuery.of(context).size.height *
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.015,
                                            ),
                                            Text(
                                              'TOTAL AMOUNT',
                                              style: TextStyle(
                                                  color: Colors.grey[500],
                                                  fontSize: 11.0),
                                            ),
                                            Text(
                                              '\$ 15',
                                              style: TextStyle(height: 1.3),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.016,
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              child: RaisedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  index == 0
                                                      ? 'TRACK ORDER'
                                                      : 'DELIVERED',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0),
                                                ),
                                                color: index == 0
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
          ),
        ),
      ),
    );
  }
}
