import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Sales{
  String year;
  int sales;
  Sales(this.year,this.sales);
}

class _State extends State<MyApp> {

  List<Sales> _data;
  List<charts.Series<Sales,String>>  _chartData;

  void _makeData(){
    _data=[];
    _chartData = [];

    final rnd=new Random();
    for(int i=2010;i<2019;i++){

      _data.add(new Sales(i.toString(),rnd.nextInt(1000)));
    }

    _chartData.add(new charts.Series(id: 'Sales',
        colorFn: (_,__)=>charts.MaterialPalette.green.shadeDefault,
        data: _data,
        domainFn: (Sales sales,_)=>sales.year,
        measureFn: (Sales sales,_)=>sales.sales,
        fillPatternFn: (_,__)=> charts.FillPatternType.solid,
        displayName: 'sales',
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    _makeData();
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
              children: <Widget>[
                Text('Sales Data'),
                new Expanded(child: new charts.BarChart(_chartData)),
              ],
            ),
          )),
    );
  }
}
