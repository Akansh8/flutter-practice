import 'package:demo/screens/second.dart';
import 'package:flutter/material.dart';
import './second.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              Text('Welcome Home'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Second');
                  },
                  child: Text('NEXT')),
            ],
          ),
        ),
      ),
    );
  }
}
