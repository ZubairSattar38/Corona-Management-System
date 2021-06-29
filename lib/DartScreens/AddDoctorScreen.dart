// import 'package:flutter/material.dart';
// import 'HomeScreen.dart';
// import '../ApiFunc/func.dart';
// import 'package:db_flutter/Shared/shared.dart';
// import 'package:db_flutter/Widgets/LoginSlider.dart';

// class AddDoctor extends StatefulWidget {
//   @override
//   AddDoctorState createState() => new AddDoctorState();
// }

// class AddDoctorState extends State<AddDoctor> {
//   final _formKey = GlobalKey<FormState>();

//   var _setDefaultCity = 'Enter City';
//   TextEditingController firstName = new TextEditingController();
//   TextEditingController lastName = new TextEditingController();
//   TextEditingController email = new TextEditingController();
//   TextEditingController password = new TextEditingController();
//   TextEditingController phoneNumber = new TextEditingController();
//   TextEditingController qualification = new TextEditingController();
//   TextEditingController contactNo = new TextEditingController();
//   TextEditingController city = new TextEditingController();
//   TextEditingController age = new TextEditingController();
//   double _value = 0;
//   final cityList = [
//     'Lahore',
//     'Chiniot',
//     'Faislabad',
//     'Gujranwala',
//     'Islamabad',
//     'Karachi'
//   ];
//   @override
//   Future<void> addDoctorBtn() async {
//     var object = {
//       'firstName': firstName.text,
//       "lastName": lastName.text,
//       "email": email.text,
//       "password": password.text,
//       "phoneNumber": phoneNumber.text,
//       "qualification": qualification.text,
//       "contactNo": contactNo.text,
//       "city": city.text,
//       "age": age.text,
//     };
//     print(object);
//     final isRun = await authPost(object, 'addDoctor');
//     if (isRun) {
//       print('Successfully Executed');
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => HomeScreen()));
//     } else {
//       print('Successfully Not Executed');
//     }
//   }

