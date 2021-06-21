import 'package:flutter/material.dart';

class AddDoctor extends StatefulWidget {
  @override
  AddDoctorState createState() => new AddDoctorState();
}

class AddDoctorState extends State<AddDoctor> {
  String _setDefaultCity = 'Lahore';
  double _value = 0;
  final cityList = [
    'Lahore',
    'Chiniot',
    'Faislabad',
    'Gujranwala',
    'Islamabad',
    'Karachi'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Doctor',
            style: TextStyle(fontSize: 25, color: Colors.black)),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Form(
              child: SingleChildScrollView(
                  child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(children: <Widget>[
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: "Enter First Name"))),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: "Enter Last Name"))),
                )
              ]),
              new Row(children: <Widget>[
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Enter Phone Number"))),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "Enter Email"))),
                )
              ]),
              new Row(children: <Widget>[
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "Enter Password"))),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "Enter Email"))),
                )
              ]),
              new Row(children: <Widget>[
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Enter Qualification"))),
                ),
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "Enter Contact No"))),
                )
              ]),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(labelText: "Enter City"))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(labelText: "Enter Age"))),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: DropdownButton(
                    value: _setDefaultCity,
                    items: cityList.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _setDefaultCity = value.toString();
                      });
                    },
                  )),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red[700],
                  inactiveTrackColor: Colors.red[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: Colors.redAccent,
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.red[700],
                  inactiveTickMarkColor: Colors.red[100],
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  value: _value,
                  min: 0,
                  max: 100,
                  divisions: 2,
                  label: '$_value',
                  onChanged: (value) {
                    setState(
                      () {
                        _value = value;
                      },
                    );
                  },
                ),
              ),
            ],
          )))
        ],
      ),
    );
  }
}
