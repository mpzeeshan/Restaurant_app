import 'package:flutter/material.dart';
import 'package:simplify/UserAccount/more.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORDER SUMMARY',
          style: TextStyle(
              color: Colors.black, fontSize: 15.0,),
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
                  left: 15.0, top: 0.0, right: 15.0, bottom: 5.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Image(image: AssetImage(m.recentOrders[0]), height: 80.0,),
                          SizedBox(width: 15.0,),
                          Container(

                            width: MediaQuery.of(context).size.width*0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text('Santushti Smoothies and Shakes'),
                                SizedBox(height: 7.0,),
                                Text('North Indian',style: TextStyle(color:Colors.grey,fontSize: 12.0),),
                                SizedBox(height: 5.0,),
                                Text('Fatehgunj',style: TextStyle(color:Colors.grey, fontSize: 12.0),),
                                SizedBox(height: 5.0,),
                                Container(
                                  height: 20.0,
                                  child: RaisedButton(onPressed: (){},
                                    child: Text('ORDER DELIVERED',style: TextStyle(color: Colors.white,fontSize: 10.0),),
                                    color: Colors.grey[400],
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                Text('YOUR ORDER',style: TextStyle(fontSize: 14.0),),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Divider(thickness: 0.6,color: Colors.grey,),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Container(
                  height: 50.0,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 6.0,
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 7.0,
                                    ),
                                  ),
                                  SizedBox(width: 5.0,),
                                  Text('Paneer Biryani', style: TextStyle(fontSize: 15.0,),),

                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.88,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('2 X \$ 10 ',style: TextStyle(fontSize: 14.0,color: Colors.black,height: 2.0),),
                                    Text('\$ 20'),

                                  ],),
                              ),

                            ],),
                        ),

                      ],
                    ),),
                ),
                Divider(thickness: 0.6,color: Colors.grey,),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.88,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal',style: TextStyle(fontSize: 14.0,color: Colors.black,height: 2.0),),
                        Text('\$ 20'),

                      ],),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.88,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discounted Delivery Charge',style: TextStyle(fontSize: 13.0,color: Colors.grey,height: 2.0),),
                        Text('\$ 10.00',style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 0.6,color: Colors.grey,),
                Padding(
                  padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03,bottom: MediaQuery.of(context).size.height*0.01),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.87,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: TextStyle(fontSize: 14.0,color: Colors.black,height: 2.0),),
                        Text('\$ 15',style: TextStyle(color: Colors.black),),
                      ],),
                  ),
                ),

                Divider(thickness: 0.6,color: Colors.grey),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Text('Order Details',style: TextStyle(fontSize: 15.0),),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Divider(thickness: 0.6,color: Colors.grey),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Text('ORDER NUMBER',style: TextStyle(color: Colors.grey[500],fontSize: 11.0),),
                Text('1328787123',style: TextStyle(height: 1.3),),
                SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Text('PAYMENT',style: TextStyle(color: Colors.grey[500],fontSize: 11.0),),
                Text('Cash on delivery',style: TextStyle(height: 1.3),),
                SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Text('ORDERED ON',style: TextStyle(color: Colors.grey[500],fontSize: 11.0),),
                Text('10 May 2019 at 12:00 PM',style: TextStyle(height: 1.3),),
                SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Text('PHONE NUMBER',style: TextStyle(color: Colors.grey[500],fontSize: 11.0),),
                Text('9876567891',style: TextStyle(height: 1.3),),
                SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                Container(width: MediaQuery.of(context).size.width*0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ADDRESS',style: TextStyle(color: Colors.grey[500],fontSize: 11.0),),
                    Text('S02, Indiabulls mega mall,near dinesh mill, jetalpur road, Vadodara, 390020',style: TextStyle(height: 1.3),),
                    SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                  ],
                ),
                ),



              ]),
            ),
          ),
        ),
      ),
    );
  }
}
