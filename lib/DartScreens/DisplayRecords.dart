import 'package:db_flutter/ApiFunc/callUserApi.dart';
import 'package:db_flutter/Widgets/AddDrawer.dart';
import 'package:flutter/material.dart';
import '../ApiFunc/callDoctorApi.dart';
import '../Widgets/AlertDialogBox.dart';
import '../ApiFunc/callDozeApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class DisplayRecords extends StatefulWidget {
  String type;
 
  DisplayRecords(this.type);
  @override
  State createState() => new DisplayRecordState();
}

class DisplayRecordState extends State<DisplayRecords> {
  List records = [];
   bool isAdmin=false,isDoctor=false;
  final List<int> colorCodes = <int>[600, 500, 100];

  Future<void> getRecords(String type) async {
    print(type);
    if (type == 'doze') {
      records = await getDoze();
    } else {
      records = await getUserRecords(type);
    }
    print(records);
    setState(() {});
    print(records);
  }

  void initState() {
    super.initState();
    getRecords(widget.type);
    getSharedData();
  }
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
  void listViewClick(String email) {
    print(email);
    if (widget.type == 'doze') {
      print('Check');
      deleteDoze(email);
    } else {
      print('Called');
      deleteDoctor(email);
    }
    getRecords(widget.type);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          centerTitle: true,

          backgroundColor: Color(0xff5808e5),
          title: Text(widget.type == 'patient'
              ? 'Patient'
              : widget.type == 'doctor'
                  ? 'Doctor'
                  : widget.type == 'doze'
                      ? 'Doze'
                      : 'Admin'),
        ),
        body: ListView.builder(
          itemCount: records.length,
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
                  widget.type == "doze"
                      ? Text(records[index]['name'] +
                              '    ( ' +
                              records[index]['no_of_dozes'].toString() +
                              ' ) ' ??
                          'Not Found')
                      : Text(records[index]['first_name'] ?? 'Not Found'),
                  Spacer(),
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: IconButton(
                  //       icon: Icon(Icons.edit),
                  //       onPressed: () {
                  //         createAlertDialog(
                  //             context, records, index, widget.type, getDoctor);
                  //       }),
                  // ),
                  (isAdmin || isDoctor)?
                  Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          listViewClick(widget.type == 'doze'
                              ? (records[index]['name'] ?? '')
                              : (records[index]['email'] ?? ''));
                        }),
                  ):Container(),

                  Divider(),
                ],
              ),
            );
          },
        ));
  }
}
