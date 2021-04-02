import 'package:flutter/material.dart';
import 'dart:ui';

class TimeDisplay extends StatelessWidget {
  TimeDisplay(
      {required Key key,
      required Color this.color,
      required Duration this.duration,
      required this.onClear})
      : super(key: key);

  Duration duration = new Duration();
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;

  void _onClicked() {
    onClear(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: new EdgeInsets.all(5.0),
          child: new Text(
            duration.toString(),
            style: new TextStyle(
              fontSize: 32.0,
              color: color,
            ),
          ),
        ),
        new IconButton(onPressed: _onClicked, icon: new Icon(Icons.clear)),
      ],
    );
  }
}
