import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Area{
  int index;
  String name;
  Color color;
  Area({this.index: 0,this.name: 'Area',this.color: Colors.lightBlueAccent});
}

class _State extends State<MyApp> {
  int _location;
  List<Area> _areas;

  @override
  void initState() {
    // TODO: implement initState
    _areas=[];
    for(int i=0;i<16;i++){
      _areas.add(new Area(
        index: i,
        name: 'Area ${i}',
      ));
    }

    var rng = new Random();
    _location= rng.nextInt(_areas.length);
  }

  void _onPressed(int index){
    setState(() {
      if(index == _location){
        _areas[index].color=Colors.green;
      }
      else{
        _areas[index].color=Colors.red;
      }
    });
  }
  Widget _generate(int index){
    return new GridTile(
        child: new Container(
          padding: EdgeInsets.all(5),
          child: new ElevatedButton(onPressed: ()=>_onPressed(index),
              child: new Text(_areas[index].name,textAlign: TextAlign.center,)),
        ),
    );
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
            child: new GridView.count(
              crossAxisCount: 4,
              children: new List<Widget>.generate(16, (index) => _generate(index)),
            ),
          )),
    );
  }
}
