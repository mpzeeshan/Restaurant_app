import 'package:flutter/material.dart';
import 'package:simplify/models/Address_model.dart';
import 'package:simplify/UserAccount/NewAddress.dart';
import 'package:simplify/screens/cart.dart';
import 'package:simplify/screens/home.dart';
import 'package:simplify/screens/products.dart';

AddressModel am = AddressModel();
int selectedAddress;

class SavedAddresses extends StatefulWidget {
  bool manageAddress;
  bool fromCart;

  SavedAddresses(this.manageAddress, this.fromCart);

  @override
  _SavedAddressesState createState() =>
      _SavedAddressesState(this.manageAddress, this.fromCart);
}

class _SavedAddressesState extends State<SavedAddresses> {
  bool fromCart;
  bool manageAddress;

  _SavedAddressesState(this.manageAddress, this.fromCart);

  List _selected = List<bool>.generate(am.place.length, (int index) => false);

  @override
  void initState() {
    selectedAddress = 0;
    super.initState();
  }

  void SelectAddress() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'SAVED ADDRESSES',
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
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    manageAddress ? 'Manage Addresses' : 'Select Address',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13.0),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        indent: MediaQuery.of(context).size.width * 0.1,
                        color: Colors.grey[400],
                        thickness: 0.9,
                      ),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  print(am.place.length);
                                  selectedAddress = index;
                                  for (int i = 0; i < am.place.length; i++) {
                                    if (index == i) {
                                      _selected[index] = !_selected[index];
                                      print(am.place.length);
                                      continue;
                                    } else {
                                      _selected[i] = false;
                                    }
                                  }
                                });
                              },
                              child: Icon(
                                am.addressIcons[index],
                                color: _selected[index]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: fromCart,
                                    child: GestureDetector(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            am.place[index],
                                            style: TextStyle(
                                                color: _selected[index]
                                                    ? Colors.green
                                                    : Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 1.0),
                                          ),
                                          SizedBox(height: 10.0),
                                          Text(
                                            am.location[index],
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 13.0,
                                                height: 1.3),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          print(am.place.length);
                                          selectedAddress = index;
                                          for (int i = 0;
                                              i < am.place.length;
                                              i++) {
                                            if (index == i) {
                                              _selected[index] =
                                                  !_selected[index];
                                              print(am.place.length);
                                              continue;
                                            } else {
                                              _selected[i] = false;
                                            }
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  Visibility(
                                    visible: !fromCart,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          am.place[index],
                                          style: TextStyle(
                                              color: _selected[index]
                                                  ? Colors.green
                                                  : Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 1.0),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          am.location[index],
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13.0,
                                              height: 1.3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          'Edit Address',
                                          style: TextStyle(
                                              color: Colors.deepOrangeAccent,
                                              fontSize: 15.0),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NewAddress()),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Colors.deepOrangeAccent,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: am.place.length,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        onPressed: () {
                          if (manageAddress == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewAddress()),
                            );
                          } else if (cartCount.length == 0) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 2), () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    );
                                  });
                                  return AlertDialog(
                                    title: Text(
                                      'Your cart is empty! :(',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  );
                                });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Cart(false, selectedAddress)),
                            );
                          }
                        },
                        child: Text(
                          manageAddress ? 'ADD NEW' : 'CART',
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.0,
                              fontSize: 16.0),
                        ),
                        color: Colors.green,
                      ),
                    ),
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
