import 'package:flutter/material.dart';
import './LoginScreen.dart';
import '../ApiFunc/func.dart';
import 'HomeScreen.dart';
import '../Shared/shared.dart';

class RegisterPage extends StatefulWidget {
  @override
  State createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final rollList = ['Doctor', 'Nurse', 'Patient'];
  String _setDefaultRoll = 'Doctor';
  bool checkValue = false;
  double _ageValue=0;
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Stack(overflow: Overflow.visible, children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Please Add More Information',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration:
                            InputDecoration(labelText: "Enter Phone Number"))),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(labelText: "Enter Age"),
                      keyboardType: TextInputType.number
                      ),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(labelText: "Enter City"))),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CheckboxListTile(
                      title: Text("isVaccinated"),
                      value: checkValue,
                      onChanged: (value) {
                        setState(() {
                          checkValue = !checkValue;
                        });
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: DropdownButton(
                      value: _setDefaultRoll,
                      items: rollList.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _setDefaultRoll = value.toString();
                        });
                      },
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: MaterialButton(
                        onPressed: () => {},
                        height: 40,
                        minWidth: 100,
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Submit"),
                        // child: new Icon(Icons),
                        splashColor: Colors.redAccent))
              ],
            ))
          ]));
        });
  }

  Widget build(BuildContext context) {
    Future<void> onRegister() async {
      @override
      var object = {
        'firstName': firstName.text,
        "lastName": lastName.text,
        "email": email.text,
        "password": password.text
      };
      final isRun = await authPost(object, 'register');
      print(isRun);
      if (isRun) {
        print('Successfully Executed');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print('Not Executed');
      }
    }

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Register'),
      ),
        body: new Stack(fit: StackFit.expand, //   stack property expand images
            children: <Widget>[
          new Image(
            image: new AssetImage('assets/loginBackground.png'),
            fit: BoxFit.cover,
            color: Colors.black87, // its is very high opacity
            colorBlendMode: BlendMode.darken, // its and overlay
          ),
          new SingleChildScrollView(
            child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // this is vertical alignment
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(top: 70)),
                  new Image(
                    image: new AssetImage('assets/loginIcon.png'),
                    width: 150,
                  ),
                  new Form(
                      child: new Theme(
                          data: new ThemeData(
                              brightness: Brightness.dark,
                              primarySwatch: Colors.teal,
                              inputDecorationTheme: new InputDecorationTheme(
                                  labelStyle: new TextStyle(
                                      color: Colors.white, fontSize: 16.0))),
                          child: Container(
                            padding: new EdgeInsets.all(60.0),
                            child: new Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: TextFormField(
                                      controller: firstName,
                                      decoration: InputDecoration(
                                          // border: OutlineInputBorder(),
                                          labelText: "Enter First Name")),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: TextFormField(
                                      controller: lastName,
                                      decoration: InputDecoration(
                                          // border: OutlineInputBorder(),
                                          labelText: "Enter Last Name")),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: TextFormField(
                                      controller: email,
                                      decoration: InputDecoration(
                                          // border: OutlineInputBorder(),
                                          labelText: "Enter Email")),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: TextFormField(
                                      controller: password,
                                      decoration: InputDecoration(
                                          // border: OutlineInputBorder(),
                                          labelText: "Enter Password"),
                                      keyboardType: TextInputType.text,
                                      obscureText: true),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 5),
                                    child: MaterialButton(
                                        onPressed: onRegister,
                                        height: 40,
                                        minWidth: 100,
                                        color: Colors.teal,
                                        textColor: Colors.white,
                                        child: new Text("Sign Up"),
                                        // child: new Icon(Icons),
                                        splashColor: Colors.redAccent)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: FlatButton(
                                    child: Text(
                                        "Already Have an Account?" + 'Login'),
                                    color: Colors.transparent,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ))),
                ]),
          )
        ]));
  }
}
