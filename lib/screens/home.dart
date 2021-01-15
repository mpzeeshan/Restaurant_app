import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplify/login/login.dart';
import 'package:simplify/models/banner_model.dart';
import 'package:simplify/models/category_model.dart';
import 'package:simplify/models/commons.dart';
import 'package:simplify/screens/products.dart';
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

  final List<String> textList = [ 'Burger King','KFC'];
  final List<String> imgList = ["imgs/kfc.png", "imgs/kfc.png"];

  bool _selected = false;
  bool _isLoading = true;
  bool _isLoadingBanner = false;
  bool _isLoadingCategory = false;

  BannerModel bannerModel;
  CategoryModel categoryModel;

  SharedPreferences sharedPreferences;


  String errorMessage;
  String catErrorMessage;
  static List<String> bannerImage;
  static List<String> categoryImage;
  static List<String> bannerLink;
  static List<String> categoryLink;
  static List<String> bannerTitle;
  static List<String> categoryTitle;
  static List<int> a;
  static List<int> b;


  String _currentItemSelected;

  @override
  void initState() {

    _currentItemSelected = textList[0];

    checkLoginStatus();

    bannerService();
    categoryService();
    super.initState();
  }

  void bannerService() async{
    setState(() {
      _isLoadingBanner = true;
    });
    await serviceBanner.getBanners().then((response) async{
      if (response.error) {
        errorMessage =
            response.errorMessage ?? 'An error occurred : from bannerService()';
      }

      bannerModel = response.data;
      a = await List<int>.generate(bannerModel.data.length, (index) => 0);
      bannerImage = List<String>.generate(bannerModel.data.length, (index) => '');
      bannerTitle = List<String>.generate(bannerModel.data.length, (index) => '');
      bannerLink  = List<String>.generate(bannerModel.data.length, (index) => '');
      print('banner Model length'+bannerModel.data.length.toString() );
      for(int i=0;i< a.length; i++){
        bannerImage[i] = bannerModel.data[i].image;
        bannerLink[i] = 'https://newsteam.in/foodapp/uploads/banner/' + bannerImage[i];
        bannerTitle[i] = bannerModel.data[i].title;
      }

      setState(() {
        _isLoadingBanner = false;
      });
    });
  }

  void categoryService() async{
    // setState(() {
    //   _isLoadingCategory = true;
    // });
    serviceCategory.getCategories().then((response) async{
      if (response.error) {
        catErrorMessage = response.errorMessage ??
            'An error occurred : from categoryservice()';
      }
      categoryModel = response.data;
      categoryTitle =  List<String>.generate(bannerModel.data.length, (index) => '');
      categoryLink  = List<String>.generate(bannerModel.data.length, (index) => '');
      categoryImage =List<String>.generate(bannerModel.data.length, (index) => '');
      for(int i=0;i< categoryModel.data.length; i++){
        categoryImage[i] = categoryModel.data[i].picFile;
        categoryLink[i] = 'https://newsteam.in/foodapp/uploads/category/' + categoryImage[i];
        categoryTitle[i] = categoryModel.data[i].cateName;
      }
      setState(() {
        _isLoading = false;
      });
      // categoryImage = categoryModel.data[0].picFile;
      // categoryLink = 'https://newsteam.in/foodapp/uploads/category/' + categoryImage;
      // print('Category Link: '+categoryLink);

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
  }

  GestureDetector topDishes(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Products(categoryTitle[index]),
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
          Image.network(categoryLink[index],height: MediaQuery.of(context).size.height*0.158,),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.005,
            ),
            child: Text(
              categoryTitle[index],
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
  Stack on_offer(index, explore) {
    return Stack(
      children: [
        // Image(
        //   image: AssetImage('$image'),
        //   height: MediaQuery.of(context).size.height*0.221,
        // ),

        Image.network(
          bannerLink[index],
          height: MediaQuery.of(context).size.height * 0.23,
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
                // Text(
                //   "$one",
                //   style: TextStyle(
                //       color: Colors.black, fontWeight: FontWeight.bold),
                // ),
                Text(
                  bannerTitle[index],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$explore",
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
            home:  Container(
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
                                IconButton(

                                    icon: Icon(Icons.menu,color: Colors.blue[900],),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => More(),
                                          ),
                                        );
                                      }),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left:6.0,right: 3.0),
                                          child: Image(
                                            image: AssetImage('imgs/burger_king.png'),
                                            height: 25.0,
                                          ),
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
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Container(height: MediaQuery.of(context).size.height*0.03,
                                                        child: Image(image:AssetImage('imgs/burger_king.png')),
                                                        ),
                                                        Padding(padding: EdgeInsets.all(10.0),
                                                        child: Column(
                                                          children: [
                                                            Text('Burger King'),
                                                            Text('# 7 This street tulsa',style: TextStyle(fontSize: 10.0,color: Colors.grey),),
                                                          ],
                                                        ),
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
                                 height: MediaQuery.of(context).size.height*0.445,
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  childAspectRatio: (1.0),
                                  controller: ScrollController(),
                                  scrollDirection: Axis.vertical,
                                  children: List.generate(bannerModel.data.length, (index) {  //productListingModel.data.length
                                    // return products(productLink[0], c.catList[index],
                                    //     c.pnameList[index], c.coinsList[index], index);
                                    return _isLoading? Center(child:
                                      CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                                      ),
                                      )
                                        :on_offer( index, 'EXPLORE NOW');
                                  })),

                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01,bottom: MediaQuery.of(context).size.height*0.02),
                            child: Text(
                              'Top Dishes',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.441,
                            child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: (0.71),
                                controller: ScrollController(),
                                scrollDirection: Axis.vertical,
                                children: List.generate(categoryModel.data.length, (index) {  //productListingModel.data.length
                                  return _isLoading? Center(child:
                                      CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)))
                                  : topDishes(index);
                                })),
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: c.bottomNav(context,0),
                  ),
                ),
              ),

          );
  }
}

