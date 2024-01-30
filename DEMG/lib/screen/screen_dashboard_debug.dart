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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 412,
          height: 892,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 40,
                child: Container(
                  width: 412,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 412,
                          height: 52,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 14,
                        child: SizedBox(
                          width: 68,
                          height: 24,
                          child: Text(
                            'DEMG',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'SUIT',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 360,
                        top: 10,
                        child: Container(
                          width: 32,
                          height: 32,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(children: [
                              SvgPicture.asset("asset/img/small_wave_signal.svg"),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: _tabBar(),
                  ),
                  Expanded(child: _TabBarView()),
                ],
              ),
              /*Positioned(
                left: -25,
                top: 92,
                child:Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: _tabBar(),
                    ),
                    Expanded(child: _TabBarView()),
                  ],
                ) ,
              ),*/
    ]
          ))]);}

}
