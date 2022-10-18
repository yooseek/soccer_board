import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:soccer_board/core/const/data.dart';
import 'package:soccer_board/core/presentation/widgets/default_layout.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/standing.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/rank_bloc/rank_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/selected_type_bloc/selected_type_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/league_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/players_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/team_detail_screen.dart';

class TeamsScreen extends StatelessWidget {
  static const routeName = 'teams';

  const TeamsScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocConsumer<RankBloc, RankState>(
      builder: (context, state) {
        if (state.status == RankNetworkStatus.error) {
          return const DefaultLayout(
              child: Center(
            child: Text('에러발생'),
          ));
        } else if (state.status == RankNetworkStatus.loading ||
            state.status == RankNetworkStatus.initial) {
          return const DefaultLayout(
              child: Center(child: CircularProgressIndicator()));
        }

        if (state.rank.length < leagueList.length) {
          return const DefaultLayout(
              child: Center(child: CircularProgressIndicator()));
        }

        final rank = state.rank;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              LeagueLabel(text: '리그 별 정보'),
              LeagueInfoCategory(
                rank: rank,
              )
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state.status == RankNetworkStatus.error) {
          print('에러 발생');
        }
      },
    );
  }
}

class LeagueInfoCategory extends StatelessWidget {
  final Map<String, List<Standing>> rank;

  const LeagueInfoCategory({required this.rank, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTypeBloc, SelectedTypeState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: leagueList.length,
            itemBuilder: (context, index) {
              final League league = rank[leagueList[index]]![0].league;

              return GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      league.logo.endsWith('png')
                          ? Image.network(
                              league.logo,
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            )
                          : SvgPicture.network(
                              league.logo,
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                              cacheColorFilter: true,
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${league.country}',
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '리그 : ${league.name}',
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '현재 시즌 : ${league.season.toString()}',
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      league.flag.endsWith('png')
                          ? Image.network(
                              league.flag,
                              height: 100,
                              width: 70,
                              fit: BoxFit.contain,
                            )
                          : SvgPicture.network(
                              league.flag,
                              height: 100,
                              width: 70,
                              fit: BoxFit.contain,
                              cacheColorFilter: true,
                            ),
                    ],
                  ),
                ),
                onTap: () {
                  state.selectedType == SelectedType.team
                      ? context.goNamed(
                          DetailTeamsScreen.routeName,
                          params: {'type': leagueList[index]},
                        )
                      : context.goNamed(
                          PlayersScreen.routeName,
                          params: {'type': leagueList[index]},
                        );
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[300],
                thickness: 2.0,
                indent: 8.0,
                endIndent: 8.0,
              );
            },
          ),
        );
      },
    );
  }
}
