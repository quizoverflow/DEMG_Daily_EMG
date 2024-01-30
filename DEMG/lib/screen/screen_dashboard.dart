import 'package:demg/workOut/screen_pre_workOut.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(),
          preferredSize: Size.fromHeight(0),
        ),
        body: Column(
          children: [
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

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      tabs: const [Tab(text: "대시보드"), Tab(text: "변화"), Tab(text: "친구") , Tab(text:"랭킹")],
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
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => PreWorkOutScreen()),
                );
              }, child: Text('운동 시작')
              )
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
}
