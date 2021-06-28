import 'package:flutter/material.dart';
import '../ApiFunc/callPatientApi.dart';
import '../Widgets/AlertDialogBox.dart';
import '../ApiFunc/callDozeApi.dart';

class NonVaccinatedScreen extends StatefulWidget {
  int type;
  NonVaccinatedScreen(this.type);
  @override
  State createState() => new NonVaccinatedState();
}

class NonVaccinatedState extends State<NonVaccinatedScreen> {
  List patient = [];
  List  dozes = [];
  final List<int> colorCodes = <int>[600, 500, 100];

  Future<void> getPatient(final type) async {
    patient = await getNonVaccinatedApi(type);
    setState(() {});
    print(patient);
  }
  Future<void> getDozeData() async {
    
    dozes = await getDoze();
    setState(() {});
    print(dozes);
  }

  void initState() {
    super.initState();
    getDozeData();
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
              Align(
                alignment: Alignment.topCenter,
                child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      createAlertDialog(
                          context, patient, index, widget.type, getPatient,dozes);
                    }),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      listViewClick(patient[index]['email'] ?? '');
                    }),
              ),
               
            ],
            
          ),
          
        );       
      },
    );
  }
}
