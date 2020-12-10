import 'package:flutter/material.dart';
import 'package:simplify/screens/login.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.teal[700], fontFamily: 'Robot'),
        home: Login(),
    );
  }
}
