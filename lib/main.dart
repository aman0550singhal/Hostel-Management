import 'package:flutter/material.dart';
import 'login_page.dart';
import './signup_page.dart';
import './home_page.dart';
import './splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login-COER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: <String,WidgetBuilder>{
        '/landingpage' : (BuildContext context)=> MyApp(),
        '/signup' : (BuildContext context)=> SignupPage(),
        '/homePage' : (BuildContext context)=> HomePage(),
        '/splash' : (BuildContext context)=> SplashPage()
      },
    );
  }
}
