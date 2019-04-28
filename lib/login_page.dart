import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
      decoration: InputDecoration(
        hintText: 'CoerID/Username',
        hintStyle: new TextStyle(color: Colors.lightBlueAccent.shade100),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: (value){
        setState(() {
         _email=value; 
        });
      },
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: new TextStyle(color: Colors.lightBlueAccent.shade100),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: (value){
        setState(() {
         _password = value; 
        });
      },
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 47.0,
          onPressed: () {
            FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _email,
              password: _password
            ).then((FirebaseUser user){
              Navigator.of(context).popAndPushNamed('/splash');
            }).catchError((e){print(e);});
          },
          splashColor: Colors.redAccent,
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white,fontSize: 15.0)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Create New Account',
        style: TextStyle(color: Colors.lightBlueAccent.shade100,fontSize: 15.0,fontWeight: FontWeight.bold ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/signup');
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/background1.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 48.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                loginButton,
                forgotLabel
              ],
            ),
          ),
        ],
      ),
    );
  }     
}   