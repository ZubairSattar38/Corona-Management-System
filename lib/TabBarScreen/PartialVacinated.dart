import 'package:flutter/material.dart';
import '../ApiFunc/callPatientApi.dart';

class PartialVacinatedScreen extends StatefulWidget {
  @override
  State createState() => new PartialVacinatedState();
}

class PartialVacinatedState extends State<PartialVacinatedScreen> {
  List patient = [];
  final List<int> colorCodes = <int>[600, 500, 100];
 
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: patient.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Row(
          
            children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(patient[index]['firstName']),
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
