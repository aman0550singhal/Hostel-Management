import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../home_page.dart';

class ComplainForm extends StatefulWidget {
  @override
  _ComplainFormState createState() => _ComplainFormState();
}

class _ComplainFormState extends State<ComplainForm> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String complain_type,message;
  List<DropdownMenuItem<String>> items = [
    new DropdownMenuItem(
      child: new Text('Electricity'),
      value: 'Electricity',
    ),
    new DropdownMenuItem(
      child: new Text('Furniture'),
      value: 'Furniture',
    ),
    new DropdownMenuItem(
      child: new Text('Network'),
      value: 'Network',
    ),
    new DropdownMenuItem(
      child: new Text('Water'),
      value: 'Water',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Complain Form'),
      ),
      body: new SingleChildScrollView(
          child: new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _autovalidate,
              child: FormUI(),
            ),
          ),
        ),

    );
  }
  Widget FormUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Row(
          children: <Widget>[
            new DropdownButtonHideUnderline(
                child: new DropdownButton(
              items: items,
              hint: new Text('Select thpe of complain.'),
              value: complain_type,
              onChanged: (String val) {
                setState(() {
                  complain_type = val;
                });
              },
            ))
          ],
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Message'),
          onSaved: (val) {
            message = val;
          },
          validator: validateMessage,
          maxLines: 5,
          maxLength: 256,
        ),
        new RaisedButton(
          onPressed: _sendToServer,
          child: new Text('Send'),
        ),
      ],
    );
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var dataComplain = {
        "ComplainType": complain_type,
        "message": message,
      };
      ref.child('Complain').push().set(dataComplain).then((v) {
        _key.currentState.reset();
      });
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
  }
  String validateMessage(String val) {
    return val.length == 0 ? "Write Something" : null;
  }
}