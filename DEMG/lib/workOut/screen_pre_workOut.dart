import 'dart:async';

import 'package:demg/workOut/screen_while_workOut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themeSet/app_theme.dart';


class PreWorkOutScreen extends StatefulWidget {
  @override
  _PreWorkOutScreenState createState() => _PreWorkOutScreenState();
}

class _PreWorkOutScreenState extends State<PreWorkOutScreen> {
  List<String> workOutInstruction = [
    '측정 하고자 하는 근육에 디바이스를 부착하세요',
    '측정 부위가 젖어 있다면 닦아주세요',
    '불편하지 않는 선에서 스트랩을 단단히 조여주세요',
    '이제 측정을 시작합니다',
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    Timer(
      Duration(milliseconds: AppTheme().waitTimeMilli * workOutInstruction.length),
        (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WhileWorkOutScreen())
        );
        }
    );
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: AppTheme().waitTimeMilli), () {
      setState(() {
        currentIndex = (currentIndex + 1) % workOutInstruction.length;
      });
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().themeColor(),
      body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 230),
                child: Hero(
                  tag: 'signal-tag',
                  child: SvgPicture.asset(
                    "asset/img/small_wave_signal.svg",
                    width: 200,
                  ),
                ),
              ),
              SizedBox(height: 30),
              AnimatedOpacity(
                opacity: currentIndex < workOutInstruction.length ? 1.0 : 0.0,
                duration: Duration(seconds: 2),
                child: Text(
                  workOutInstruction[currentIndex],
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
      ),
    );
  }
}
