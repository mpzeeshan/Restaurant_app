import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplify/Orders/order_history.dart';
import 'package:simplify/login/login.dart';
import 'package:simplify/models/banner_model.dart';
import 'package:simplify/models/category_model.dart';
import 'package:simplify/models/commons.dart';
import 'package:simplify/screens/cart.dart';
import 'package:simplify/screens/products.dart';
import 'package:simplify/screens/offers.dart';
import 'package:simplify/screens/search.dart';
import 'package:simplify/UserAccount/more.dart';
import 'package:simplify/services/banner_service.dart';
import 'package:simplify/services/catergory_service.dart';

Commons h = Commons();


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Item {
  Item(this.name, this.icon);

  String name;
  Image icon;

  List<Item> restaurants = <Item>[
    Item(
        'KFC',
        Image(
          image: AssetImage('imgs/kfc.png'),
          height: 10.0,
        )),
    Item(
        'Burger King',
        Image(
          image: AssetImage('imgs/kfc.png'),
          height: 10.0,
        )),
  ];
}

class _HomeState extends State<Home> {
  //********************************** TOP DISHES ********************************************************//

  BannerService get serviceBanner => GetIt.I<BannerService>();
  CategoryService get serviceCategory => GetIt.I<CategoryService>();

  final List<String> textList = ['KFC', 'Burger King'];
  final List<String> imgList = ["imgs/kfc.png", "imgs/kfc.png"];

  bool _selected = false;
  bool _isLoading = true;
  bool _isLoadingBanner = false;
  bool _isLoadingCategory = false;

  BannerModel bannerModel;
  CategoryModel categoryModel;

  SharedPreferences sharedPreferences;

  String receivedImage;
  String errorMessage;
  String catErrorMessage;
  String bannerImage;
  String categoryImage;
  String bannerLink;
  String categoryLink;
  String _currentItemSelected;

  @override
  void initState() {

    _currentItemSelected = textList[0];

    checkLoginStatus();

    bannerService();
    categoryService();
    super.initState();
  }

  void bannerService() {
    setState(() {
      _isLoadingBanner = true;
    });
    serviceBanner.getBanners().then((response) {
      if (response.error) {
        errorMessage =
            response.errorMessage ?? 'An error occurred : from bannerService()';
      }
      bannerModel = response.data;
      bannerImage = bannerModel.data[0].image;
      bannerLink = 'https://newsteam.in/foodapp/uploads/banner/' + bannerImage;
      setState(() {
        _isLoadingBanner = false;
      });
    });
  }

  void categoryService() {
    setState(() {
      _isLoadingCategory = true;
    });
    serviceCategory.getCategories().then((response) {
      if (response.error) {
        catErrorMessage = response.errorMessage ??
            'An error occurred : from categoryservice()';
      }
      categoryModel = response.data;
      categoryImage = categoryModel.data[0].picFile;
      categoryLink = 'https://newsteam.in/foodapp/uploads/category/' + categoryImage;
      print('Category Link: '+categoryLink);
      setState(() {
        _isLoadingCategory = false;
      });
    });
  }

