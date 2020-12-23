import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';
import 'package:simplify/models/more_model.dart';
import 'package:simplify/screens/products.dart';
import 'package:simplify/screens/offers.dart';
import 'package:simplify/screens/search.dart';
import 'package:simplify/screens/wallet.dart';

MoreModel m = MoreModel();

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[700],
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('JOHN WOOSH'),
                          subtitle: Text(
                            '31873813 | john@gmail.com',
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.grey[500]),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Edit Account',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,fontSize: 17.0),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            TextField(
                                              controller: _emailController,
                                              decoration: InputDecoration(
                                                hintText: 'john@gmail.com',
                                              ),
                                            ),
                                            TextField(
                                              controller: _phoneController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: '9876567890',
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.045,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.67,
                                                    child: RaisedButton(
                                                      color: Colors
                                                          .deepOrange[400],
                                                      child: Center(
                                                          child: Text(
                                                        'UPDATE',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            letterSpacing: 1.0,
                                                            fontSize: 17.0),
                                                      )),
                                                      onPressed: () {
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              'EDIT',
                              style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,letterSpacing: 1.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.3,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        ExpansionTile(
                          title: Text('MY ACCOUNTS'),
                          subtitle: Text(
                            'Addresses, Payments, Favourites, Referrals & Offers',
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.grey[500]),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          children: [
                            DottedLine(
                              dashColor: Colors.grey,
                            ),
                            Container(
                              height: 280.0,
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) => ListTile(
                                  title: Text(
                                    m.myAccTitle[index],
                                    style: TextStyle(),
                                  ),
                                  leading: Image(
                                    image: AssetImage(m.myAccImages[index]),
                                    height: 24.0,
                                  ),
                                  trailing: Icon(Icons.keyboard_arrow_right,
                                      color: Colors.grey),
                                  onTap: (){
                                    if(index == 0){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SavedAddresses()),
                                      );
                                    }
                                    if(index == 4){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Offers()),
                                      );
                                    }
                                    if(index == 1){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Wallet()),
                                      );

                                    }

                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.3,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        ListTile(
                          title: Text('HELP'),
                          subtitle: Text(
                            'Order related queries or any other',
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.grey[500]),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.3,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        ExpansionTile(
                          title: Text('RECENT ORDERS'),
                          subtitle: Text(
                            'View recent orders',
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.grey[500]),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          children: [
                            DottedLine(
                              dashColor: Colors.grey,
                            ),
                            Container(
                              height: 350,
                              child: ListView.builder(
                                itemCount: 2,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage(m.recentOrders[index]),
                                        height: 80.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(m.recentName[index]),
                                            SizedBox(
                                              height: 7.0,
                                            ),
                                            Text(
                                              m.recentDate[index],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              m.recentPrice[index],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0),
                                            ),
                                            RaisedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'RE ORDER',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              color: Colors.grey[400],
                                            ),
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            Divider(
                                              thickness: 1.3,
                                              height: 1.0,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                      height: 3.0, thickness: 17.0, color: Colors.grey[350]),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, top: 27.0),
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,
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
                MaterialPageRoute(builder: (context) => Search()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Products()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => More()),
              );
              break;
          }

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            // ignore: deprecated_member_use
            title: Text(
              'Offers',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            // ignore: deprecated_member_use
            title: Text(
              'Search',
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
    );
  }
}
//
