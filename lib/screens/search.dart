import 'package:flutter/material.dart';
import 'package:simplify/models/search_model.dart';
import 'package:simplify/screens/offers.dart';
import 'package:simplify/screens/products.dart';
import 'package:simplify/screens/home.dart';

SearchModels s = SearchModels();

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  //bool isTextFiledFocus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),

                    child: GestureDetector(
                      child: Container(
                        color: Colors.grey[200],
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton( icon: Icon(Icons.search), color: Colors.black, onPressed: (){},),
                            SizedBox(width: 5.0,),
                            Text("Search Restaurant / Cafe",style: TextStyle(color: Colors.grey, fontSize: 15.0),),

                          ],
                        ),
                      ),
                      onTap: (){
                        showSearch(context: context, delegate: DataSearch());
                      },
                    ),
                  ),
                  SizedBox(height: 35.0,),
                  Text('RECENT SEARCH',style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,letterSpacing: 1.0),),
                  SizedBox(height: 20.0,),
                  Divider(height: 1.0,thickness: 1.3, color: Colors.black,),
                  SizedBox(height: 5.0,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(color: Colors.grey[400],),
                itemCount: s.recent_search.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(s.recent_search[index],style: TextStyle(color: Colors.grey[600]),),
                  leading: Icon(Icons.search, color: Colors.black,),
                ),
              ),
            ),

                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Offers()),
              );
              break;

            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Products()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
              break;
          }

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            title: Text(
              'Offers',
              style: TextStyle(
                color: Colors.black, ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(
              'Search',
              style: TextStyle(
                color: Colors.black,),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            title: Text(
              'Cart',
              style: TextStyle(
                color: Colors.black,),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text(
              'More',
              style: TextStyle(
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon : AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Card();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final SuggestionList = query.isEmpty
        ? s.recent_search
        : s.suggestion_list.where((p) => p.startsWith(query.toLowerCase())).toList();

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(color: Colors.grey[400],),
      itemCount: SuggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        title: RichText(text: TextSpan(
          text: SuggestionList[index].substring(0,query.length),
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          children: [TextSpan(
            text: SuggestionList[index].substring(query.length),
            style: TextStyle(color: Colors.grey),
          )],
        ),),
        leading: Icon(Icons.search, color: Colors.black,),
      ),
    );
  }

}

