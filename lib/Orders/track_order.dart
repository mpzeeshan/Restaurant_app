import 'package:flutter/material.dart';
import 'package:simplify/UserAccount/help.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.teal,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.5,
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ORDER #567884323',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  Text(
                    '03:33 PM | 2 Items,Rs 123',
                    style: TextStyle(color: Colors.grey[600], fontSize: 11.0),
                  ),
                ],
              ),
              actions: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Help(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.04),
                      child: Text(
                        'HELP',
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ),
                ),
              ],
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Icon(
                                  Icons.list_alt,
                                  size: 30.0,
                                  color: Colors.blue[900],
                                ), //Image(image: AssetImage('imgs/trackOrder/slip.png',),height: 20.0,),
                              ),
                              title: Text(
                                'Waiting for Restaurant to accept order',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.8,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Icon(
                                  Icons.outdoor_grill,
                                  size: 30.0,
                                  color: Colors.black,
                                ), //Image(image: AssetImage('imgs/trackOrder/cooker.png'),height: 20.0,),
                              ),
                              title: Text(
                                'Food is being prepared',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.8,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Icon(
                                  Icons.moped,
                                  size: 30.0,
                                  color: Colors.black,
                                ), //Image(image: AssetImage('imgs/trackOrder/scooter.png'),height: 20.0,),
                              ),
                              title: Text(
                                'Order on the way',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.8,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: ListTile(
                              leading: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Icon(
                                  Icons.check_circle,
                                  size: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                              title: Text(
                                'Delivered',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: RaisedButton(
                                color: Colors.deepOrangeAccent,
                                child: Center(
                                    child: Text(
                                  'CANCEL ORDER',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.0,
                                      fontSize: 17.0),
                                )),
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                            ),
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
      ),
    );
  }
}
