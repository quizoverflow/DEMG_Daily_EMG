import 'dart:async';
import 'package:demg/screen/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const int splashDuration = 3;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    /*Timer(
        Duration(seconds: splashDuration),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashBoardScreen(username: 'null',)),
            ));*/
  }
  void _loadUserData() async{
    await Future.delayed(Duration(seconds: splashDuration));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '사용자';
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashBoardScreen(username : username))
    );
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
          const Text(
            "DEMG",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          const SizedBox(height: 40),
          const CircularProgressIndicator(),
        ],
      ),
    );

  }
}
