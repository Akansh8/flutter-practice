import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  Authenticator({required Key key, required this.onAuthenticated});
  final ValueChanged<bool> onAuthenticated;
  @override
  _AuthenticatorState createState() => _AuthenticatorState(
        key: UniqueKey(),
        onAuthenticated: onAuthenticated,
      );
}

class _AuthenticatorState extends State<Authenticator> {
  _AuthenticatorState({required Key key, required this.onAuthenticated});
  late TextEditingController _user;
  late TextEditingController _pass;
  final ValueChanged<bool> onAuthenticated;
  void onClick() {
    if (_user.text != 'user' || _pass.text != '1234') {
      onAuthenticated(false);
    } else {
      onAuthenticated(true);
    }
  }

  @override
  void initState() {
    _pass = new TextEditingController();
    _user = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Padding(
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          children: [
            new TextField(
              controller: _user,
              decoration: new InputDecoration(
                labelText: 'UserName',
              ),
            ),
            new TextField(
              controller: _pass,
              decoration: new InputDecoration(
                labelText: 'PassWord',
              ),
              obscureText: true,
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: new ElevatedButton(
                onPressed: onClick,
                child: new Text('LOGIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
