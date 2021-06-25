import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import '../ApiFunc/func.dart';
import 'package:db_flutter/Shared/shared.dart';
import 'package:db_flutter/Widgets/LoginSlider.dart';

class AddDoctor extends StatefulWidget {
  @override
  AddDoctorState createState() => new AddDoctorState();
}

class AddDoctorState extends State<AddDoctor> {
  var _setDefaultCity = 'Enter City';
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController qualification = new TextEditingController();
  TextEditingController contactNo = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController age = new TextEditingController();
  double _value = 0;
  final cityList = [
    'Lahore',
    'Chiniot',
    'Faislabad',
    'Gujranwala',
    'Islamabad',
    'Karachi'
  ];
  @override
  Future<void> addDoctorBtn() async {
    var object = {
      'firstName': firstName.text,
      "lastName": lastName.text,
      "email": email.text,
      "password": password.text,
      "phoneNumber": phoneNumber.text,
      "qualification": qualification.text,
      "contactNo": contactNo.text,
      "city": city.text,
      "age": age.text,
    };
    print(object);
    final isRun = await authPost(object, 'addDoctor');
    if (isRun) {
      print('Successfully Executed');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      print('Successfully Not Executed');
    }
  }

  Widget build(BuildContext context) {
    getSavedValue('token')
        .then((token) => {
              if (token == '')
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginSlider()))
                }
            })
        .catchError((error) => {print(error)});


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Doctor',
            style: TextStyle(fontSize: 25, color: Colors.black)),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/whiteBack.jpeg'),
            fit: BoxFit.cover,
          ),
          Expanded(
                      child: new Form(
                child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(children: <Widget>[
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: "Enter First Name"),
                          controller: firstName,
                        )),
                  ),
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: "Enter Last Name"),
                          controller: lastName,
                        )),
                  )
                ]),
                new Row(children: <Widget>[
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Phone Number",
                          ),
                          controller: phoneNumber,
                        )),
                  ),
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "Enter Email"),
                          controller: email,
                        )),
                  )
                ]),
                new Row(children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration:
                            new InputDecoration(labelText: "Enter Password"),
                        keyboardType: TextInputType.text,
                        obscureText:
                            true, // it does not show the text while writing
                        controller: password,
                      ),
                    ),
                  ),
                ]),
                new Row(children: <Widget>[
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "Enter Qualification"),
                          controller: qualification,
                        )),
                  ),
                ]),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Enter Contact No"),
                      controller: contactNo,
                    )),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Enter Age"),
                      controller: age,
                    )),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Enter City"),
                      controller: city,
                    )),

                // Padding(
                //   padding: EdgeInsets.all(16.0),
                //   child: DropdownButton<String>(
                //     focusColor: Colors.white,
                //     value: _setDefaultCity,
                //     //elevation: 5,
                //     style: TextStyle(color: Colors.white),
                //     iconEnabledColor: Colors.black,
                //     items: <String>[
                //       'Android',
                //       'IOS',
                //       'Flutter',
                //       'Node',
                //       'Java',
                //       'Python',
                //       'PHP',
                //     ].map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(color: Colors.black),
                //         ),
                //       );
                //     }).toList(),
                //     hint: Text(
                //       "Please choose a langauage",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 14,
                //           fontWeight: FontWeight.w500),
                //     ),
                //     onChanged: (String? value) {
                //       setState(() {
                //         _setDefaultCity = value.toString();
                //       });
                //     },
                //   ),
                // ),

                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton.icon(
                    onPressed: addDoctorBtn,
                    label:
                        const Text('Add Doctor', style: TextStyle(fontSize: 20)),
                    icon: Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ))),
          
        ],
      ),
    );
  }
}
