import 'package:flutter/material.dart';
import 'authenticator.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  late bool _isAuthenticated;
  void _onAuthenticated(bool value) {
    setState(() {
      _isAuthenticated = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _isAuthenticated = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: [
                new Authenticator(
                    key: UniqueKey(), onAuthenticated: _onAuthenticated),
                new Text('Authenticated value is ${_isAuthenticated}'),
              ],
            ),
          )),
    );
  }
}
