import 'package:demg/menu/menu_change.dart';
import 'package:demg/menu/menu_friends.dart';
import 'package:demg/menu/menu_ranking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../menu/menu_dashboard.dart';
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
        DashBoardMenu(context),
        ChangeMenu(context),
        FriendsMenu(context),
        RankingMenu(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: PreferredSize(
          child: AppBar(),
          preferredSize: Size.fromHeight(0),
        ),*/
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 52,
          margin: const EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 412,
                  height: 52,
                  decoration: const BoxDecoration(color: Colors.transparent),
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
                right: 15,
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
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: _tabBar(),
        ),
        Expanded(child: _TabBarView()),
      ],
    ));
  }
}
