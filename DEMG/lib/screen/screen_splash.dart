import 'dart:async';
import 'dart:html';

import 'package:demg/screen/screen_dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const int splashDuration = 4;

  @override
  void initState(){
    super.initState();
    Timer(
      Duration(seconds : splashDuration),
        ()=> Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> DashBoardScreen()),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration : BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/debug_img/splash.png'),
          fit: BoxFit.contain),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                width: width,
                height: height,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(),
                  )
                )
              )
            )
          ],
        )
      );
  }
}