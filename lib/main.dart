import 'package:flutter/material.dart';
import './LoginSlider.dart';
void main() {
  runApp(MyApp());
}



//   stateless widget which donot have any state
//   statefull widget which means that which have some states  like one is a dynamic website and one is a static website
//    so static website is basically stateless widget and dynamic website is a staefull widget

//   if the image is not moving then it is a stateless widget
//   jab koi cheez click karna sa change hoo to wo statefull widget ha
class MyApp extends StatelessWidget {
  @override //  jab hum na kuch changes huadi karni hoon to hum overriding karta haan jaisa humna stateless widget ma changes karni haan
  Widget build(BuildContext context) {
    return new MaterialApp(
        // home: new LoginPage(),
        home: new LoginSlider(),
        theme: new ThemeData(primarySwatch: Colors.blue));
  }
}
