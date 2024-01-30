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
  void initState(){
    super.initState();
    Timer(
      Duration(seconds : splashDuration),
        ()=> Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> const DashBoardScreenDebug()),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      /*Container(
        width: 412,
        height: 892,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 175,
              padding: const EdgeInsets.only(top: 36, bottom: 37.34),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('asset/img/splash_wave_signal.svg',fit:BoxFit.fitWidth)
                ,
                ],
              ),
            ),
            const SizedBox(height: 52),
            SizedBox(
              width: 115,
              height: 37,
              child: Text(
                'DEMG  ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: 'SUIT',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      );*/
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
        children: [
          Container(
            width: 437.5,
            height: 200,
            child: SvgPicture.asset('asset/img/splash_wave_signal.svg',fit:BoxFit.fitWidth),
          )
        ],
      ),
        Text(
            "DEMG  ",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),

        ),
      ],
    );
  }
}