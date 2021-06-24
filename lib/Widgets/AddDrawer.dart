import 'package:db_flutter/Shared/shared.dart';
import 'package:flutter/material.dart';
import '../DartScreens/AddDoctorScreen.dart';
import '../DartScreens/PatientScreen.dart';
class DrawerWidget extends StatefulWidget {
  @override
  State createState() => new DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
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
            title: Text('See Patients'),
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
          )
        ],
      ));
  }
}
