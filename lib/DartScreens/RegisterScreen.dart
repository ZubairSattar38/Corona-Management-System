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
          Expanded(
                      child: new ListView(
                 // this is vertical alignment
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
            ),
          
        ]));
  }
}
