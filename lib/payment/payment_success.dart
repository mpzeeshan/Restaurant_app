import 'package:flutter/material.dart';
import 'package:simplify/Orders/order_history.dart';
import 'package:simplify/UserAccount/help.dart';



class PaymentSuccess extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('ORDER PLACED',style: TextStyle(fontSize: 16.0,color: Colors.black),),
            backgroundColor: Colors.white,
            elevation: 1.0,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.028),
                  child: Row(children: [
                    Icon(Icons.check_circle,color: Colors.green,size: MediaQuery.of(context).size.width*0.23,),
                    SizedBox(width: MediaQuery.of(context).size.width*0.023,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.68,
                        child: Text('Your order has been placed successfully.',style: TextStyle(color: Colors.grey[700],fontSize: 16.0,fontWeight: FontWeight.bold),)),

                  ],),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Divider(thickness: 1.3,),
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.04),
                  child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                         Text('Your Order',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.grey[800]),),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Divider(thickness: 1.3,),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                         Container(
                             height: MediaQuery.of(context).size.height*0.08,
                             child: ListView.builder(itemBuilder: (context, index) => Column(
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text('Spicy Trio X 5',style: TextStyle(fontSize: 15.0),),
                                     Text('\$10.00',style: TextStyle(fontSize: 15.0),),

                                   ],),
                                 SizedBox(height: MediaQuery.of(context).size.height*0.020,),
                               ],

                             ),
                             itemCount: 3,
                             ),

                         ),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Divider(thickness: 1.3,),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Subtotal',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                             Text('\$12.00',style: TextStyle(fontSize: 17.0),),

                           ],),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Delivery Charges',style: TextStyle(fontSize: 15.0),),
                             Text('\$1.00',style: TextStyle(fontSize: 15.0),),

                           ],),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Divider(thickness: 1.3,),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Discount',style: TextStyle(fontSize: 15.0),),
                             Text('\$00.00',style: TextStyle(fontSize: 15.0),),
                           ],),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Divider(thickness: 1.3,),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Paid Via Cash',style: TextStyle(fontSize: 17.0),),
                             Text('TOTAL  \$12.00',style: TextStyle(fontSize: 17.0),),
                           ],),
                       ],
                     ),
                  ),
                ),

              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.blue[900],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.055,
            child: Row(

              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderHistory()),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.055,
                    color: Colors.green,
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Center(
                      child: Text('Track Order',style: TextStyle(color: Colors.white,fontSize: 17.0),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Help()),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.055,
                    color: Colors.blue[900],
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Center(
                      child: Text('Need Help ?',style: TextStyle(color: Colors.white,fontSize: 17.0),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
