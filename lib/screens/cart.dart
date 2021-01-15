import 'package:flutter/material.dart';
import 'package:simplify/Local_db/database_helper.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';
import 'package:simplify/screens/home.dart';
import 'package:simplify/screens/offers.dart';
import 'package:simplify/screens/products.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:simplify/payment/payments.dart';
import 'package:simplify/Orders/order_summary.dart';
import 'package:simplify/screens/single_product_view.dart';


class Cart extends StatefulWidget {

  bool offerFlag;
  int selectedAddress;
  int discount_percent;
  double baseAmount;
  Cart(this.offerFlag,this.selectedAddress,this.discount_percent,this.baseAmount);

  @override
  _CartState createState() => _CartState(this.offerFlag,this.selectedAddress,this.discount_percent,this.baseAmount);
}

class _CartState extends State<Cart> {

  int selectedAddress;
  int itemCountForPayments= 0;
  int forListView = 1;
  int discount_percent;

  double baseAmount;

  bool offerFlag;
  bool _isLoading = true;
  bool _cartEmpty = false;

  _CartState(this.offerFlag,this.selectedAddress,this.discount_percent,this.baseAmount);

  TextEditingController _instructionsController = TextEditingController();
  static var itemTotal;
  var disc = 5;
  double delFee = 2.02;
  double cartTotal;
  static List<Map> a;

  static List<String> product_id;
  static List<String> pname;
  static List<int> product_qty;
  static List<double> product_price;
  static List<int> extracheese;
  static List<int> extraspice;
  static List<int> extrabaked;

  static int totalItemCount = 0;


  @override
  void initState(){

    setState(() {
      _isLoading = true;
    });
    getCartProducts();
    setState(() {
    });
    setState(() {
      _isLoading = false;
    });
    super.initState();
  }

  Future fillProductLists() async {
    product_id = List<String>.generate(a.length, (index) => '');
    pname = List<String>.generate(a.length, (index) => '');
    product_qty = List<int>.generate(a.length, (index) => 0);
    product_price = List<double>.generate(a.length, (index) => 0.00);
    extracheese = List<int>.generate(a.length, (index) => 0);
    extraspice = List<int>.generate(a.length, (index) => 0);
    extrabaked = List<int>.generate(a.length, (index) => 0);

    for (int i = 0; i < a.length; i++) {
      product_id[i] = a[i][productId_helper].toString();
      product_price[i] = double.parse(a[i][productPrice]);
      product_qty[i] = int.parse(a[i][productQuantity]);
      pname[i] = a[i][productName];
      extracheese[i] = int.parse(a[i][extraCheese]);
      extrabaked[i] = int.parse(a[i][extraBaked]);
      extraspice[i] = int.parse(a[i][extraSpice]);
    }
    print('After the loop');
    print(product_id);
    print(product_price);
    print(product_qty);
    print(pname);
    print(extracheese);
    print(extrabaked);
    print(extraspice);
    setState(() {});
  }

  Future getCartProducts() async{
    setState(() {
      _isLoading = true;
    });
    a = await DatabaseHelper.instance.queryForCart();
    if (a.length == 0){
      _cartEmpty = true;
    }
    setState(() {
    });
    fillProductLists();
    itemTotal =getItemTotal();
    totalItemCount = getTotalItemCount();
    setState(() {
      _isLoading =  false;
    });
  }

  double getItemTotal(){
    double temp = 0.00;
    for(int i=0; i<a.length;i++){
      temp += product_price[i]*product_qty[i];
    }
    return temp;
  }

  int getTotalItemCount(){
    int temp = 0;
    for(int i=0; i<product_qty.length ; i++ ){
      temp += product_qty[i];
    }
    return temp;
  }


  void _onGoBack(dynamic value) {
    setState(() {});
  }

