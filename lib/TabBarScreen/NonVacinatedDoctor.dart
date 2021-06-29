import 'package:db_flutter/models/dose.dart';
import 'package:flutter/material.dart';
import '../ApiFunc/callDoctorApi.dart';
import '../Widgets/AlertDialogBox.dart';
import '../ApiFunc/callDozeApi.dart';

// ignore: must_be_immutable
class NonVaccinatedScreenDoctor extends StatefulWidget {
  int type;
  NonVaccinatedScreenDoctor(this.type);
  @override
  State createState() => new NonVaccinatedState();
}

class NonVaccinatedState extends State<NonVaccinatedScreenDoctor> {
  List doctor = [];
  List dozes = [];
  final List<int> colorCodes = <int>[600, 500, 100];
  List<Dose> _list = [];

  Future<void> getDoctor(final type) async {
    doctor = await getNonVaccinatedApi(type);
    setState(() {});
    print(doctor);
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
    getDoctor(widget.type);
  }

  void listViewClick(String email) {
    print(email);
    deleteDoctor(email);
    getDoctor(widget.type);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctor.length,
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
              Text(doctor[index]['first_name'] ?? 'Not Found'),
              Spacer(),
              Align(
                alignment: Alignment.topCenter,
                child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      createAlertDialog(
                          context, doctor, index, widget.type, getDoctor,_list);
                    }),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      listViewClick(doctor[index]['email'] ?? '');
                    }),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
