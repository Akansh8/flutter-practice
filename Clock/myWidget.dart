import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer _timer;
  String _value='Time Here';
  @override
  void initState() {
    // TODO: implement initState

    _timer=new Timer.periodic(new Duration(seconds: 1), _onTimer);
  }
  void _onTimer(Timer timer){
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm:ss');
    String formatted=formatter.format(now);
    setState(() {
      _value=formatted;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Text(_value,style: TextStyle(fontSize: 40,color: Colors.brown),);
  }
}
