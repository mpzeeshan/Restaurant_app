import 'package:flutter/material.dart';
import 'package:simplify/models/search_model.dart';
import 'package:simplify/models/commons.dart';


SearchModels s = SearchModels();
final List<String> recentOrdersImage = [
  "imgs/myAccount/pavbhaji.png",
  "imgs/myAccount/chana_img.png",
  "imgs/myAccount/pavbhaji.png",
  "imgs/myAccount/chana_img.png",
];

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //bool isTextFiledFocus = false;
  Commons _commons = Commons();
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
                            IconButton(
                              icon: Icon(Icons.search),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Search Restaurant / Dishes",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    'RECENT SEARCH',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.3,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[400],
                      ),
                      itemCount: s.recentSearch.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Row(
                          children: [
                            Image(image: AssetImage(recentOrdersImage[index]),height: MediaQuery.of(context).size.height*0.04,),
                            SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                            Text(
                              s.recentSearch[index],
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        leading: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _commons.bottomNav(context, 0),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
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

    final suggestionList = query.isEmpty
        ? s.recentSearch
        : s.suggestionList
            .where((p) => p.startsWith(query.toLowerCase()))
            .toList();

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey[400],
      ),
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        // trailing: Image(image: AssetImage('imgs/myAccount/chana_img.png'),height: MediaQuery.of(context).size.height*0.04,),
        title: Row(
          children: [
            Image(image: AssetImage(recentOrdersImage[index]),height: MediaQuery.of(context).size.height*0.04,),
            SizedBox(width: MediaQuery.of(context).size.width*0.05,),
            RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(color: Colors.grey[800],fontSize: 16.0 ),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
        leading: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
