import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  TextEditingController amount = TextEditingController();
  SharedPreferences sharedPreferences;
  String walletPref;
  bool _isLoading = false;

  @override
  void initState(){
    super.initState();
    getPref();
  }
  void getPref() async{
    setState(() {
      _isLoading = true;
    });
    sharedPreferences = sharedPreferences = await SharedPreferences.getInstance();
    walletPref = sharedPreferences.getString("wallet");
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'WALLET',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            elevation: 1.8,

          ),
          body: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    'Current Balance',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),

                  _isLoading? LinearProgressIndicator() : Text(
                    '\$'+walletPref+'.00',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)
                  ),
                  // Text(
                  //   _isLoading? LinearProgressIndicator():'\$'+walletPref+'.00',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  // ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.grey[600],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Text('Topup Wallet'),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        'Add money to your wallet and make one tap paymnets.',
                        style: TextStyle(height: 1.5),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  TextField(
                    controller: amount,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.grey[500]),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                      border: OutlineInputBorder(),
                      hintText: 'Enter Amount',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.063,
                        child: RaisedButton(
                          color: Colors.deepOrange[400],
                          child: Center(
                              child: Text(
                                'Add Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1.0,
                                    fontSize: 17.0),
                              )),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.black,
                    ),
                    title: Text('See all Transaction History'),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.grey[600],
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
