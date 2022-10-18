import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:soccer_board/core/presentation/widgets/default_layout.dart';
import 'package:soccer_board/core/presentation/widgets/tab_switching_view.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/favorite_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/league_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/teams_screen.dart';

List<Widget> pageList = [
  const LeagueScreen(),
  const TeamsScreen(),
  const FavoriteScreen(),
  const LeagueScreen(),
];

class RootScreen extends StatefulWidget {
  static const String routeName = 'root';
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with SingleTickerProviderStateMixin{
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();

    // vsync엔 컨트롤러를 선언하는 스테이트를 넣어주면 된다. - 보통 애니메이션와 연관된 컨트롤러에서 사용
    // SingleTickerProviderStateMixin 사용하기
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Succor Score',
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(2),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.blueGrey,
                // 선택되었을 때
                unselectedItemColor: Colors.grey[400],
                // 선택 안되었을 때
                selectedFontSize: 10.0,
                unselectedFontSize: 10.0,
                type: BottomNavigationBarType.fixed,
                // 선택되었을 때의 아이콘 확장 여부
                onTap: (int index) {
                  controller.animateTo(index);
                },
                currentIndex: index,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map_rounded),
                    label: 'League',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_soccer_rounded),
                    label: 'Team',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_rounded),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Setting',
                  ),
                ],
              ),
            ),
          ),
        ),
      child: SafeArea(
        bottom: false,
        child: TabSwitchingView(
          currentTabIndex: index,
          tabCount: pageList.length,
          tabBuilder: (context, index) {
            return pageList[index];
          },
        ),
      ),
    );
  }
}
