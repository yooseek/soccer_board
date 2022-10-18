import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:soccer_board/core/const/data.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/selected_type_bloc/selected_type_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/selected_type_bloc/selected_type_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/rank_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/top_scorers_screen.dart';

class LeagueScreen extends StatelessWidget {
  static const routeName = 'league';

  const LeagueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: const [
          LeagueLabel(
            text: '리그 별 순위',
          ),
          LeagueRankCategory(),
        ],
      ),
    );
  }
}

class LeagueLabel extends StatelessWidget {
  final String text;
  const LeagueLabel({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTypeBloc, SelectedTypeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30.0)),
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        context.read<SelectedTypeBloc>().add(
                            ChangeSelectedTypeEvent(
                                selectedType: SelectedType.team));
                      },
                      child: Text(
                        '팀',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: state.selectedType == SelectedType.team
                                ? Colors.blueAccent[400]
                                : Colors.grey),
                      )),
                  const SizedBox(
                    width: 24.0,
                  ),
                  GestureDetector(
                      onTap: () {
                        context.read<SelectedTypeBloc>().add(
                            ChangeSelectedTypeEvent(
                                selectedType: SelectedType.player));
                      },
                      child: Text(
                        '선수',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: state.selectedType == SelectedType.player
                                ? Colors.blueAccent[400]
                                : Colors.grey),
                      )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class LeagueRankCategory extends StatelessWidget {
  const LeagueRankCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTypeBloc, SelectedTypeState>(
      builder: (context, state) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            physics: const BouncingScrollPhysics(),
            children: [
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                      tag: 'PL', child: Image.asset('assets/images/pl.png')),
                ),
                onTap: () {
                  state.selectedType == SelectedType.team
                      ? context.goNamed(
                          RankScreen.routeName,
                          params: {'type': leagueList[0]},
                        )
                      : context.goNamed(
                          TopScorersScreen.routeName,
                          params: {'type': leagueList[0]},
                        );
                },
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                      tag: 'PD',
                      child: Image.asset('assets/images/laliga.png')),
                ),
                onTap: () {
                  state.selectedType == SelectedType.team
                      ? context.goNamed(
                          RankScreen.routeName,
                          params: {'type': leagueList[1]},
                        )
                      : context.goNamed(
                          TopScorersScreen.routeName,
                          params: {'type': leagueList[1]},
                        );
                },
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                      tag: 'BL1',
                      child: Image.asset('assets/images/bundesliga.png')),
                ),
                onTap: () {
                  state.selectedType == SelectedType.team
                      ? context.goNamed(
                          RankScreen.routeName,
                          params: {'type': leagueList[2]},
                        )
                      : context.goNamed(
                          TopScorersScreen.routeName,
                          params: {'type': leagueList[2]},
                        );
                },
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                      tag: 'SA', child: Image.asset('assets/images/seria.png')),
                ),
                onTap: () {
                  state.selectedType == SelectedType.team
                      ? context.goNamed(
                          RankScreen.routeName,
                          params: {'type': leagueList[3]},
                        )
                      : context.goNamed(
                          TopScorersScreen.routeName,
                          params: {'type': leagueList[3]},
                        );
                },
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                      tag: 'FL1',
                      child: Image.asset('assets/images/ligue1.png')),
                ),
                onTap: () {
                  state.selectedType == SelectedType.team
                      ? context.goNamed(
                          RankScreen.routeName,
                          params: {'type': leagueList[4]},
                        )
                      : context.goNamed(
                          TopScorersScreen.routeName,
                          params: {'type': leagueList[4]},
                        );
                },
              ),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                      tag: 'PPL', child: Image.asset('assets/images/nos.png')),
                ),
                onTap: () {
                  state.selectedType == SelectedType.team
                      ? context.goNamed(
                          RankScreen.routeName,
                          params: {'type': leagueList[5]},
                        )
                      : context.goNamed(
                          TopScorersScreen.routeName,
                          params: {'type': leagueList[5]},
                        );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
