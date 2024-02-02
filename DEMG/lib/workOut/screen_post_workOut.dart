import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themeSet/app_theme.dart';

class PostWorkOutScreen extends StatelessWidget {
  const PostWorkOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Column(
        children: [
          //제목 칼럼
          Column(
            children: [
              Container(
                  width: 350,
                  height: 160,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.8),
                      border: Border.all(
                          color: AppTheme().themeColor(color: 'blue'),
                          width: 0),
                      color: AppTheme().themeColor(color: 'blue')),
                  padding: EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Text(
                    "운동이 끝났습니다",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