  Container size(count) {
    Word word = Word();
    itemTotal = getItemTotal();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
      ),
      child: SizedBox(
        height: 25.0,
        width: 75.0,
        child: Container(
          color: product_qty[count] == 0 ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: product_qty[count] != 0 ,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.horizontal_rule,size: 13.0,),
                  onPressed: () async{

                    word.pquantity = product_qty[count] - 1;

                    await DatabaseHelper.instance.update(word,a[count][productId_helper].toString());
                    print(await DatabaseHelper.instance.queryAll());
                    print('From sub');

                    product_qty[count] = int.parse(await DatabaseHelper.instance.queryOne(product_id[count].toString()));
                    itemTotal = getItemTotal();
                    totalItemCount = getTotalItemCount();
                    setState(() {
                      if(baseAmount < itemTotal+delFee){
                        offerFlag = false;
                        discount_percent = 0;
                      }
                    });
                    if (totalItemCount == 0){
                       _cartEmpty = true;
                      }
                  },
                ),),
              Visibility(
                visible: product_qty[count] == 0,
                child: GestureDetector(
                  onTap: () async{
                    word.pquantity = product_qty[count] + 1;
                    await DatabaseHelper.instance.update(word,product_id[count].toString());
                    print(await DatabaseHelper.instance.queryAll());
                    product_qty[count] = int.parse(await DatabaseHelper.instance.queryOne(product_id[count].toString()));

                    setState(() {

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
                visible: product_qty[count] != 0,
                child: Padding(
                  padding: const EdgeInsets.only(right:3.0),
                  child: Text(
                    product_qty[count].toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: product_qty[count] != 0,
                child: IconButton(

                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.add,size: 16.0,),
                  onPressed: () async{

                    word.pquantity = product_qty[count] + 1;
                    await DatabaseHelper.instance.update(word,product_id[count].toString());
                    product_qty[count] = int.parse(await DatabaseHelper.instance.queryOne(a[count][productId_helper].toString()));
                    if (product_qty[count] > 1) {

                    }
                    print(await DatabaseHelper.instance.queryAll());
                    print('From add');
                    itemTotal = getItemTotal();
                    totalItemCount = getTotalItemCount();
                    setState(() {
                      if(baseAmount < itemTotal+delFee){
                        offerFlag = false;
                      }
                    });
                  },),
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
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0.5,
          ),
          body: _cartEmpty? Container(height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart,color: Colors.grey,),
                  SizedBox(width: MediaQuery.of(context).size.width*0.012,),
                  Text('Your cart is empty!',style: TextStyle(fontSize: 15.0),),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.015,),
              Text('Add items to it now.',style: TextStyle(color: Colors.grey,fontSize: 12.0),),
              SizedBox(height: MediaQuery.of(context).size.height*0.015,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.43,
                height: MediaQuery.of(context).size.height*0.05,
                child: RaisedButton(

                  color: Colors.deepOrange[400],
                  onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(),
                    ),
                  );
                },
                child: Text('CONTINUE',style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),),
          )

              :Container(
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
                      height: MediaQuery.of(context).size.height*0.01,
                    ),
                    Text('Order Summary',),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.01,
                    ),
                    Divider(thickness: 0.8,),
                    _isLoading ? Center(child: CircularProgressIndicator(),) : Container(
                      height: a.length >= 2 ? 130.0: 70.0,
                      child: ListView.builder(
                        itemCount: a.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pname[index],
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    Text(
                                      '\$'+(product_price[index]*product_qty[index]).toStringAsFixed(2),
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[600],
                                          height: 1.5),
                                    ),

                                    // Padding(
                                    //   padding: EdgeInsets.only(top:3.0),
                                    //   child: GestureDetector(
                                    //     onTap: (){
                                    //       setState(() {
                                    //
                                    //       });
                                    //       Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) => SingleProduct('http://newsteam.in/foodapp/uploads/fooditem/',product_qty[index].toString(),pname[index],'100',product_qty[index],'1')
                                    //         ),
                                    //       ).then(_onGoBack);
                                    //     },
                                    //     child: Text(
                                    //       'Customize',
                                    //       style: TextStyle(fontSize: 10.0,color: Colors.grey[600]),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),

                                size(index),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.012,),
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
                                  builder: (context) => Offers(true,(itemTotal+delFee))
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
                                  builder: (context) => Offers(true,(itemTotal+delFee))
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
                                  discount_percent = 0;
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
                          '\$'+itemTotal.toStringAsFixed(2),
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
                            '-\$'+(itemTotal*discount_percent/100).toString(),
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
                            '\$'+(itemTotal*discount_percent/100).toStringAsFixed(2),
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
                          '\$'+delFee.toString(),
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
                          '\$'+((itemTotal+delFee)-(itemTotal*discount_percent/100)).toStringAsFixed(2),
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
                            builder: (context) => SavedAddresses(false,true)  // 1.false coz not from manage address 2. true coz from cart or to cart
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
                child: _cartEmpty ? Text('') :Container(
                  height: MediaQuery.of(context).size.height*0.065,
                  //width: MediaQuery.of(context).size.width,
                  color: Colors.blue[900],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(
                      //   padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.012,),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         '\$ 17',
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 13.0,
                      //         ),
                      //       ),
                      //       Text(
                      //         'VIEW DETAILED BILL',
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 12.0,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Payments(totalItemCount,delFee,(itemTotal-appliedOfferPrice),(itemTotal-appliedOfferPrice),appliedOfferPrice)),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.065,
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              'PROCEED TO PAY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
