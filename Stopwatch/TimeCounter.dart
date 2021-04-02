import 'package:flutter/material.dart';
import 'dart:async';
import 'timedisplay.dart';

class TimeCounter extends StatefulWidget {
  @override
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  late Stopwatch _watch;
  late Timer _timer;
  late Duration _duration;

  void _onStart() {
    setState(() {
      _watch = new Stopwatch();
      _timer = new Timer.periodic(new Duration(milliseconds: 250), _onTimeOut);
    });
    _watch.start();
  }

  void _onStop() {
    _timer.cancel();
    _watch.stop();
  }

  void _onTimeOut(Timer timer) {
    if (!_watch.isRunning) return;
    setState(() {
      _duration = _watch.elapsed;
    });
  }

  void _onClear(Duration value) {
    setState(() {
      _duration = new Duration();
    });
  }

  @override
  void initState() {
    _duration = new Duration();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Center(
        child: new Column(
          children: [
            new TimeDisplay(
              key: UniqueKey(),
              color: Colors.red,
              duration: _duration,
              onClear: _onClear,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Padding(
                    padding: EdgeInsets.all(10),
                    child: new ElevatedButton(
                        onPressed: _onStart, child: Text('Start'))),
                new Padding(
                    padding: EdgeInsets.all(10),
                    child: new ElevatedButton(
                        onPressed: _onStop, child: Text('Stop'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
