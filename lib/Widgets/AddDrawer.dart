import 'package:db_flutter/DartScreens/AddDoze.dart';
import 'package:db_flutter/DartScreens/LoginScreen.dart';
import 'package:db_flutter/Shared/shared.dart';
import 'package:flutter/material.dart';
import '../DartScreens/AddDoctorScreen.dart';
import '../DartScreens/PatientScreen.dart';
import '../DartScreens/DoctorScreen.dart';
import '../DartScreens/DisplayRecords.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State createState() => new DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {
  bool isAdmin = false;
  bool isDoctor = false;
  String email = '', name = '';
  Future<void> getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '';
    name = prefs.getString('name') ?? '';
    if (prefs.getString('roll') == 'admin') {
      isAdmin = true;
    }
    if (prefs.getString('roll') == 'doctor') {
      isDoctor = true;
    }
    setState(() {});
  }
  Future<void> clearToken() async{
    setStringValuesSF('token','');
    getboolValueSafe('isToken',false);
     Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
  void initState() {
    super.initState();
    getSharedData();
  }

  Widget build(BuildContext context) {
    return Drawer(
        child: Expanded(
            child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500)),
          accountEmail: Text(email),
          margin: EdgeInsets.zero,
          currentAccountPicture: CircleAvatar(
            backgroundImage: new AssetImage('assets/accountIcon.jpeg'),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: new AssetImage('assets/drawerBack.jpeg'),
          )),
        ),

        //                                         Admin
        (isAdmin)
            ? Container(
                child: Container(
                    child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Add Doctor'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AddDoctor()));
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
                              builder: (BuildContext context) =>
                                  AddDozePage()));
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
                  ),
                ],
              )))
            : Container(),

        //                                                Doctor
        (isAdmin || isDoctor)
            ? Container(
                child: Container(
                    child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.coronavirus),
                    title: Text('Doctor Vaccination'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DoctorScreen()));
                    },
                  ),
                ],
              )))
            : Container(),

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
          leading: Icon(Icons.medication),
          title: Text('All Dozes'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DisplayRecords("doze")));
          },
        ),
        ListTile(
          leading: Icon(Icons.personal_injury),
          title: Text('All Patient'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DisplayRecords("patient")));
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('All Doctors'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DisplayRecords("doctor")));
          },
        ),
        Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: clearToken
                ),
              ],
            )),
        // icon: Icons.event,
        // text: 'Logout',
        // onTap: () => Navigator.pushReplacementNamed(context, '/'))
      ],
    )));
  }
}