//   Widget build(BuildContext context) {
//     getSavedValue('token')
//         .then((token) => {
//               if (token == '')
//                 {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (BuildContext context) => LoginSlider()))
//                 }
//             })
//         .catchError((error) => {print(error)});

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff5808e5),
//         title: Text('Add Doctor',
//             style: TextStyle(fontSize: 25, color: Colors.white)),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           // new Image(
//           //   image: new AssetImage('assets/whiteBack.jpeg'),
//           //   fit: BoxFit.cover,
//           // ),
//           Expanded(
//               child: new Form(
//                   key: _formKey,
//                   child: ListView(
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       new Row(children: <Widget>[
//                         Flexible(
//                           child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.all(10),
//                                     labelText: "Enter First Name"),
//                                 controller: firstName,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter First Name';
//                                   }
//                                   return null;
//                                 },
//                               )),
//                         ),
//                         Flexible(
//                           child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.all(10),
//                                     labelText: "Enter Last Name"),
//                                 controller: lastName,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter Last Name';
//                                   }
//                                   return null;
//                                 },
//                               )),
//                         )
//                       ]),
//                       new Row(children: <Widget>[
//                         Flexible(
//                           child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                   labelText: "Enter Phone Number",
//                                 ),
//                                 controller: phoneNumber,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please Enter Phone Number';
//                                   }
//                                   return null;
//                                 },
//                               )),
//                         ),
//                         Flexible(
//                           child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 decoration:
//                                     InputDecoration(labelText: "Enter Email"),
//                                 controller: email,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please a Enter';
//                                   } else if (!RegExp(
//                                           "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                                       .hasMatch(value)) {
//                                     return 'Please a valid Email';
//                                   }
//                                   return null;
//                                 },
//                               )),
//                         )
//                       ]),
//                       new Row(children: <Widget>[
//                         Flexible(
//                           child: Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               decoration: new InputDecoration(
//                                   labelText: "Enter Password"),
//                               keyboardType: TextInputType.text,
//                               obscureText:
//                                   true, // it does not show the text while writing
//                               controller: password,
//                               validator: (value) {
//                                 // add your custom validation here.
//                                 if (value == null || value.isEmpty)
//                                   return 'Please enter Password';
//                                 else if (value.length < 6) {
//                                   return 'Must be more than 6 charater';
//                                 }
//                               },
//                             ),
//                           ),
//                         ),
//                       ]),
//                       new Row(children: <Widget>[
//                         Flexible(
//                           child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 decoration: InputDecoration(
//                                     labelText: "Enter Qualification"),
//                                 controller: qualification,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please Enter Qualification';
//                                   }
//                                   return null;
//                                 },
//                               )),
//                         ),
//                       ]),
//                       Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             decoration:
//                                 InputDecoration(labelText: "Enter Contact No"),
//                             controller: contactNo,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter Contact No';
//                               }
//                               return null;
//                             },
//                           )),
//                       Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             decoration: InputDecoration(labelText: "Enter Age"),
//                             controller: age,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter Age';
//                               }
//                               return null;
//                             },
//                           )),
//                       Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             decoration:
//                                 InputDecoration(labelText: "Enter City"),
//                             controller: city,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter City';
//                               }
//                               return null;
//                             },
//                           )),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 40,
//                         child: ElevatedButton.icon(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               addDoctorBtn();
//                             }
//                           },
//                           label: const Text('Add Doctor',
//                               style: TextStyle(fontSize: 20)),
//                           icon: Icon(
//                             Icons.login,
//                             color: Colors.white,
//                             size: 24.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ))),
//         ],
//       ),
//     );
//   }
// }

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
  final _formKey = GlobalKey<FormState>();

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
      //  appBar: AppBar(
      //     backgroundColor: Colors.black,
      //     title: Text('Login', style: TextStyle(fontSize: 25)),
      //   ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add Doctor',
            style: TextStyle(fontSize: 25, color: Colors.white)),
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
          Expanded(
            child: new Theme(
                data: new ThemeData(
                    brightness: Brightness.dark,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                            color: Colors.white, fontSize: 20.0))),
                child: new Form(
                    key: _formKey,
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Row(children: <Widget>[
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: "Enter First Name"),
                                  controller: firstName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter First Name';
                                    }
                                    return null;
                                  },
                                )),
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                                                            textInputAction: TextInputAction.next,

                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: "Enter Last Name"),
                                  controller: lastName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Last Name';
                                    }
                                    return null;
                                  },
                                )),
                          )
                        ]),
                        new Row(children: <Widget>[
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: "Enter Phone Number",
                                  ),
                                  controller: phoneNumber,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Phone Number';
                                    }
                                    return null;
                                  },
                                )),
                          ),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  decoration:
                                      InputDecoration(labelText: "Enter Email"),
                                  controller: email,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please a Enter';
                                    } else if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return 'Please a valid Email';
                                    }
                                    return null;
                                  },
                                )),
                          )
                        ]),
                        new Row(children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                decoration: new InputDecoration(
                                    labelText: "Enter Password"),
                                keyboardType: TextInputType.text,
                                obscureText:
                                    true, // it does not show the text while writing
                                controller: password,
                                validator: (value) {
                                  // add your custom validation here.
                                  if (value == null || value.isEmpty)
                                    return 'Please enter Password';
                                  else if (value.length < 6) {
                                    return 'Must be more than 6 charater';
                                  }
                                },
                              ),
                            ),
                          ),
                        ]),
                        new Row(children: <Widget>[
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      labelText: "Enter Qualification"),
                                  controller: qualification,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Qualification';
                                    }
                                    return null;
                                  },
                                )),
                          ),
                        ]),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  labelText: "Enter Contact No"),
                              controller: contactNo,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Contact No';
                                }
                                return null;
                              },
                            )),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              decoration:
                                  InputDecoration(labelText: "Enter Age"),
                              controller: age,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Age';
                                }
                                return null;
                              },
                            )),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              decoration:
                                  InputDecoration(labelText: "Enter City"),
                              controller: city,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter City';
                                }
                                return null;
                              },
                            )),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                addDoctorBtn();
                              }
                            },
                            label: const Text('Add Doctor',
                                style: TextStyle(fontSize: 20)),
                            icon: Icon(
                              Icons.login,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ))),
          )
        ],
      ),
    );
  }
}
