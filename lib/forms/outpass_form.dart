import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home_page.dart';


class OutpassForm extends StatefulWidget {
  @override
  _OutpassFormState createState() => _OutpassFormState();
}

class _OutpassFormState extends State<OutpassForm> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String outpassName,outpassDate,outpassDepartureTime,outpassInTime,outpassAddress;
  int count =0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Outpass Form'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _autovalidate,
              child: formUI(),
            ),
          ),
        ),
    );
  }

  Widget formUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new TextField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your first and last name',
                        labelText: 'Name',
                      ),
                      onChanged: (value){
                        this.outpassName = value;
                      },
                    ),
                    new TextField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter the date',
                        labelText: 'Date',
                      ),
                      keyboardType: TextInputType.datetime,
                      onChanged: (value){
                        this.outpassDate = value;
                      },
                    ),
                    new TextField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.access_time),
                        hintText: 'Enter the time of leaving',
                        labelText: 'Departure Time',
                      ),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value){
                        this.outpassDepartureTime = value;
                      },
                    ),
                    new TextField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.access_time),
                        hintText: 'Enter a expected arrival time',
                        labelText: 'In Time',
                      ),
                      keyboardType: TextInputType.datetime,
                      onChanged: (value){
                        this.outpassInTime = value;
                      },
                    ),
                    new TextField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.add_location),
                        hintText: 'Enter the address of visit',
                        labelText: 'Address',
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (value){
                        this.outpassAddress = value;
                      },
                    ),
                    new RaisedButton(
          onPressed: _sendToServer,
          child: new Text('Send'),
        ),

      ],
    );
  }

  _sendToServer() {
    count++;
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var dataOutpass = {
        'personNameOutpass': this.outpassName,
                    'date': this.outpassDate,
                    'departureTime': this.outpassDepartureTime,
                    'inTime': this.outpassInTime,
                    'address': this.outpassAddress,
                    'status': 'http://aux.iconspalace.com/uploads/12756772011468829104.png'
      };
      ref.child('Outpass').push().set(dataOutpass).then((v) {
        _key.currentState.reset();
      });
    } else {
      setState(() {
        _autovalidate = true;
      });
    }

     Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HomePage()));
  }
}