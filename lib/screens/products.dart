
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:simplify/Local_db/database_helper.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';
import 'package:simplify/models/commons.dart';
import 'package:simplify/models/productsListing_model.dart';
import 'package:simplify/screens/cart.dart';
import 'package:simplify/screens/search.dart';
import 'package:simplify/screens/single_product_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simplify/services/productsListing_service.dart';

Commons c = Commons();
double total_amount = 00.00;
List<int> cartCount = [];



final String coin = 'imgs/coin.svg';
final Widget svg = SvgPicture.asset(coin, semanticsLabel: 'Coin Logo');

// ignore: must_be_immutable
class Products extends StatefulWidget {
  String receivedTitle;

  Products(this.receivedTitle);

  @override
  _ProductsState createState() => _ProductsState(this.receivedTitle);
}

class _ProductsState extends State<Products> {
  String receivedTitle;

  _ProductsState(this.receivedTitle);

  String errorMessage;
  static List<String> productLinkList;
  static List<String> productNameList;
  static List<String> productCategoryList;
  static List<int> productIdList;
  static List<int> productCountList;
  static List<double> productPriceList;
  static List<int> product ;



  bool _isLoadingProducts = false;

  ProductListingModel productListingModel;

  ProductListingService get serviceProductListing =>
      GetIt.I<ProductListingService>();

  @override
  void initState() {

    setState(() {
    });
    getProducts();
    
    super.initState();
  }

  //********** Method to fetch offers from the API ******************************************
  void getProducts() {
    setState(() {
      _isLoadingProducts = true;
    });
    print(_isLoadingProducts);
    serviceProductListing.getProducts().then((response) {
      if (response.error) {
        errorMessage = response.errorMessage ??
            'An error occurred : from getOfferService()';
      }
      productListingModel = response.data;
      productLinkList = List<String>.generate(productListingModel.data.length, (int index) => 'http://newsteam.in/foodapp/uploads/fooditem/' +
          productListingModel.data[index].productimage);
      productCategoryList = List<String>.generate(productListingModel.data.length, (index) => productListingModel.data[index].categoryname);
      productNameList = List<String>.generate(productListingModel.data.length, (index) => productListingModel.data[index].productName);
      productIdList = List<int>.generate(productListingModel.data.length, (index) => int.parse(productListingModel.data[index].productId));
      productPriceList = List<double>.generate(productListingModel.data.length, (index) => double.parse(productListingModel.data[index].price));
      productCountList = List<int>.generate(productListingModel.data.length, (index) => 0);
      product = List<int>.generate(productListingModel.data.length, (index) => 0);
      fillProductCount();

      //total_amount= getItemTotal();

      setState(() {
        _isLoadingProducts = false;
      });
    });
  }

  double getItemTotal(){
    double temp =0;
    print(product.length);
    for(int i=0; i<product.length;i++){
      print(productPriceList[i]);
      print('item Count'+product[i].toString());
      temp += productPriceList[i]*product[i];
    }
    return temp;
  }



  Future fillProductCount() async{
    for(int i=0;i<product.length;i++){
      product[i] = int.parse(await DatabaseHelper.instance.queryOne(productIdList[i].toString()));
      print(product[i]);

    }
    setState(() {
    });
    total_amount = getItemTotal();
  }

  //*******************************************************************************************

