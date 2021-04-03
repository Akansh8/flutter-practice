import 'package:flutter/material.dart';
import './third.dart';
import './home.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('NAME HERE'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text('Welcome to Second Page'),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/Third'),
                  child: Text('NEXT')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/Home'),
                  child: Text('BACK')),
            ],
          ),
        ),
      ),
    );
  }
}
