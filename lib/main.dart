import 'package:flutter/material.dart';
import 'package:simplify/login/login.dart';
import 'package:get_it/get_it.dart';
import 'package:simplify/services/otp_service.dart';


void setupLocator(){
 GetIt.I.registerLazySingleton(() => OtpService());
}

void main() {
  runApp(App());
  setupLocator();
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
      theme: ThemeData(primaryColor: Colors.teal[700], fontFamily: 'sfpro'),
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}
