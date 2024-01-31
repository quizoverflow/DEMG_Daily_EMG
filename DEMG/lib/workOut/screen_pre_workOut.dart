import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themeSet/app_theme.dart';

class PreWorkOutScreen extends StatefulWidget {
  const PreWorkOutScreen({super.key});

  @override
  State<PreWorkOutScreen> createState() => _PreWorkOutScreenState();
}

class _PreWorkOutScreenState extends State<PreWorkOutScreen> {
  final List<String> workOutInstruction = [
    '측정 하고자 하는 근육에 디바이스를 부착하세요',
    '측정 부위가 젖어 있다면 닦아주세요',
    '불편하지 않는 선에서 스트랩을 단단히 조여주세요',
  ];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _startLoop();
  }

  void _startLoop() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        currentIndex = (currentIndex + 1) % workOutInstruction.length;
      });
      _startLoop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme().themeColor(),
        body: Stack(
          children: [
            Positioned(
              top: 100,
              left: 95,
              child: Container(
                margin: EdgeInsets.only(top: 100),
                child: Hero(
                  tag: 'signal-tag',
                  child: SvgPicture.asset(
                    "asset/img/small_wave_signal.svg",
                    width: 200,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 500,
                left: 0,
                child: SizedBox(
/*                  width: double.infinity,
                  height: double.infinity,*/
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(children: [
                        FadeInDown(
                          child: Text(
                            workOutInstruction[0],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          duration: Duration(seconds: 1),
                        ),
                        FadeInDown(
                          child: Text(
                            workOutInstruction[1],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          duration: Duration(seconds: 1),
                        )
                      ])
                    ],
                  ),
                ))
          ],
        ));
  }
}
