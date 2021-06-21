import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './LoginScreen.dart';

class LoginSlider extends StatefulWidget {
  final String title = "Login ";
  @override
  LoginSliderState createState() => LoginSliderState();
}

class LoginSliderState extends State<LoginSlider> {
  @override
  int _currentPage = 0;
  List imageList = [
    'assets/sliderLogin.jpeg',
    'assets/sliderLogin1.jpeg',
    'assets/sliderLogin2.jpeg'
  ];
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        height: height,
                        initialPage: 0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentPage = index;
                          });
                        }),
                    items: imageList.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Stack(children: <Widget>[
                            new Image(
                              image: new AssetImage(image),
                              fit: BoxFit.cover,
                              height: double.infinity,
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    label: const Text('Go To Login',
                                        style: TextStyle(fontSize: 20)),
                                    icon: Icon(
                                      Icons.arrow_right_alt_outlined,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                  ),
                                ))
                          ]);
                        },
                      );
                    }).toList(),
                  )
                ],
              ))),
    );
  }
}
