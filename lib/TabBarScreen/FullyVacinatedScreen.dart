import 'package:flutter/material.dart';
import '../ApiFunc/callPatientApi.dart';

class FullyVacinatedScreen extends StatefulWidget {
  @override
  State createState() => new FullyVacinatedState();
}

class FullyVacinatedState extends State<FullyVacinatedScreen> {
  
  List patient = [];
  final List<int> colorCodes = <int>[600, 500, 100];
  Future<void> getPatient() async {
    patient = await getPatientApi("NULL");
    print(patient);
  }
  
  void initState() {
    getPatient();
    super.initState();
  }

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
