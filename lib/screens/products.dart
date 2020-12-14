import 'package:flutter/material.dart';
import 'package:simplify/models/commons.dart';
import 'package:simplify/screens/home.dart';
import 'package:simplify/screens/cart.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  child: Text(
                    '-',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                  child: Text(
                    '+ Add',
                    style: TextStyle(color: Colors.orange[700]),
                  ),
                ),
              ),
              Visibility(
                visible: !c.flagList[count],
                child: Text(
                  c.counList[count].toString(),
                  style: TextStyle(color: Colors.black),
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
                  child: Text(
                    '+',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  height: MediaQuery.of(context).size.width*0.3,
                  image: AssetImage('$image'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01),
                child: Text(
                  '$category',
                  style: TextStyle(color: Colors.grey[500], fontSize: 11.0),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.005, bottom: MediaQuery.of(context).size.height*0.005),
                child: Text(
                  '$name',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width*0.015,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.yellow[600],
                      size: MediaQuery.of(context).size.width*0.025,
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
              Padding(  ///////444444444444444
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ' + c.priceList[count].toString(),
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
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueGrey[900], fontFamily: 'Robot'),
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.teal[700],
        child: SafeArea(
          child: Builder(
            builder: (context) => Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding:  EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.03, top: 15.0, right: MediaQuery.of(context).size.width*0.03, bottom: 0.0),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
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
                                  Text(
                                    ' Single Serve Meals. Free Delivery.',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),
                                    child: FlatButton(
                                      onPressed: () {
                                        print("Vegetarian");
                                        setState(() {
                                          c.pressed_1 = !c.pressed_1;
                                          c.pressed_2 = false;
                                          c.pressed_3 = false;
                                        });
                                      },
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width*0.04, vertical: 0.0),
                                      color: c.pressed_1
                                          ? Colors.blue[900]
                                          : Colors.white,
                                      textColor: c.pressed_1
                                          ? Colors.white
                                          : Colors.grey[500],
                                      child: Text(
                                        "Vegetarian",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      shape: new RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: c.pressed_1
                                                ? Colors.blue[900]
                                                : Colors.grey[300]),
                                        borderRadius:
                                            new BorderRadius.circular(0.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.014),
                                    child: FlatButton(
                                      onPressed: () {
                                        print("Non-Vegetarian");
                                        setState(() {
                                          c.pressed_2 = !c.pressed_2;
                                          c.pressed_1 = false;
                                          c.pressed_3 = false;
                                        });
                                      },
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width*0.04, vertical: 0.0),
                                      color: c.pressed_2
                                          ? Colors.blue[900]
                                          : Colors.white,
                                      textColor: c.pressed_2
                                          ? Colors.white
                                          : Colors.grey[500],
                                      child: Text(
                                        "Non-Vegetarian",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      shape: new RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: c.pressed_2
                                                ? Colors.blue[900]
                                                : Colors.grey[300]),
                                        borderRadius:
                                            new BorderRadius.circular(0.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.014),
                                    child: FlatButton(
                                      onPressed: () {
                                        print("Under \$15");
                                        setState(() {
                                          c.pressed_3 = !c.pressed_3;
                                          c.pressed_2 = false;
                                          c.pressed_1 = false;
                                        });
                                      },
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width*0.03, vertical: 0.0),
                                      color: c.pressed_3
                                          ? Colors.blue[900]
                                          : Colors.white,
                                      textColor: c.pressed_3
                                          ? Colors.white
                                          : Colors.grey[500],
                                      child: Text(
                                        "Under \$15",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      shape: new RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: c.pressed_3
                                                ? Colors.blue[900]
                                                : Colors.grey[300]),
                                        borderRadius:
                                            new BorderRadius.circular(0.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ), //SwitchTabs
                          ],
                        ),
                      ),
                      //product scroll view
                      Expanded(
                        child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: (0.65),
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
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(),
                      ),
                    );
                  },
                  child: c.cartTotal()),
            ),
          ),
        ),
      ),
    );
  }
}
