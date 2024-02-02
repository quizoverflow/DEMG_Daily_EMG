//import 'dart:ffi';

import 'package:android_intent/android_intent.dart';
import 'package:demg/themeSet/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../workOut/screen_pre_workOut.dart';

Container DashBoardMenu(BuildContext context,String username){
  void openAndroidSettins() async{
    AndroidIntent intent = const AndroidIntent(
      action: 'android.settings.BLUETOOTH_SETTINGS',
    );
    await intent.launch();
  }

  return Container(
    padding: EdgeInsets.only(top: 30),
    color: Colors.transparent,
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              //color: Colors.blue,
              width: 175,
              height: 120,
              margin: const EdgeInsets.only(right: 5.0, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          AppTheme().createPageRoute(PreWorkOutScreen()),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTheme().themeColor(),
                      fixedSize: const Size(170, 44),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('운동 시작'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        openAndroidSettins();
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme().themeColor(),
                        fixedSize: const Size(170, 44),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text('디바이스 페어링')),
                ],
              ),
            ),
            Container(
              //color: Colors.red,
              margin: const EdgeInsets.only(right: 1, top: 5),
              width: 170,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.8),
                  border: Border.all(color: AppTheme().themeColor(), width: 0),
                  color: AppTheme().themeColor()),
              padding: EdgeInsets.all(8.0),
              //color: AppTheme().themeColor(),
              child: Column(
                children: [
                  Text(
                    "오늘 운동 SCORE",
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "80",
                        style: TextStyle(
                            fontSize: 43,
                            fontFamily: 'SUIT',
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
          ],
        ),
        Container(
          width: 350,
          height: 160,
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.8),
              border: Border.all(
                  color: AppTheme().themeColor(color: 'gray blue'), width: 0),
              color: AppTheme().themeColor(color: 'gray blue')),
          padding: EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Text(
                      "$username님의 최근 운동 시간",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "06:03:08 ~ 07:30:57",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                  ])
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("운동 시간"),
                      Text(
                        "1h04m",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("총 대사량"),
                      Row(
                        children: [
                          Text(
                            "100",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text("kcal")
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("활동 대사량"),
                      Row(
                        children: [
                          Text(
                            "150",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text("kcal")
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
            width: 350,
            height: 300,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.8),
                border: Border.all(
                    color: AppTheme().themeColor(color: 'blue'), width: 0),
                color: AppTheme().themeColor(color:'gray blue')
            ),
            padding: EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "운동 현황",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("운동 객체 1"),
                      Text("75 points"),
                      Text("3 세트")
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("운동 객체 2"),
                      Text("75 points"),
                      Text("3 세트")
                    ],
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}
