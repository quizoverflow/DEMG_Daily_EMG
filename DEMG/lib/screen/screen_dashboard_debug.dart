import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../workOut/screen_pre_workOut.dart';

class DashBoardScreenDebug extends StatefulWidget {
  const DashBoardScreenDebug({super.key});

  @override
  State<DashBoardScreenDebug> createState() => _DashBoardScreenDebugState();
}

class _DashBoardScreenDebugState extends State<DashBoardScreenDebug>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 500));

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(text: "대시보드"),
        Tab(text: "변화"),
        Tab(text: "친구"),
        Tab(text: "랭킹")
      ],
    );
  }

  Widget _TabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        Container(
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
        ),
        Container(
            alignment: Alignment.center,
            child: Text(
              '변화',
              style: TextStyle(
                fontSize: 60,
              ),
            )),
        Container(
            alignment: Alignment.center,
            child: Text(
              '친구',
              style: TextStyle(
                fontSize: 60,
              ),
            )),
        Container(
            alignment: Alignment.center,
            child: Text(
              '랭킹',
              style: TextStyle(
                fontSize: 60,
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return
}
