import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simplify/screens/products.dart';
import 'package:simplify/screens/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';


final String coin = 'imgs/coin.svg';
final Widget svg = SvgPicture.asset(
    coin,
    semanticsLabel: 'Coin Logo'
);


class SingleProduct extends StatefulWidget {
  String image;
  String category;
  String name;
  String coins;
  int count;

  SingleProduct(this.image,this.category,this.name,this.coins,this.count);
  @override
  _SingleProductState createState() => _SingleProductState(image,category,name,coins,count);
}

class _SingleProductState extends State<SingleProduct> {
  String image;
  String category;
  String name;
  String coins;
  int count;

  _SingleProductState(this.image,this.category,this.name,this.coins,this.count);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Builder(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.teal,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: AssetImage(image),
                        ),
                        Positioned(
                          top: 15.0,
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.043,
                          top: MediaQuery.of(context).size.width * 0.043,
                          right: MediaQuery.of(context).size.width * 0.043,
                          bottom: MediaQuery.of(context).size.width * 0.013),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      category,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          height: 1.5,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(coin,height: 12.0,),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                    Text(
                                      coins,
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.035,
                            ),
                            Text(
                              'Tuna,albacore and salmon sashimi with spicy sauce. We are passionate about producing delicious'
                              ', natural, exceptionally high-quality foods. We handcraft everything we make using original, authentic recipes.',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey[600],
                                  height: 1.25),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$'+c.priceList[count].toString()+'.00',
                                  style: TextStyle(
                                      color: Colors.blue[900], fontSize: 18.0),
                                ),
                                size(count),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: MediaQuery.of(context).size.height * 0.023,
                      color: Colors.grey[200],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.043,
                          top: MediaQuery.of(context).size.width * 0.043,
                          right: MediaQuery.of(context).size.width * 0.043,
                          bottom: MediaQuery.of(context).size.width * 0.013),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Extra',style: TextStyle(color: Colors.grey[600],fontSize: 17.0),),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Extra Cheese',style: TextStyle(fontSize: 16.0),),
                                    Text(
                                      '\$10.00',
                                      style: TextStyle(
                                          color: Colors.blue[900], fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                extrasSize(0),
                            ],),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Baked',style: TextStyle(fontSize: 16.0),),
                                    Text(
                                      '\$10.00',
                                      style: TextStyle(
                                          color: Colors.blue[900], fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                extrasSize(1),
                              ],),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.025,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Spice',style: TextStyle(fontSize: 16.0),),
                                    Text(
                                      '\$10.00',
                                      style: TextStyle(
                                          color: Colors.blue[900], fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                extrasSize(2),
                              ],),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(false,0),
                ),
              );
            },
            child: c.cartTotal(height,total)),
      ),
    );
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
                      total -= 10;
                      c.counList[count] = c.counList[count] - 1;
                      if (c.counList[count] >= 1) {
                        c.priceList[count] = c.priceList[count] - 10;
                      }
                      if (c.counList[count] <= 0) {
                        c.flagList[count] = true;
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
                      total += 10;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.orange[700]),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !c.flagList[count],
                child: Padding(
                  padding: const EdgeInsets.only(right: 3.0),
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
                      total += 10;
                      c.counList[count] = c.counList[count] + 1;
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

  Container extrasSize(count) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
      ),
      child: SizedBox(
        height: 25.0,
        width: 75.0,
        child: Container(
          color: c.extras_flag[count] ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: !c.extras_flag[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      total -= 10;
                      c.extras_counList[count] = c.extras_counList[count] - 1;
                      if (c.extras_counList[count] >= 1) {
                        c.extras_priceList[count] = c.extras_priceList[count] - 10;
                      }
                      if (c.extras_counList[count] <= 0) {
                        c.extras_flag[count] = true;
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
                visible: c.extras_flag[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      total += 10;
                      c.extras_counList[count] = c.extras_counList[count] + 1;
                      c.extras_flag[count] = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.orange[700]),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !c.extras_flag[count],
                child: Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    c.extras_counList[count].toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: !c.extras_flag[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      total += 10;
                      c.extras_counList[count] = c.extras_counList[count] + 1;
                      if (c.extras_counList[count] > 1) {
                        c.extras_priceList[count] = c.extras_priceList[count] + 10;
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

}
