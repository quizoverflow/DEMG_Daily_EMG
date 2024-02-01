import 'package:demg/workOut/screen_post_workOut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themeSet/app_theme.dart';

class WhileWorkOutScreen extends StatefulWidget {
  const WhileWorkOutScreen({super.key});

  @override
  State<WhileWorkOutScreen> createState() => _WhileWorkOutScreenState();
}

class _WhileWorkOutScreenState extends State<WhileWorkOutScreen> {
  @override
  Widget build(BuildContext context) {
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
                    "운동중 화면",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
          Column(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  AppTheme().createPageRoute(PostWorkOutScreen()),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme().themeColor(),
                fixedSize: const Size(170, 44),
                shape: const StadiumBorder(),
              ),
              child: const Text('debug: 넘어가기'),
            ),
          ])
        ],
      ),
    );
  }
}
