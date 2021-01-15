import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:simplify/screens/cart.dart';
import 'package:simplify/UserAccount/SavedAddresses.dart';
import 'package:simplify/models/offers_model.dart';
import 'package:simplify/services/checkCoupon_service.dart';
import 'package:simplify/services/offers_service.dart';

String appliedOffer;
double appliedOfferPrice = 0;

class Offers extends StatefulWidget {
  bool received; // variable to check if the page was triggered from cart
  double amount;

  Offers(this.received, this.amount);

  @override
  _OffersState createState() => _OffersState(this.received, this.amount);
}

class _OffersState extends State<Offers> {
  bool received;
  double amount;

  _OffersState(this.received, this.amount);

  CheckCouponService get serviceCheckCoupon => GetIt.I<CheckCouponService>();

  OffersService get serviceOffers => GetIt.I<OffersService>();

  int selectedRadioTile;

  String errorMessage;
  String receivedOfferName;
  int selected_value;

  bool _isLoadingOffers = false;

  OffersModel offersModel;

  // **************************** init() *******************
  @override
  void initState() {
    getOffer();
    super.initState();
  }

  // *******************************************************

  Future checkCoupon(val) async {
    String response;
    response = await serviceCheckCoupon.checkCoupon(
        offersModel.data[val].code.toString(), amount.toString());
    return response;
  }

  //********** Method to fetch offers from the API ******************************************
  void getOffer() {
    setState(() {
      _isLoadingOffers = true;
    });
    serviceOffers.getOffers().then((response) {
      if (response.error) {
        errorMessage = response.errorMessage ??
            'An error occurred : from getOfferService()';
      }
      offersModel = response.data;
      setState(() {
        _isLoadingOffers = false;
      });
    });
  }

  //*******************************************************************************************

  //****** Method that sets selected Offer Name to be passed to the cart page *****************
  setSelectedRadioTile(int val) {
    appliedOffer = offersModel.data[val].code;
    appliedOfferPrice = offerPrice[val];
    selected_value = val;
    setState(() {
      selectedRadioTile = val;
    });
  }

  //*******************************************************************

  //List<String> offerName = ['OFF50', 'DINNER20', 'BF40'];
  List<double> offerPrice = [5.06, 7.03];
  List<String> offerDesc = [
    'This is a dummy text, this area will be used to describe the offer and its validity',
    'This is a dummy text this area will be used to describe the offer and its validity',
    'This is a dummy text this area will be used to describe the offer and its validity'
  ];

  Column availableOffers(image) {
    return Column(
      children: [
        Stack(
          children: [
            Image(
              width: MediaQuery.of(context).size.width,
              image: AssetImage(image),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.012,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        _isLoadingOffers
            ? Container(
                height: MediaQuery.of(context).size.height * 0.635,
                child: Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)),
                ))
            : Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.635,
                    child: ListView.builder(
                      itemCount: offersModel.data.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.91,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                    visible: index == 0,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Offers',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        ),
                                      ],
                                    )),
                                Visibility(
                                  visible: index > 0,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015,
                                  ),
                                ),
                                Visibility(
                                  visible: received == false,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.teal[500],
                                            Colors.green[200]
                                          ]),
                                        ),
                                        child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.043,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: Center(
                                                child: Text(
                                              offersModel.data[index].code,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Text(
                                        offerDesc[index],
                                        style:
                                            TextStyle(color: Colors.grey[500]),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: received == true,
                                  child: RadioListTile(
                                    value: index,
                                    groupValue: selectedRadioTile,
                                    title: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Colors.teal[500],
                                              Colors.green[200]
                                            ]),
                                          ),
                                          child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.043,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              child: Center(
                                                  child: Text(
                                                offersModel.data[index].code,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))),
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015,
                                        ),
                                        Text(
                                          offerDesc[index],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    onChanged: (val) {
                                      print("pressed offer: $val");
                                      setSelectedRadioTile(val);
                                    },
                                    activeColor: Colors.teal,
                                  ),
                                ),
                                Divider(
                                  thickness: 0.7,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        Visibility(
          visible: received == true,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 46.0,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    child: Center(
                        child: Text(
                      'PROCEED',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontSize: 17.0),
                    )),
                    onPressed: () {
                      if(selected_value != null){
                        checkCoupon(selected_value).then((response) {
                          if (response == "TRUE") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cart(
                                    true,
                                    selectedAddress,
                                    int.parse(offersModel
                                        .data[selected_value].discpercent),
                                    double.parse(offersModel
                                        .data[selected_value].baseamount)),
                              ),
                            );
                          } else if (response == "FALSE") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 1), () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      'Offer Cannot be Applied!',
                                      style: TextStyle(
                                          fontSize: 15.0,),
                                    ),
                                  );
                                });
                          } else if (response == "API response error") {
                            print("Server Error");
                          }
                        });
                      }else{
                        showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.of(context).pop(true);
                              });
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  'Select offer to proceed',
                                  style: TextStyle(
                                      fontSize: 15.0,),
                                ),
                              );
                            });
                      }

                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal[700], fontFamily: 'Robot'),
      home: Container(
        color: Colors.teal[700],
        child: Builder(
          builder: (context) => SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: availableOffers('imgs/snack_img.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
