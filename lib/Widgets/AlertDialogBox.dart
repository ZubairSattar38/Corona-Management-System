import 'package:flutter/material.dart';
import '../ApiFunc/callPatientApi.dart';

createAlertDialog(BuildContext context, List patient, int index, int type) {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();

  final vaccList = ['non_vaccinated', 'partial_vaccinated', 'fully_vaccinated'];
  // TextEditingController _setDefaultVacc = TextEditingController(text: vaccList[type - 1]);
  String _setDefaultVacc = vaccList[type - 1];
  Future<void> onSubmit() async {
    var object = {
      "first_Name": patient[index]['first_name'],
      "last_Name": patient[index]['last_Name'],
      "vaccName": _setDefaultVacc,
      "type" :type,
      "email":patient[index]['email'],
    };
    await updatePatienVaccinated(object);
  }
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
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
            Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(' Information About ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    patient[index]['first_name'] +
                        ' ' +
                        patient[index]['last_name'],
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: patient[index]['first_name']),
                        controller: firstName,
                        onChanged: (text) => setState(() {
                              patient[index]['first_name'] = firstName.text;
                            }))),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: patient[index]['last_name']),
                      controller: lastName,
                      onChanged: (text) => setState(() {
                            patient[index]['last_name'] = lastName.text;
                          })),
                ),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: DropdownButton<String>(
                      value: _setDefaultVacc,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _setDefaultVacc = newValue!;
                        });
                      },
                      items: vaccList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: MaterialButton(
                        onPressed: onSubmit,
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
      });
}