  //*********************** METHOD FOR INCREMENT AND DECREMENT BUTTON **********************************************//
  Container size(count) {
    Word word = Word();


    Future fillIn()async {

      var result = await DatabaseHelper.instance.getcount(productIdList[count].toString());
      print("count");
      print(result);

      if(result == 0){

        print('Count'+result.toString());
        word.pid = productIdList[count];
        word.pname = productNameList[count];
        word.pprice = productPriceList[count];
        word.pquantity = productCountList[count];
        word.eCheese = '0';
        word.eBaked = '0';
        word.eSpice = '0';
        word.total = 00.00;
        await DatabaseHelper.instance.insert(word);

        print('After count was found 0');
        print(await DatabaseHelper.instance.queryAll());
      }


    }

    fillIn();


    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
      ),
      child: SizedBox(
        height: 25.0,
        width: 75.0,
        child: Container(
          color: product[count] == 0 ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: product[count] != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.horizontal_rule,
                    size: 13.0,
                  ),
                  onPressed: () async{
                    word.pquantity = product[count] - 1;
                    await DatabaseHelper.instance.update(word,productIdList[count].toString());
                    print(await DatabaseHelper.instance.queryAll());
                    print('From sub');
                    product[count] = int.parse(await DatabaseHelper.instance.queryOne(productIdList[count].toString()));
                    setState(() {
                    total_amount = getItemTotal();
                    });
                  },
                ),
              ),
              Visibility(
                visible: product[count] == 0,
                child: GestureDetector(
                  onTap: () async{
                    word.pquantity = product[count] + 1;
                    await DatabaseHelper.instance.update(word,productIdList[count].toString());
                    print(await DatabaseHelper.instance.queryAll());
                    product[count] = int.parse(await DatabaseHelper.instance.queryOne(productIdList[count].toString()));
                    setState(() {
                      total_amount = getItemTotal();
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
                visible: product[count] != 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    //productCountList[count].toString(),
                      product[count].toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: product[count] != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.add,
                    size: 16.0,
                  ),
                  onPressed: () async{
                    word.pquantity = product[count] + 1;
                    await DatabaseHelper.instance.update(word,productIdList[count].toString());
                    product[count] = int.parse(await DatabaseHelper.instance.queryOne(productIdList[count].toString()));
                        if (product[count] > 1) {

                        }
                    print(await DatabaseHelper.instance.queryAll());
                        print('From add');
                    setState(() {
                      total_amount = getItemTotal();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //***************************************************************************************************************//
  void _onGoBack(dynamic value) {
    setState(() {
     fillProductCount();
    });
  }

  //****************************************METHOD FOR PRODUCTS****************************************************//

  Padding products(image, category, name, coins, count , product_id) {
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
                          MaterialPageRoute(
                              builder: (context) => SingleProduct(
                                  image, category, name, coins, count, product_id.toString()))).then(_onGoBack);
                },
                child: Image.network(
                  image,
                  height: MediaQuery.of(context).size.width * 0.35,
                ),
                // Image(
                //   height: MediaQuery.of(context).size.width * 0.31,
                //   image: AssetImage('$image'),
                // ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$category',
                      style: TextStyle(color: Colors.grey[500], fontSize: 11.0),
                    ),
                  ],
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
                  SvgPicture.asset(
                    coin,
                    height: 12.0,
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
                        '\$' +(productPriceList[count]*product[count]).toStringAsFixed(2),
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
    return Container(
      color: Colors.teal[700],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.024,
                  right: MediaQuery.of(context).size.width * 0.024,
                  bottom: MediaQuery.of(context).size.width * 0.015,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.0),
                  child: GestureDetector(
                    child: Container(
                      color: Colors.grey[100],
                      height: MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Search Restaurant / Dishes",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.black,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                  ),
                ),
              ),
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              receivedTitle.toUpperCase(),
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
          ),
          backgroundColor: Colors.white,
          body: _isLoadingProducts
              ? Center(
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),),
                )
              : Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.01,
                      top: 5.0,
                      right: MediaQuery.of(context).size.height * 0.01,
                      bottom: 10.0),
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (0.73),
                      controller: ScrollController(),
                      scrollDirection: Axis.vertical,
                      children: List.generate(productListingModel.data.length, (index) {  //productListingModel.data.length
                        // return products(productLink[0], c.catList[index],
                        //     c.pnameList[index], c.coinsList[index], index);
                        return products(productLinkList[index], productCategoryList[index],
                            productNameList[index], c.coinsList[index], index, productIdList[index]);
                      })),
                ),
          bottomNavigationBar: GestureDetector(
              onTap: () async{
                var count = await DatabaseHelper.instance.getCountForCart();
                if(count == 0){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Cart(false, selectedAddress, 0, 0)),);
                }else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedAddresses(false, true),
                    ),
                  ).then(_onGoBack);
                }
              },
              child: c.cartTotal(height, total_amount)),
        ),
      ),
    );
  }
}
