import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  TextEditingController amount = TextEditingController();

  var _rupees = '2000';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Wallet',
            style: TextStyle(color: Colors.black, fontSize: 18.0),
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
          bottom: TabBar(
            indicatorColor: Colors.teal,
            indicatorSize: TabBarIndicatorSize.tab,

            tabs: [
              Tab(icon: Icon(Icons.account_balance_wallet_outlined,color: Colors.black,),),
              Tab(icon: Icon(Icons.wallet_giftcard,color: Colors.black),),
            ],
          ),
        ),
        body: TabBarView(

          children: [
            Padding(
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
                    Text(
                      '\$  95',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
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
            Container(

              height: MediaQuery.of(context).size.height*0.83,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.03),
                    child: Card(
                      color: Colors.green[50],
                      shadowColor: Colors.grey,
                      elevation: 6.0,
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          Text('Kushiyu Gift Card',style: TextStyle(fontSize:25.0,color: Colors.teal,fontWeight: FontWeight.bold,letterSpacing: 0.8),),
                          SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.08,
                            child: Padding(
                              padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.08,right:MediaQuery.of(context).size.width*0.08),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Text('Rs '+_rupees,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                                VerticalDivider(
                                  endIndent: 1.0,
                                  thickness: 0.6,
                                  color: Colors.teal,
                                ),
                                  Text('Buy now',style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),),

                              ],),

                            ),
                          ),
                          Divider(thickness: 0.6,color: Colors.teal,),
                          SizedBox(height: MediaQuery.of(context).size.height*0.07,
                          child: Center(child: Text('Hope you enjoy this Kushiyu Gift Card!',)),
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      RaisedButton(
                        color: Colors.green[200],
                          child: Center(child:Text('2000'),),

                          onPressed: (){
                          setState(() {
                            _rupees = '2000';
                          });


                          }),
                      RaisedButton(
                          color: Colors.green[200],
                          child: Center(child:Text('500'),),

                          onPressed: (){
                          setState(() {
                            _rupees = '500';
                          });

                          }),
                      RaisedButton(

                          color: Colors.green[200],
                          child: Center(child:Text('1000'),),

                          onPressed: (){
                            setState(() {
                              _rupees = '1000';
                            });

                          }),

                    ],),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        RaisedButton(

                            color: Colors.green[200],
                            child: Center(child:Text('3000'),),

                            onPressed: (){
                              setState(() {
                                _rupees = '3000';
                              });

                            }),

                      ],),
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
