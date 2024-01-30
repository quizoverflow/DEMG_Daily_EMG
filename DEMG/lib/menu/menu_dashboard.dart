
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../workOut/screen_pre_workOut.dart';

Container DashBoardMenu(BuildContext context){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("debug mode dash board"),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PreWorkOutScreen()),
              );
            },
            child: Text('운동 시작'))
      ],
    ),
  );
}