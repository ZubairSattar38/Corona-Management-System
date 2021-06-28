import 'package:db_flutter/DartScreens/AddDoze.dart';
import 'package:db_flutter/Shared/shared.dart';
import 'package:flutter/material.dart';
import '../DartScreens/AddDoctorScreen.dart';
import '../DartScreens/PatientScreen.dart';
import '../DartScreens/DoctorScreen.dart';
import '../DartScreens/DisplayRecords.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State createState() => new DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {
  Widget build(BuildContext context) {
    void initState() {
    }

    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: new AssetImage('assets/drawerBack.jpeg'),
            )),
            child: Stack(children: <Widget>[
              Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text('Corona Management System',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500))),
            ])),
        (getSavedValue('roll') == 'admin')
            ? ListTile(
                leading: Icon(Icons.message),
                title: Text('Check Doctor'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AddDoctor()));
                },
              )
            : ListTile(
                leading: Icon(Icons.medical_services_rounded),
                title: Text('Add Doctor'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AddDoctor()));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => MyScreen()));
                },
              ),
        ListTile(
          leading: Icon(Icons.accessible),
          title: Text('Add Doze'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddDozePage()));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => MyScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.accessible),
          title: Text('Patient Vaccination'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PatientScreen()));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => MyScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.coronavirus),
          title: Text('Doctor Vaccination'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DoctorScreen()));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => MyScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.coronavirus),
          title: Text('All Dozes'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DisplayRecords("doze")));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => MyScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.coronavirus),
          title: Text('All Patient'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DisplayRecords("patient")));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => MyScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.coronavirus),
          title: Text('All Doctors'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DisplayRecords("doctor")));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => MyScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.coronavirus),
          title: Text('Admin'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DisplayRecords("admin")));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => MyScreen()));
          },
        )
      ],
    ));
  }
}
