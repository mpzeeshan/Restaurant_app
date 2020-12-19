import 'package:flutter/material.dart';
import 'package:simplify/Orders/order_history.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PAYMENTS',
                style: TextStyle(
                    color: Colors.black, fontSize: 16.0, letterSpacing: 0.8),
              ),
              Text(
                '1 item, To pay : \$17',
                style: TextStyle(
                    color: Colors.grey[600], fontSize: 13.0, height: 1.2),
              ),
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
        body: Container(
          color: Colors.teal[700],
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 5.0, right: 15.0, bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'PAY ON DELIVERY',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.03,
                        bottom: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = true;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 13.0, color: Colors.black),
                                  ),
                                  CircleAvatar(
                                    radius: 6.5,
                                    backgroundColor:
                                        selected ? Colors.green : Colors.grey,
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.04,
                                  top: MediaQuery.of(context).size.height * 0.01),
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right:
                                              MediaQuery.of(context).size.width *
                                                  0.1),
                                      child: Text(
                                        'Please keep extra change when delivery boy arrives for delivery :)',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 11.0),
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.01,
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height *
                                          0.055,
                                      width: MediaQuery.of(context).size.width,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderHistory()),
                                          );
                                        },
                                        child: Text(
                                          'PAY WITH CASH',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
