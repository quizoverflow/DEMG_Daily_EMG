

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themeSet/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimatedInstructions(),
    );
  }
}

class MyAnimatedInstructions extends StatefulWidget {
  @override
  _MyAnimatedInstructionsState createState() => _MyAnimatedInstructionsState();
}

class _MyAnimatedInstructionsState extends State<MyAnimatedInstructions> {
  List<String> workOutInstruction = [
    '측정 하고자 하는 근육에 디바이스를 부착하세요',
    '측정 부위가 젖어 있다면 닦아주세요',
    '불편하지 않는 선에서 스트랩을 단단히 조여주세요',
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(seconds: 2), () {
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
              margin: EdgeInsets.only(top: 100),
              child: Hero(
                tag: 'signal-tag',
                child: SvgPicture.asset(
                  "asset/img/small_wave_signal.svg",
                  width: 200,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: currentIndex < workOutInstruction.length ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                workOutInstruction[currentIndex],
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ),
    );
  }
}
