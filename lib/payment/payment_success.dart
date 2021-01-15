import 'package:flutter/material.dart';
import 'package:simplify/Local_db/database_helper.dart';
import 'package:simplify/Orders/order_history.dart';
import 'package:simplify/UserAccount/help.dart';
import 'package:simplify/screens/products.dart';



class PaymentSuccess extends StatefulWidget {
  double subTotal;
  double deliveryFee;
  double offerApplied;
  double total;
  PaymentSuccess(this.subTotal,this.deliveryFee,this.offerApplied,this.total);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState(this.subTotal,this.deliveryFee,this.offerApplied,this.total);
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  double subTotal;
  double deliveryFee;
  double offerApplied;
  double total;

  static List<Map> a;

  bool _isLoading = false;

  _PaymentSuccessState(this.subTotal,this.deliveryFee,this.offerApplied,this.total);

  @override
  void initState(){
    getCartProducts();
    super.initState();
  }

  Future getCartProducts() async{
    setState(() {
      _isLoading = true;
    });
    a = await DatabaseHelper.instance.queryForCart();
    print(a[0][productName]);
    setState(() {
      _isLoading =  false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('ORDER PLACED',style: TextStyle(fontSize: 15.0,color: Colors.black),),
            backgroundColor: Colors.white,
            elevation: 0.5,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          body: _isLoading ? Center(child:CircularProgressIndicator()):Container(
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
                             height: a.length > 2 ? MediaQuery.of(context).size.height*0.16:MediaQuery.of(context).size.height*0.06,
                             child: ListView.builder(itemBuilder: (context, index) => Column(
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text( a[index][productName]+' X '+a[index][productQuantity].toString(),style: TextStyle(fontSize: 15.0),),
                                     Text('\$'+(double.parse(a[index][productPrice])*int.parse(a[index][productQuantity])).toString(),style: TextStyle(fontSize: 15.0),),

                                   ],),
                                 SizedBox(height: MediaQuery.of(context).size.height*0.020,),
                               ],

                             ),
                             itemCount: a.length,
                             ),

                         ),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Divider(thickness: 1.3,),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Subtotal',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                             Text('\$'+widget.subTotal.toString(),style: TextStyle(fontSize: 17.0),),

                           ],),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Delivery Charges',style: TextStyle(fontSize: 15.0),),
                             Text('\$'+widget.deliveryFee.toString(),style: TextStyle(fontSize: 15.0),),

                           ],),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Divider(thickness: 1.3,),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Discount',style: TextStyle(fontSize: 15.0),),
                             Text('\$'+widget.offerApplied.toString(),style: TextStyle(fontSize: 15.0),),
                           ],),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Divider(thickness: 1.3,),
                         SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Paid Via Cash',style: TextStyle(fontSize: 17.0),),
                             Text('TOTAL  \$'+widget.total.toString(),style: TextStyle(fontSize: 17.0),),
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
                ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


