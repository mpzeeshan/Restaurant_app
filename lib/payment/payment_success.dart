import 'package:flutter/material.dart';
import 'package:simplify/Orders/order_history.dart';

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderHistory(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.arrow_forward,color: Colors.black),
              )),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle,color: Colors.green,size: MediaQuery.of(context).size.width*0.4,),
              Text('Payment Success',style: TextStyle(color: Colors.black,fontSize: 17.0),),
            ],
          ),
        ),
      ),
    );
  }
}
