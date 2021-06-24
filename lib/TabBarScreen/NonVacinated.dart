import 'package:flutter/material.dart';
import '../ApiFunc/callPatientApi.dart';
import '../Widgets/AlertDialogBox.dart';

class NonVaccinatedScreen extends StatefulWidget {
  @override
  State createState() => new NonVaccinatedState();
}

class NonVaccinatedState extends State<NonVaccinatedScreen> {
  List patient = [];
  final List<int> colorCodes = <int>[600, 500, 100];
  Future<void> getPatient(String type) async {
    patient = await getPatientApi(type);
    print(patient);
  }

  void initState() {
    super.initState();
    getPatient("NULL");
  }

  void listViewClick(String email) {
    deletePatient(email);
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
          child: Row(children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(patient[index]['firstName']),
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    createAlertDialog(context,patient);
                  }),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    listViewClick(patient[index]['email']);
                  }),
            ),
          ]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
