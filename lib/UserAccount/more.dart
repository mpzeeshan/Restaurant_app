import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplify/Orders/order_history.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';
import 'package:simplify/UserAccount/edit_account.dart';
import 'package:simplify/UserAccount/help.dart';
import 'package:simplify/login/login.dart';
import 'package:simplify/login/otp.dart';
import 'package:simplify/models/more_model.dart';
import 'package:simplify/payment/gift_card.dart';
import 'package:simplify/screens/cart.dart';
import 'package:simplify/screens/home.dart';
import 'package:simplify/screens/offers.dart';
import 'package:simplify/payment/wallet.dart';

MoreModel m = MoreModel();
String emailPref;
String phonePref;
String fullNamePref;


class More extends StatefulWidget {

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {

  bool _expand;
  SharedPreferences sharedPreferences;
  bool _isLoading = false;

  @override
  void initState() {
    _expand = true;
    super.initState();
    getPref();
  }

  void getPref() async{
    setState(() {
      _isLoading = true;
    });
    sharedPreferences = sharedPreferences = await SharedPreferences.getInstance();
    fullNamePref = sharedPreferences.getString("fullName");
    phonePref = sharedPreferences.getString("phone");
    emailPref = sharedPreferences.getString("email");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.black,)),
            backgroundColor: Colors.white,
            elevation: 0.5,
          ),
          body: Container(
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
                          title: _isLoading? LinearProgressIndicator():Text(fullNamePref.toUpperCase()),
                          subtitle: _isLoading?LinearProgressIndicator():Text(
                            phonePref+' | '+emailPref,
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.grey[500]),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditAccount()),
                              );
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
                          onExpansionChanged: ((_){
                            setState(() {
                              _expand = !_expand;

                            });

                          } ),
                          title: Text('MY ACCOUNTS',style: TextStyle(color: _expand?Colors.black:Colors.teal),),
                          subtitle: Text(
                            'Manage Address, Wallet, Gift Card',
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.grey[500]),
                          ),

                          trailing: Icon(_expand?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,
                              color: Colors.black),
                          children: [
                            DottedLine(
                              dashColor: Colors.grey,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.21,
                              child: ListView.builder(
                                itemCount: 3,
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
                                        MaterialPageRoute(builder: (context) => SavedAddresses(true,false)),
                                      );
                                    }
                                    if(index == 1){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Wallet()),
                                      );
                                    }
                                    if(index == 2){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => GiftCard()),
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
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Help()),
                            );
                          },
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
                        ListTile(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OrderHistory()),
                            );
                          },
                          title: Text('RECENT ORDERS'),
                          subtitle: Text(
                            'Check recent orders',
                            style: TextStyle(
                                fontSize: 11.0, color: Colors.grey[500]),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                      height: 3.0, thickness: 17.0, color: Colors.grey[350]),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, top: 27.0),
                    child: GestureDetector(
                      onTap: (){
                        sharedPreferences.clear();
                        // sharedPreferences.commit();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Login()), (Route<dynamic> route) => false);
                      },
                      child: Text(
                        'LOGOUT',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
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
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Offers(false)),
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
                    MaterialPageRoute(builder: (context) => Cart(false,0)),
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
                icon: Icon(Icons.history),
                // ignore: deprecated_member_use
                title: Text(
                  'Orders',
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
    );
  }
}
//
