import 'package:flutter/material.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';
import 'package:simplify/screens/home.dart';
import 'package:simplify/screens/offers.dart';
import 'package:simplify/screens/products.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:simplify/payment/payments.dart';
import 'package:simplify/Orders/order_summary.dart';


class Cart extends StatefulWidget {


  bool offerFlag;
  int selectedAddress;
  Cart(this.offerFlag,this.selectedAddress);

  @override
  _CartState createState() => _CartState(this.offerFlag,this.selectedAddress);
}

class _CartState extends State<Cart> {

  int itemCountForPayments= 0;
  bool offerFlag;
  int selectedAddress;
  _CartState(this.offerFlag,this.selectedAddress);

  TextEditingController _instructionsController = TextEditingController();

  var disc = 5;
  var delFee = 2;
  int cartTotal;

  @override
  void initState(){
    cartTotal = total;
    itemCountForPayments = itemCountFP();
    super.initState();
  }

  int itemCountFP(){
    int temp = 0;
    for(int i=0;i<c.counList.length;i++){
      temp = temp+c.counList[i];
    }
    return temp;
  }


  Container size(count) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
      ),
      child: SizedBox(
        height: 25.0,
        width: 75.0,
        child: Container(
          color: c.flagList[count] ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: !c.flagList[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      c.counList[count] = c.counList[count] - 1;
                      cartTotal -=10;
                      total -=10;
                      itemCountForPayments -= 1;
                      if (c.counList[count] >= 1) {
                        c.priceList[count] = c.priceList[count] - 10;
                      }
                      if (c.counList[count] == 0) {
                        c.flagList[count] = true;
                        cartCount.remove(count);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()
                          ),
                        );
                        if (cartCount.length == 0){
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 1), () {
                                });
                                return AlertDialog(
                                  title: Text('Your cart is empty! :(',style: TextStyle(fontSize: 15.0),),
                                );
                              });
                        }
                      }
                    });
                  },
                  child: SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(color: Colors.black, fontSize: 19.0),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: c.flagList[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      c.counList[count] = c.counList[count] + 1;
                      c.flagList[count] = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left:6.0),
                    child: Text(
                      '+ Add',
                      style: TextStyle(color: Colors.orange[700]),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !c.flagList[count],
                child: Padding(
                  padding: const EdgeInsets.only(right:3.0),
                  child: Text(
                    c.counList[count].toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: !c.flagList[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      cartTotal +=10;
                      total +=10;
                      c.counList[count] = c.counList[count] + 1;
                      itemCountForPayments += 1;
                      if (c.counList[count] > 1) {
                        c.priceList[count] = c.priceList[count] + 10;
                      }
                    });
                  },
                  child: SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.black, fontSize: 17.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
              'CART',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SavedAddresses(false,true)
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            elevation: 1.8,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.035, top: 5.0, right: MediaQuery.of(context).size.width*0.035, bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.04,
                    ),
                    Container(
                      height: cartCount.length >= 2 ?MediaQuery.of(context).size.height*0.12:MediaQuery.of(context).size.height*0.07,
                      child: ListView.builder(
                        itemCount: cartCount.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      c.pnameList[cartCount[index]],
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    Text(
                                      '\$'+c.priceList[cartCount[index]].toString()+'.00',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[600],
                                          height: 1.5),
                                    ),
                                  ],
                                ),

                                size(cartCount[index]),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          ],
                        ),
                      ),
                    ),
                    DottedLine(
                      dashColor: Colors.grey,
                    ),
                    TextField(
                      controller: _instructionsController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Any instructions? We promise to pass them on',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13.0,
                        ),
                      ),
                    ),

                    Divider(
                      height: 1.0,
                      thickness: 1.3,
                      color: Colors.black,
                    ),
                    Visibility(
                      visible: offerFlag == false,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Offers(true)
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Image(
                              image: AssetImage('imgs/discount.png'),
                              height: 30.0,
                            ),
                            title: Text(
                              'APPLY COUPON',
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.8,
                                  fontSize: 15.0),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: offerFlag == true,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Offers(true)
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Image(
                              image: AssetImage('imgs/discount.png'),
                              height: 30.0,
                            ),
                            title: Text(
                              appliedOffer.toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  letterSpacing: 0.8,
                                  fontSize: 15.0),
                            ),
                            trailing: RaisedButton(
                              elevation: 0.0,
                              color: Colors.white,
                              onPressed: (){
                                setState(() {
                                  offerFlag = false;
                                });
                              },
                              child: Icon(Icons.delete),
                            )
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.3,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Text(
                      'BILL DETAILS',
                      style: TextStyle(letterSpacing: 1.0, fontSize: 15.0),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Item Total',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          '\$'+cartTotal.toString()+'.00',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Visibility(
                      visible: offerFlag == true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appliedOffer.toString(),
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(
                            '-\$'+appliedOfferPrice.toString()+'.00',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: offerFlag == true,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Discount',
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                            '\$00.00',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Divider(
                      thickness: 0.6,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          '\$'+delFee.toString()+'.00',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Divider(
                      thickness: 0.6,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                        Text(
                          '\$'+(cartTotal+delFee-appliedOfferPrice).toString()+'.00',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.3,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'DELIVERY ADDRESS',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Image(
                        //   image: AssetImage('imgs/work.png'),
                        //   height: MediaQuery.of(context).size.height * 0.07,
                        // ),
                        Icon(am.addressIcons[selectedAddress],),
                        SizedBox(
                          width: 15.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              am.place[selectedAddress],
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Text(
                                am.location[selectedAddress],
                                maxLines: 1,

                                style:
                                    TextStyle(color: Colors.grey[600], height: 1.3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    GestureDetector(
                      child: Text(
                        'CHANGE ADDRESS',
                        style: TextStyle(
                            letterSpacing: 1.0, color: Colors.deepOrangeAccent),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => SavedAddresses(false,false)
                            ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderSummary()),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.065,
                    //width: MediaQuery.of(context).size.width,
                    color: Colors.blue[900],
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.016,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$ 17',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                                ),
                                Text(
                                  'VIEW DETAILED BILL',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Payments(itemCountForPayments,delFee,(cartTotal+delFee-appliedOfferPrice),cartTotal)),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height*0.065,
                              color: Colors.green,
                              child: Center(
                                child: Text(
                                  'PROCEED TO PAY',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
