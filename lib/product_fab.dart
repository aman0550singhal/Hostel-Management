import 'package:flutter/material.dart';
import 'dart:math' as math;
import './forms/outpass_form.dart';
import './forms/leave_form.dart';
import './forms/complain_form.dart';

class ProductFAB extends StatefulWidget {

  @override
  _ProductFABState createState() => _ProductFABState();
}

class _ProductFABState extends State<ProductFAB> with TickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync:  this,
      duration: Duration(milliseconds: 200)
    );
    super.initState();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Interval(0.0, 1.0,curve: Curves.easeOut)
            ),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).cardColor,
              heroTag: 'outpass',
              mini: true,
              onPressed: (){
                 Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OutpassForm()));
              },
              child:Icon(Icons.playlist_add,color: Theme.of(context).primaryColor,),
            ),
          ),
        ),
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Interval(0.0, 0.5,curve: Curves.easeOut)
            ),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).cardColor,
              heroTag: 'leave',
              mini: true,
              onPressed: (){
                 Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LeaveForm()));

              },
              child: Icon(Icons.arrow_forward,color: Colors.blue),
            ),
          ),
        ),
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Interval(0.0, 0.2,curve: Curves.easeOut)
            ),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).cardColor,
              heroTag: 'complain',
              mini: true,
              onPressed: (){
                 Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ComplainForm()));

              },
              child: Icon(Icons.announcement,color: Colors.blue),
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: 'options',
          onPressed: (){
            if(_controller.isDismissed){
                _controller.forward();
            }else{
              _controller.reverse();
            }
          },
          child:AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context,Widget child){
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.rotationZ(_controller.value *0.5* math.pi),
                child: Icon(_controller.isDismissed ? Icons.more_vert:Icons.close),
              );
            },
          ),
        ),
      ],
    );
  }
}