  checkLoginStatus() async {
    setState(() {
      _isLoading = true;
    });
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
      return false;
    } else {
      print(sharedPreferences.getString("token"));
    }
    setState(() {
      _isLoading = false;
    });
  }

  GestureDetector topDishes(image, category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Products(category),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image(
          //   height: MediaQuery.of(context).size.height * 0.145,
          //   image: AssetImage('$image'),
          // ),
          Image.network(categoryLink,height: MediaQuery.of(context).size.height*0.158,),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.005,
            ),
            child: Text(
              '$category',
              style: TextStyle(color: Colors.black, letterSpacing: 0.3),
            ),
          ),
        ],
      ),
    );
  } // TOP DISHES

  //********************************************************************************************************//

  //****************************************** ON OFFER*****************************************************//

  // ignore: non_constant_identifier_names
  Stack on_offer(image, one, two, three) {
    return Stack(
      children: [
        // Image(
        //   image: AssetImage('$image'),
        //   height: MediaQuery.of(context).size.height*0.221,
        // ),

        Image.network(
          bannerLink,
          height: MediaQuery.of(context).size.height * 0.221,
        ),
        Positioned(
            bottom: 0.0,
            child: Image(
                image: AssetImage('imgs/image_shado.png'),
                height: MediaQuery.of(context).size.height * 0.109)),
        Positioned(
          bottom: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h.offer(),
                Text(
                  "$one",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$two",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$three",
                    style: TextStyle(color: Colors.black, fontSize: 8.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //************************************************************************************************//

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Container(
            color: Colors.teal,
            child: SafeArea(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Center(
                        child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                    )))))
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                ThemeData(primaryColor: Colors.teal[700], fontFamily: 'Robot'),
            home: Builder(
              builder: (context) => Container(
                color: Colors.teal[700],
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.024,
                          top: 0.0,
                          right: MediaQuery.of(context).size.width * 0.024,
                          bottom: 0.0),
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.012),
                            child: Row(
                              children: [
                                // Icon(
                                //   Icons.menu,
                                //   color: Colors.black,
                                // ),
                                // SizedBox(
                                //   width: 10.0,
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage('imgs/kfc.png'),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.055,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PopupMenuButton<String>(
                                              itemBuilder: (context) {
                                                return textList.map((str) {
                                                  return PopupMenuItem(
                                                    value: str,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          str,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blue[900]),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList();
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    _currentItemSelected,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue[900],
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.7),
                                                  ),
                                                ],
                                              ),
                                              onSelected: (v) {
                                                setState(() {
                                                  print('!!!===== $v');
                                                  _currentItemSelected = v;
                                                  _selected = !_selected;
                                                });
                                              },
                                            ),
                                            Text(
                                              _selected
                                                  ? 'East Texas, #7 Wall street...'
                                                  : 'Tulsa, #1 This street...',
                                              style: TextStyle(fontSize: 11.0),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                            icon: Icon(Icons.arrow_right,color: Colors.blue[900],
                                          size: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.034,

                                        ), onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => More(),
                                            ),
                                          );
                                        }),

                                      ],
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.1),
                                    //   child: Text('East Texas, #7 Wall street...',style: TextStyle(fontSize: 11.0),),
                                    // ),
                                  ],
                                ),
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        onPressed: (){
                                        Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Search(),
                                              ),
                                            );
                                      },
                                      icon: Icon(Icons.search),
                                      ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.005,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.03),
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.221,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        _isLoadingBanner
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.teal),
                                              ))
                                            : on_offer(
                                                "imgs/image_home1.png",
                                                "45% OFF!",
                                                "COUPON 'STAR200'",
                                                "AMAYA FREN RESIDENCY VADODARA"),
                                        _isLoadingBanner
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.teal),
                                              ))
                                            : on_offer(
                                                "imgs/image_home2.png",
                                                "BREAKFAST AT",
                                                "50% OFF",
                                                "EXPLORE NOW"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.221,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        _isLoadingBanner
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.teal),
                                              ))
                                            : on_offer(
                                                "imgs/image_home3.png",
                                                "SANDWICH'S",
                                                "START FROM \$ 20",
                                                "EXPLORE NOW"),
                                        _isLoadingBanner
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.teal),
                                              ))
                                            : on_offer(
                                                "imgs/image_home4.png",
                                                "BREAKFAST AT",
                                                "50% OFF",
                                                "EXPLORE NOW"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Top Dishes',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Row(
                              //Top Dishes
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _isLoadingCategory
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.teal),
                                        )))
                                    : topDishes("imgs/four.jpeg", "Regular"),
                                _isLoadingCategory
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.teal),
                                        )))
                                    : topDishes(
                                        "imgs/pimgone.jpeg", "Beverages"),
//
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Row(
                              //Top Dishes
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _isLoadingCategory
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.teal),
                                        )))
                                    : topDishes("imgs/pchickenimg.jpeg",
                                        "Daily Special"),
                                _isLoadingCategory
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.teal),
                                        )))
                                    : topDishes("imgs/six.jpeg", "Lunch"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.03),
                            child: Row(
                              //Top Dishes
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _isLoadingCategory
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.teal),
                                        )))
                                    : topDishes("imgs/pchickenimg.jpeg",
                                        "Lunch Special"),
                                _isLoadingCategory
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.teal),
                                        )))
                                    : topDishes("imgs/six.jpeg", "Dinner"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: c.bottomNav(context,0),
                  ),
                ),
              ),
            ),
          );
  }
}

