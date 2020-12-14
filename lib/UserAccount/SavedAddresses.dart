import 'package:flutter/material.dart';
import 'package:simplify/models/Address_model.dart';
//import 'package:simplify/UserAccount/NewAddress.dart';

AddressModel am = AddressModel();

class SavedAddresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SAVED ADDRESSES',
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.teal[700],
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manage Addresses',
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
                            Icon(
                              am.addressIcons[index],
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    am.place[index],
                                    style: TextStyle(
                                        color: Colors.black,
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
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(
                                              color: Colors.deepOrangeAccent,
                                              fontSize: 15.0),
                                        ),
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
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => NewAddress()),
//                          );
                        },
                        child: Text(
                          'Add New Address',
                          style: TextStyle(color: Colors.white),
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
