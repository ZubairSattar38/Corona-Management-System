import 'package:db_flutter/Widgets/LoginSlider.dart';
import 'package:db_flutter/Shared/shared.dart';
import 'package:flutter/material.dart';
import '../Widgets/LineChartWidget.dart';
import '../Widgets/PieChartWidget.dart';
import '../Widgets/AddDrawer.dart';
class HomeScreen extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomeScreen> {
  String rollData = '';
  @override
  Widget build(BuildContext context) {
    getSavedValue('token')
        .then((token) => {
              if (token == '')
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginSlider()))
                }
              else
                {print(token), print(getSavedValue('roll'))}
            })
        .catchError((error) => {print(error)});
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('DashBoard'),
      ),
      body: Stack(children: <Widget>[
        new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new PieChartSample3(),
              new Row(children: <Widget>[
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0), child: LineChartWidget()),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0), child: LineChartWidget()),
                )
              ]),
            ],
          ),
        )
      ]),
    );
  }
}
