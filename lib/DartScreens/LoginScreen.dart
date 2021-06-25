import 'package:flutter/material.dart';
import './RegisterScreen.dart';
import '../ApiFunc/func.dart';
import './HomeScreen.dart';

//   we use statefulWidget in below class because we want to apply some animations and also add image so we use statefulwidget
class LoginPage extends StatefulWidget {
  @override
  State createState() =>
      new LoginPageState(); //  this function return the state  and we make the another state class  which will have all the state
}

class LoginPageState extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Future<void> onLogin() async {
    var object = {"email": email.text, "password": password.text};
    final isRun = await authPost(object, 'login');
    if (isRun) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      print('Successfully Not Executed');
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
        // scaffold is basically a structure which is provided by android  you know declared something like a app
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Login', style: TextStyle(fontSize: 25)),
        ),
        body: new Stack(
          fit: StackFit.expand, //   stack property expand images
          children: <Widget>[
            new Image(
              image: new AssetImage('assets/loginBackground.png'),
              fit: BoxFit.cover,
              color: Colors.black87, // its is very high opacity
              colorBlendMode: BlendMode.darken, // its and overlay
            ),
            new Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // this is vertical alignment
                children: <Widget>[
                  new Image(
                    image: new AssetImage('assets/loginIcon.png'),
                    width: 150,
                  ),
                  new Form(
                    child: new Theme(
                      data: new ThemeData(
                          brightness: Brightness.dark,
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                  color: Colors.white, fontSize: 20.0))),
                      child: new Container(
                          padding: new EdgeInsets.all(60.0),
                          child: new Column(children: <Widget>[
                            new TextFormField(
                              decoration:
                                  new InputDecoration(labelText: "Enter Email"),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              controller: email,
                            ),
                            new TextFormField(
                              decoration: new InputDecoration(
                                  labelText: "Enter Password"),
                              keyboardType: TextInputType.text,
                              obscureText:
                                  true, // it does not show the text while writing
                              controller: password,
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 40),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton.icon(
                                onPressed: onLogin,
                                label: const Text('Login',
                                    style: TextStyle(fontSize: 20)),
                                icon: Icon(
                                  Icons.login,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            new FlatButton(
                              child: Text("Donot Have an Account?" + 'Signup'),
                              color: Colors.transparent,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              },
                            )
                          ])),
                    ),
                  )
                ])
          ],
        ));
  }
}
