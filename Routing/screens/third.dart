import 'package:flutter/material.dart';
import './second.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
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
              Text('Welcome to Third Page'),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/Second'),
                  child: Text('BACK')),
            ],
          ),
        ),
      ),
    );
  }
}
