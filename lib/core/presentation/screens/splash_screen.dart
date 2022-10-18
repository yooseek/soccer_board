import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:soccer_board/core/const/data.dart';
import 'package:soccer_board/core/presentation/screens/root_screen.dart';
import 'package:soccer_board/core/presentation/widgets/default_layout.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/rank_bloc/rank_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RankBloc, RankState>(
      listener: (context, state) {
        if(state.status == RankNetworkStatus.loaded) {
          context.goNamed(RootScreen.routeName);
        }
      },
      builder: (context, state) {
        return DefaultLayout(
          child: Center(
            child: Column(
              children: [
                Container(child: Text('스플래쉬 페이지'),),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    for(String league in leagueList){
      context.read<RankBloc>().add(GetRankEvent(type: league));
    }
  }
}
