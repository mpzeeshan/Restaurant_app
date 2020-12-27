import 'package:flutter/material.dart';

class GiftCard extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<GiftCard> {
  TextEditingController amount = TextEditingController();
  var _rupees = '2000';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[700],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.8,
            backgroundColor: Colors.white,
            title: Text(
              'GIFT CARD',
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.83,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                  child: Card(
                    color: Colors.green[50],
                    shadowColor: Colors.grey,
                    elevation: 6.0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          'Kushiyu Gift Card',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.08,
                                right:
                                    MediaQuery.of(context).size.width * 0.08),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Rs ' + _rupees,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                VerticalDivider(
                                  endIndent: 1.0,
                                  thickness: 0.6,
                                  color: Colors.teal,
                                ),
                                Text(
                                  'Add now',
                                  style: TextStyle(
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 0.6,
                          color: Colors.teal,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: Center(
                              child: Text(
                            'Hope you enjoy this Kushiyu Gift Card!',
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                          color: Colors.green[200],
                          child: Center(
                            child: Text('2000'),
                          ),
                          onPressed: () {
                            setState(() {
                              _rupees = '2000';
                            });
                          }),
                      RaisedButton(
                          color: Colors.green[200],
                          child: Center(
                            child: Text('500'),
                          ),
                          onPressed: () {
                            setState(() {
                              _rupees = '500';
                            });
                          }),
                      RaisedButton(
                          color: Colors.green[200],
                          child: Center(
                            child: Text('1000'),
                          ),
                          onPressed: () {
                            setState(() {
                              _rupees = '1000';
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RaisedButton(
                          color: Colors.green[200],
                          child: Center(
                            child: Text('3000'),
                          ),
                          onPressed: () {
                            setState(() {
                              _rupees = '3000';
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
