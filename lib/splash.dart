import 'package:flutter/material.dart';
import 'dart:async';


class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _SplashPageState();

}


class _SplashPageState extends State<SplashPage> {


  static String tag = 'splash';


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),()=> Navigator.of(context).pushReplacementNamed('/homePage'));
  }

  @override
  Widget build(BuildContext context) {
    final alucard = new Hero(
      tag: 'hero',
      child: new Padding(
        padding: EdgeInsets.all(16.0),
        child: new CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: new AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final welcome = new Padding(
      padding: EdgeInsets.all(8.0),
      child: new Text(
        'Welcome Aman Singhal',
        style: new TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = new Padding(
      padding: EdgeInsets.all(8.0),
      child: new Text(
        'College of Engineering Roorkee, Outpass portal ,We are really happy to help you. For any bug or technical issue contact CARDINAL3301...!!!      Thanks...',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = new Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: new Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );

    return new Scaffold(
      body: body,
    );
  }
}