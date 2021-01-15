import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';
import 'package:simplify/screens/products.dart';
import 'package:simplify/screens/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simplify/Local_db/database_helper.dart';

final String coin = 'imgs/coin.svg';
final Widget svg = SvgPicture.asset(coin, semanticsLabel: 'Coin Logo');

class SingleProduct extends StatefulWidget {
  String image;
  String category;
  String name;
  String coins;
  int count;
  String product_id;

  SingleProduct(this.image, this.category, this.name, this.coins, this.count,
      this.product_id);

  @override
  _SingleProductState createState() =>
      _SingleProductState(image, category, name, coins, count, product_id);
}

class _SingleProductState extends State<SingleProduct> {
  String image;
  String category;
  String name;
  String coins;
  int count;
  String product_id;

  _SingleProductState(this.image, this.category, this.name, this.coins,
      this.count, this.product_id);

  static var product;
  static var productPrice;
  static List<List<String>> extrasList;
  static var baked = 0;
  static var spice = 0;
  static var cheese = 0;
  static List<Map> extras;

  bool _isLoading = true;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    fetchDB();

    super.initState();
  }

  Future fetchDB() async {
    product = int.parse(
        await DatabaseHelper.instance.queryOne(product_id.toString()));
    productPrice = double.parse(
        await DatabaseHelper.instance.queryPrice(product_id.toString()));
    extras =
        await DatabaseHelper.instance.queryForExtras(product_id.toString());
    cheese = int.parse(extras[0][extraCheese]);
    baked = int.parse(extras[0][extraBaked]);
    spice = int.parse(extras[0][extraSpice]);

    print(productPrice);

    setState(() {
      _isLoading = false;
    });
  }

  void _onGoBack(dynamic value) {
    setState(() {});
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
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Stack(
                            children: [
                              // Image(
                              //   image: AssetImage(image),
                              // ),
                              Image.network(
                                image,
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
                                right:
                                    MediaQuery.of(context).size.width * 0.043,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.013),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          SvgPicture.asset(
                                            coin,
                                            height: 12.0,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01,
                                          ),
                                          Text(
                                            coins,
                                            style: TextStyle(
                                                color: Colors.grey[600]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.035,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.020,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$' +
                                            (productPrice * product)
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontSize: 18.0),
                                      ),
                                      size(count),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness:
                                MediaQuery.of(context).size.height * 0.023,
                            color: Colors.grey[200],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.043,
                                top: MediaQuery.of(context).size.width * 0.043,
                                right:
                                    MediaQuery.of(context).size.width * 0.043,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.013),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add Extra',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Extra Cheese',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Text(
                                            '\$'+(cheese*10.00).toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      extrasCheese(0),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Baked',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Text(
                                            '\$'+(baked*10.00).toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      extrasBaked(1),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Spice',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Text(
                                            '\$'+(spice*10.00).toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      extrasSpice(2),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
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
            onTap: () async {
              var count = await DatabaseHelper.instance.getCountForCart();
              if (count == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Cart(false, selectedAddress, 0, 0)),
                );
              } else {
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
    );
  }

  Container size(count) {
    Word word = Word();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
      ),
      child: SizedBox(
        height: 25.0,
        width: 75.0,
        child: Container(
          color: product == 0 ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: product != 0,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                      Icons.horizontal_rule,
                      size: 13.0,
                    ),
                    onPressed: () async {
                      word.pquantity = product - 1;
                      if(product>= 1) {
                        total_amount -= productPrice;
                      }
                      await DatabaseHelper.instance
                          .update(word, product_id.toString());
                      print(await DatabaseHelper.instance.queryAll());
                      print('From sub');
                      //total -= productPriceList[count];
                      product = int.parse(await DatabaseHelper.instance
                          .queryOne(product_id.toString()));
                      if(product == 0){
                        spice = 0;
                        baked = 0;
                        cheese = 0;
                        word.eSpice = spice.toString();
                        word.eBaked = baked.toString();
                        word.eCheese = cheese.toString();
                        await DatabaseHelper.instance.updateExtras(word, product_id.toString());
                        total_amount = (spice+product)*productPrice;
                        print(await DatabaseHelper.instance.queryAll());
                      }
                      setState(() {

                      });
                    }),
              ),
              Visibility(
                visible: product == 0,
                child: GestureDetector(
                  onTap: () async {
                    word.pquantity = product + 1;
                    total_amount += productPrice;
                    await DatabaseHelper.instance
                        .update(word, product_id.toString());
                    print(await DatabaseHelper.instance.queryAll());
                    product = int.parse(await DatabaseHelper.instance
                        .queryOne(product_id.toString()));
                    //total += productPriceList[count];
                    setState(() {});
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
                visible: product != 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    product.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: product != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.add,
                    size: 16.0,
                  ),
                  onPressed: () async {
                    total_amount += productPrice;
                    word.pquantity = product + 1;
                    await DatabaseHelper.instance
                        .update(word, product_id.toString());
                    product = int.parse(await DatabaseHelper.instance
                        .queryOne(product_id.toString()));
                    if (product > 1) {
                      //total += productPriceList[count];

                    }
                    print(await DatabaseHelper.instance.queryAll());
                    print('From add');
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container extrasCheese(count) {
    Word word = Word();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
      ),
      child: SizedBox(
        height: 25.0,
        width: 75.0,
        child: Container(
          color: cheese == 0 ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: cheese != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.horizontal_rule,
                    size: 13.0,
                  ),
                  onPressed: () async {

                    word.eSpice = spice.toString();
                    word.eBaked = baked.toString();
                    word.eCheese = (cheese - 1).toString();

                    total_amount -= productPrice;
                    await DatabaseHelper.instance
                        .updateExtras(word, product_id.toString());
                    print(await DatabaseHelper.instance.queryAll());
                    print('From Extra add');

                    cheese = int.parse(await DatabaseHelper.instance
                        .queryCheese(product_id.toString()));
                    setState(() {

                    });
                  },
                ),
              ),
              Visibility(
                visible: cheese == 0,
                child: GestureDetector(
                  onTap: () async {
                    if(product !=0 ){
                      word.eSpice = spice.toString();
                      word.eBaked = baked.toString();
                      word.eCheese = (1).toString();

                      total_amount += productPrice;
                      await DatabaseHelper.instance
                          .updateExtras(word, product_id.toString());
                      print(await DatabaseHelper.instance.queryAll());
                      print('From  add');

                      cheese = int.parse(await DatabaseHelper.instance
                          .queryCheese(product_id.toString()));
                    }


                    setState(() {});
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
                visible: cheese != 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    cheese.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: cheese != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.add,
                    size: 16.0,
                  ),
                  onPressed: () async {
                    word.eSpice = spice.toString();
                    word.eBaked = baked.toString();
                    word.eCheese = (cheese + 1).toString();

                    total_amount += productPrice;
                    await DatabaseHelper.instance
                        .updateExtras(word, product_id.toString());
                    print(await DatabaseHelper.instance.queryAll());
                    print('From Extra add');

                    cheese = int.parse(await DatabaseHelper.instance
                        .queryCheese(product_id.toString()));
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container extrasBaked(count) {
    Word word = Word();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
      ),
      child: SizedBox(
        height: 25.0,
        width: 75.0,
        child: Container(
          color: baked == 0 ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: baked != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.horizontal_rule,
                    size: 13.0,
                  ),
                  onPressed: () async {
                    word.eSpice = spice.toString();
                    word.eBaked = (baked - 1).toString();
                    word.eCheese = cheese.toString();

                    total_amount -= productPrice;
                    await DatabaseHelper.instance
                        .updateExtras(word, product_id.toString());
                    print(await DatabaseHelper.instance.queryAll());
                    print('From Extra add');

                    baked = int.parse(await DatabaseHelper.instance
                        .queryBaked(product_id.toString()));
                    setState(() {});
                  },
                ),
              ),
              Visibility(
                visible: baked == 0,
                child: GestureDetector(
                  onTap: () async {
                    if( product != 0){
                      word.eSpice = spice.toString();
                      word.eBaked = (baked + 1).toString();
                      word.eCheese = cheese.toString();

                      total_amount += productPrice;
                      await DatabaseHelper.instance
                          .updateExtras(word, product_id.toString());
                      print(await DatabaseHelper.instance.queryAll());
                      print('From add');

                      baked = int.parse(await DatabaseHelper.instance
                          .queryBaked(product_id.toString()));
                    }

                    setState(() {});
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
                visible: baked != 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    baked.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: baked != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.add,
                    size: 16.0,
                  ),
                  onPressed: () async {

                    word.eSpice = spice.toString();
                    word.eBaked = (baked + 1).toString();
                    word.eCheese = cheese.toString();

                    total_amount += productPrice;
                    await DatabaseHelper.instance
                        .updateExtras(word, product_id.toString());
                    print(await DatabaseHelper.instance.queryAll());
                    print('From Extra add');

                    baked = int.parse(await DatabaseHelper.instance
                        .queryBaked(product_id.toString()));

                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container extrasSpice(count) {
    Word word = Word();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]),
      ),
      child: SizedBox(
        height: 25.0,
        width: 75.0,
        child: Container(
          color: spice == 0 ? Colors.white : Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: spice != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.horizontal_rule,
                    size: 13.0,
                  ),
                  onPressed: () async {
                    word.eSpice = (spice - 1).toString();
                    word.eBaked = baked.toString();
                    word.eCheese = cheese.toString();

                    total_amount -= productPrice;
                    await DatabaseHelper.instance
                        .updateExtras(word, product_id.toString());
                    print(await DatabaseHelper.instance.queryAll());
                    print('From Extra sub');

                    spice = int.parse(await DatabaseHelper.instance
                        .querySpice(product_id.toString()));
                    setState(() {});
                  },
                ),
              ),
              Visibility(
                visible: spice == 0,
                child: GestureDetector(
                  onTap: () async {


                    total_amount += productPrice;
                    word.eSpice = (spice + 1).toString();
                    word.eBaked = baked.toString();
                    word.eCheese = cheese.toString();

                    await DatabaseHelper.instance
                        .updateExtras(word, product_id.toString());
                    print(await DatabaseHelper.instance.queryAll());
                    spice = int.parse(await DatabaseHelper.instance
                        .querySpice(product_id.toString()));
                    setState(() {});
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
                visible: spice != 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Text(
                    spice.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: spice != 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(
                    Icons.add,
                    size: 16.0,
                  ),
                  onPressed: () async {
                    word.eSpice = (spice + 1).toString();
                    word.eBaked = baked.toString();
                    word.eCheese = cheese.toString();

                    total_amount -= productPrice;
                    await DatabaseHelper.instance
                        .updateExtras(word, product_id.toString());
                    print(await DatabaseHelper.instance.queryAll());
                    print('From Extra add');

                    spice = int.parse(await DatabaseHelper.instance
                        .querySpice(product_id.toString()));

                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
