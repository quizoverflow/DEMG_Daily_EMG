import 'dart:async';
import 'package:demg/screen/screen_dashboard.dart';
import 'package:demg/screen/screen_dashboard_debug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const int splashDuration = 1;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: splashDuration),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashBoardScreenDebug()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 437.5,
                height: 200,
                child: SvgPicture.asset('asset/img/splash_wave_signal.svg',
                    fit: BoxFit.fitWidth),
              )
            ],
          ),
          Text(
            "DEMG  ",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ],
      ),
    );

  }
}
