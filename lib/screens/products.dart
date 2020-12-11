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
          color: c.flag_list[count] ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: !c.flag_list[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      c.coun_list[count] = c.coun_list[count] - 1;
                      if (c.coun_list[count] >= 1) {
                        c.price_list[count] = c.price_list[count] - 10;
                      }
                      if (c.coun_list[count] <= 0) {
                        c.flag_list[count] = true;
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
                visible: c.flag_list[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      c.coun_list[count] = c.coun_list[count] + 1;
                      c.flag_list[count] = false;
                    });
                  },
                  child: Text(
                    '+ Add',
                    style: TextStyle(color: Colors.orange[700]),
                  ),
                ),
              ),
              Visibility(
                visible: !c.flag_list[count],
                child: Text(
                  c.coun_list[count].toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Visibility(
                visible: !c.flag_list[count],
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      c.coun_list[count] = c.coun_list[count] + 1;
                      if (c.coun_list[count] > 1) {
                        c.price_list[count] = c.price_list[count] + 10;
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
      padding: const EdgeInsets.only(bottom: 55.0),
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
                  height: 119.0,
                  image: AssetImage('$image'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '$category',
                  style: TextStyle(color: Colors.grey[500], fontSize: 11.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Text(
                  '$name',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 7.5,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.yellow[600],
                      size: 15.0,
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
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ' + c.price_list[count].toString(),
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
                padding: const EdgeInsets.only(
                    left: 10.0, top: 15.0, right: 10.0, bottom: 0.0),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
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
                                        color: Colors.black, fontSize: 17.0),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7.0),
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
                                          horizontal: 18.0, vertical: 0.0),
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
                                    padding: const EdgeInsets.only(left: 7.0),
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
                                          horizontal: 20.0, vertical: 0.0),
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
                                    padding: const EdgeInsets.only(left: 7.0),
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
                                          horizontal: 20.0, vertical: 0.0),
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
                            childAspectRatio: (0.68),
                            controller: ScrollController(),
                            scrollDirection: Axis.vertical,
                            children:
                                List.generate(c.image_list.length, (index) {
                              return products(
                                  c.image_list[index],
                                  c.cat_list[index],
                                  c.pname_list[index],
                                  c.coins_list[index],
                                  index);
                            })),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: GestureDetector(
                  onTap: (){
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
