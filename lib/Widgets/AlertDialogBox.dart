import 'package:flutter/material.dart';
@override

createAlertDialog(BuildContext context,List patient) {
  final rollList = ['Doctor', 'Nurse', 'Patient'];
  String _setDefaultRoll = 'Doctor';
  bool checkValue = false;
  double _ageValue = 0;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Stack(overflow: Overflow.visible, children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Please Add More Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(patient[0]['firstName'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration:
                          InputDecoration(labelText: "Enter Phone Number"))),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(labelText: "Enter Age"),
                    keyboardType: TextInputType.number),
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(labelText: "Enter City"))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CheckboxListTile(
                    title: Text("isVaccinated"),
                    value: checkValue,
                    onChanged: (value) {},
                  )),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: DropdownButton(
                    value: _setDefaultRoll,
                    items: rollList.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  child: MaterialButton(
                      onPressed: () => {},
                      height: 40,
                      minWidth: 100,
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("Submit"),
                      // child: new Icon(Icons),
                      splashColor: Colors.redAccent))
            ],
          ))
        ]));
      });
}
