import 'package:flutter/material.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';
import 'package:simplify/models/commons.dart';
import 'package:simplify/screens/home.dart';
import 'package:simplify/screens/cart.dart';
import 'package:simplify/screens/single_product_view.dart';

Commons c = Commons();


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //*********************** METHOD FOR INCREMENT AND DECREMENT BUTTON **********************************************//

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
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
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

  //***************************************************************************************************************//

  //****************************************METHOD FOR PRODUCTS****************************************************//

  Padding products(image, category, name, coins, count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        //Top Dishes
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SingleProduct()),
                  );
                },
                child: Image(
                  height: MediaQuery.of(context).size.width * 0.31,
                  image: AssetImage('$image'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Text(
                  '$category',
                  style: TextStyle(color: Colors.grey[500], fontSize: 11.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.005,
                    bottom: MediaQuery.of(context).size.height * 0.005),
                child: Text(
                  '$name',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.015,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.yellow[600],
                      size: MediaQuery.of(context).size.width * 0.025,
                    ),
                  ),
                  Text(
                    ' $coins',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13.0,
                    ),
                  )
                ],
              ),
              Padding(
                ///////444444444444444
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$'+ c.priceList[count].toString()+'.00',
                        style: TextStyle(
                            color: Colors.blue[900], letterSpacing: -0.3),
                      ),
                      size(count),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //**************************************************************************************************************************************

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return  DefaultTabController(
        length: 3,
        child: Container(
          color: Colors.teal[700],
          child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                    indicatorPadding: EdgeInsets.all(4.0),
                    unselectedLabelColor: Colors.grey[600],

                    indicatorColor: Colors.blue[900],
                    labelColor: Colors.white,
                    indicator: BoxDecoration(

                    gradient: LinearGradient(
                    colors: [Colors.blue[900], Colors.blue[900]]),

                    ),
                    tabs: [
                      Tab(text: 'Vegetarian',),
                      Tab(text: 'Non-Vegetarian',),
                      Tab(text: 'Under \$ 15',),
                    ],
                  ),
                  leading: GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home()),
                      );
                    },

                  ),
                  title: Text(
                    ' Single Serve Meals. Free Delivery.',
                    style: TextStyle(
                        color: Colors.black, fontSize: 16.0),
                  ),
                ),
                backgroundColor: Colors.white,
                body: TabBarView(children : [
                  Padding(
                    padding: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01,top: 0.0,right: MediaQuery.of(context).size.height*0.01,bottom: 0.0),
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (0.73),
                        controller: ScrollController(),
                        scrollDirection: Axis.vertical,
                        children:
                        List.generate(c.imageList.length, (index) {
                          return products(
                              c.imageList[index],
                              c.catList[index],
                              c.pnameList[index],
                              c.coinsList[index],
                              index);
                        })),
                  ),
                  Center(child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.teal,
                    ),
                  )),
                  Center(child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.teal,

                    ),
                  )),
                ]),

                bottomNavigationBar: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SavedAddresses(),
                        ),
                      );
                    },
                    child: c.cartTotal(height)),
              ),

          ),
        ),
      );
  }
}
