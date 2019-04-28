import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../home_page.dart';

class LeaveForm extends StatefulWidget {
  @override
  _LeaveFormState createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  
  
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String name;
  String dateOfDeparture;
  String dateOfArrival;
  String departureTime;
  String inTime;
  String address;
  String reason;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Form'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
        TextField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your first and last name',
                  labelText: 'Name',
                ),
                onChanged: (value){
                  this.name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Enter the date',
                  labelText: 'Date of Departure',
                ),
                keyboardType: TextInputType.datetime,
                onChanged: (value){
                  this.dateOfDeparture = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Enter the date',
                  labelText: 'Date of Arrival',
                ),
                keyboardType: TextInputType.datetime,
                onChanged: (value){
                  this.dateOfArrival = value;
                },
              ),
              TextField(
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
                  this.departureTime = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.access_time),
                  hintText: 'Enter a expected arrival time',
                  labelText: 'In Time',
                ),
                keyboardType: TextInputType.datetime,
                onChanged: (value){
                  this.inTime = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.add_location),
                  hintText: 'Enter the address of visit',
                  labelText: 'Address',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value){
                  this.address = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.assistant),
                  hintText: 'Enter the Reason of leave',
                  labelText: 'Reason',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value){
                  this.reason = value;
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
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var dataLeave = {
        'Name': this.name,
                    'DateOfDeparture': this.dateOfDeparture,
                    'DateOfArrival': this.dateOfArrival,
                    'DepartureTime':this.departureTime,
                    'inTime': this.inTime,
                    'address': this.address,
                    'reason' : this.reason,
                    'status': 'http://aux.iconspalace.com/uploads/12756772011468829104.png'
      };
      ref.child('Leave').push().set(dataLeave).then((v) {
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