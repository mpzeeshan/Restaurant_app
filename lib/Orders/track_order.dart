import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Text('ORDER #567884323',style: TextStyle(color: Colors.black,fontSize: 15.0),),
               Text('03:33 PM | 2 Items,Rs 123',style: TextStyle(color: Colors.grey[600],fontSize: 11.0),),
          ],
        ),
    actions: [
      Center(
        child: GestureDetector(onTap: (){}, child: Padding(
          padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.04),
          child: Text('HELP',style: TextStyle(color: Colors.deepOrangeAccent),),
        ),),
      ),
    ],
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
    color: Colors.teal[700],
    child: SafeArea(
    child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.5869,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[300],
        ),
        Container(

          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01,bottom: MediaQuery.of(context).size.height*0.01),
                child: ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                    child: Column(
                      children: [
                        Image(image: AssetImage('imgs/trackOrder/slip.png',),height: 20.0,),
                        Padding(
                          padding: EdgeInsets.only(top:5.0),
                          child: Container(
                            height: 15.0,
                            width: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue[800],
                              ),
                            ),
                            child: Center(child: Text('WAIT',style: TextStyle(color: Colors.blue[800],fontSize: 8.0),)),
                          ),
                        )
                      ],
                    ),
                  ),
                  title: Text('Waiting for Restaurant to accept order',style: TextStyle(fontSize: 14.0, ),),
                ),
              ),
              Divider(thickness: 0.8,color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01,bottom: MediaQuery.of(context).size.height*0.01),
                child: ListTile(

                  leading: Padding(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                    child: Column(
                      children: [
                        Image(image: AssetImage('imgs/trackOrder/cooker.png'),height: 20.0,),
                        Padding(
                          padding: EdgeInsets.only(top:5.0),
                          child: Container(
                            height: 15.0,
                            width: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(child: Text('NEXT',style: TextStyle(color: Colors.grey,fontSize: 8.0),)),
                          ),
                        )
                      ],
                    ),
                  ),
                  title: Text('Waiting',style: TextStyle(fontSize: 12.0),),
                ),
              ),
              Divider(thickness: 0.8,color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01,bottom: MediaQuery.of(context).size.height*0.01 ),
                child: ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                    child: Column(
                      children: [
                        Image(image: AssetImage('imgs/trackOrder/scooter.png'),height: 20.0,),
                        Padding(
                          padding: EdgeInsets.only(top:5.0),
                          child: Container(
                            height: 15.0,
                            width: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(child: Text('...',style: TextStyle(color: Colors.grey,fontSize: 8.0),)),
                          ),
                        )
                      ],
                    ),
                  ),
                  title: Text('Waiting',style: TextStyle(fontSize: 12.0),),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
      ),
      ),

    );
  }
}
