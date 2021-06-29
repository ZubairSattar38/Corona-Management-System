import 'package:db_flutter/models/dose.dart';
import 'package:flutter/material.dart';
import '../ApiFunc/callPatientApi.dart';
import '../Widgets/AlertDialogBox.dart';
import '../ApiFunc/callDozeApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NonVaccinatedScreen extends StatefulWidget {
  int type;
  NonVaccinatedScreen(this.type);
  @override
  State createState() => new NonVaccinatedState();
}

class NonVaccinatedState extends State<NonVaccinatedScreen> {
  bool isAdmin = false;
  bool isDoctor = false;

  List patient = [];
  List dozes = [];

  final List<int> colorCodes = <int>[600, 500, 100];
  List<Dose> _list = [];
  Future<void> getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('roll') == 'admin') {
      isAdmin = true;
    }
    if (prefs.getString('roll') == 'doctor') {
      isDoctor = true;
    }
    setState(() {});
  }

  Future<void> getPatient(final type) async {
    patient = await getNonVaccinatedApi(type);
    setState(() {});
    print(patient);
  }

  Future<void> getDozeData() async {
    dozes = await getDoze();
    dozes.forEach((element) {
      _list.add(Dose.fromMap(element));
      setState(() {});
    });
    print(dozes);
  }

  void initState() {
    super.initState();
    getDozeData();
    getSharedData();
    getPatient(widget.type);
  }

  void listViewClick(String email) {
    print(email);
    deletePatient(email);
    getPatient(widget.type);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patient.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          decoration: BoxDecoration(
              // color: Colors.amber,
              // borderRadius: BorderRadius.circular(20),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(patient[index]['first_name'] ?? 'Not Found'),
              Spacer(),
              (isAdmin || isDoctor)
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            createAlertDialog(context, patient, index,
                                widget.type, getPatient, _list);
                          }),
                    )
                  : Container(),
              (isAdmin || isDoctor)
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            listViewClick(patient[index]['email'] ?? '');
                          }),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
