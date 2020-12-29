import 'package:flutter/material.dart';
import 'package:simplify/payment/payment_success.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  bool card = false;
  bool cash = false;
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
      if (val == 1){
        card = !card;
        cash = false;
      } else if(val == 2){
        cash = !cash;
        card = false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'PAYMENTS',
              style: TextStyle(
                  color: Colors.black, fontSize: 16.0, letterSpacing: 0.8),
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding:  EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*0.03, top: MediaQuery.of(context).size.height*0.01, right: MediaQuery.of(context).size.width*0.03, bottom: MediaQuery.of(context).size.width*0.035),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  RadioListTile(
                    value: 1,
                    groupValue: selectedRadioTile,
                    title: Row(children: [
                      Icon(Icons.credit_card),
                      SizedBox(width: MediaQuery.of(context).size.width*0.03,),

                    ],),
                    subtitle: Text("Credit/Debit/UPI/Net Banking.",style: TextStyle(color: card ? Colors.teal:Colors.black),),
                    onChanged: (val) {
                      print("Credit option pressed $val");
                      setSelectedRadioTile(val);
                    },
                    activeColor: Colors.teal,
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: selectedRadioTile,
                    title: Row(children: [
                      Icon(Icons.payments),
                    ],),
                    subtitle: Text("Cash on Delivery.",style: TextStyle(color: cash ? Colors.teal:Colors.black ),),
                    onChanged: (val) {
                      print("Cash on delivery pressed $val");
                      setSelectedRadioTile(val);
                    },
                    activeColor: Colors.teal,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.008),
                    child: Card(
                      color: Colors.white,
                      shadowColor: Colors.grey,
                      elevation: 2.0,
                      child: Container(

                        width: MediaQuery.of(context).size.width*0.85,

                        child: Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                              Text('Payment Details',style: TextStyle(color: Colors.grey[600],fontSize: 17.0),),
                              Divider(thickness: 0.8,),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Price(8 Items)',style: TextStyle(color: Colors.grey[600],fontSize: 15.0),),
                                  Text('\$10.00',style: TextStyle(color: Colors.grey[600],fontSize: 15.0)),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delivery Charges',style: TextStyle(color: Colors.grey[600],fontSize: 15.0),),
                                  Text('\$00.00',style: TextStyle(color: Colors.grey[600],fontSize: 15.0)),
                                ],
                              ),
                              Divider(thickness: 0.8,),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Amount',style: TextStyle(color: Colors.black,fontSize: 17.0),),
                                  Text('\$10.00',style: TextStyle(color: Colors.grey[600])),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 46.0,
                          child: RaisedButton(
                            color: Colors.green,
                            child: Center(
                                child: Text(
                                  'PAY NOW',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.0,
                                      fontSize: 17.0),
                                )),
                            onPressed: () {
                              setState(() {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentSuccess(),
                                    ),
                                  );

                              });
                            },
                          ),
                        ),
                      ],
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


// Container(
// height: MediaQuery.of(context).size.height *
// 0.055,
// width: MediaQuery.of(context).size.width,
// child: RaisedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// PaymentSuccess()),
// );
// },
// child: Text(
// 'PAY WITH CASH',
// style: TextStyle(color: Colors.white),
// ),
// color: Colors.green,
// ),
// ),