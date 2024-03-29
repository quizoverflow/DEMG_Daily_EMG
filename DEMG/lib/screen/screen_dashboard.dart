import 'package:demg/menu/menu_change.dart';
import 'package:demg/menu/menu_friends.dart';
import 'package:demg/menu/menu_ranking.dart';
import 'package:demg/themeSet/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../menu/menu_dashboard.dart';
import '../workOut/screen_pre_workOut.dart';

class DashBoardScreen extends StatefulWidget {
  final String username;
  const DashBoardScreen({super.key, required this.username});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
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
      indicatorColor: AppTheme().themeColor(color: 'blue'),
      indicatorWeight: 5,
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
        DashBoardMenu(context,widget.username),
        ChangeMenu(context),
        FriendsMenu(context),
        RankingMenu(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 55,
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
              const Positioned(
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
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //사용자 정보 수정 페이지 만들어야 함

                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: AppTheme().themeColor(),
                          fixedSize: const Size(75, 9),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          '${widget.username} 님',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Hero(
                        tag: 'signal-tag',
                        child: Container(
                          width: 32,
                          height: 32,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Stack(children: [
                            SvgPicture.asset("asset/img/small_wave_signal.svg"),
                          ]),
                        ),
                      )
                    ],
                  )
                  /*child:Hero(
                  tag: 'signal-tag',
                  child:Container(
                    width: 32,
                    height: 32,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Stack(children: [
                      SvgPicture.asset("asset/img/small_wave_signal.svg"),
                    ]),
                  ),
                )*/

                  ),
            ],
          ),
        ),
        Container(
          /*decoration: BoxDecoration(
            border: Border.all(),
          ),*/
          child: _tabBar(),
        ),
        Expanded(child: _TabBarView()),
      ],
    ));
  }
}
