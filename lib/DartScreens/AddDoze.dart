import 'package:flutter/material.dart';
import '../ApiFunc/callDozeApi.dart';

//   we use statefulWidget in below class because we want to apply some animations and also add image so we use statefulwidget
class AddDozePage extends StatefulWidget {
  @override
  State createState() =>
      new AddDozePageState(); //  this function return the state  and we make the another state class  which will have all the state
}
class AddDozePageState extends State<AddDozePage> {
  TextEditingController name = new TextEditingController();
  TextEditingController quantity = new TextEditingController();
  Future<void> onAddDoze() async {
    var object = {"name": name.text, "quantity": quantity.text};
    final isRun = await addDoze(object);
    if (isRun) {
      print('Successfully  Executed');
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => HomeScreen()));
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
          title: Text('AddDoze', style: TextStyle(fontSize: 25)),
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
                              decoration: new InputDecoration(
                                  labelText: "Enter Doze Name"),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              controller: name,
                            ),
                            new TextFormField(
                              decoration: new InputDecoration(
                                  labelText: "Enter Quantity"),
                              keyboardType: TextInputType.number,
                              controller: quantity,
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 40),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton.icon(
                                onPressed: onAddDoze,
                                label: const Text('AddDoze',
                                    style: TextStyle(fontSize: 20)),
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ])),
                    ),
                  )
                ])
          ],
        ));
  }
}
