import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:soccer_board/core/presentation/widgets/default_layout.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/standing.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/rank_bloc/rank_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/teams_bloc/teams_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/squads_screen.dart';

class RankScreen extends StatefulWidget {
  static const routeName = 'rank';

  final String type;
  const RankScreen({required this.type, Key? key}) : super(key: key);

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  @override
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

        if (!state.rank.containsKey(widget.type)) {
          return const Center(
            child: Text('잠시만 기다려 주세요!'),
          );
        }

        final rank = state.rank[widget.type]![0];

        return DefaultLayout(
          title: '${widget.type} - Rank',
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 138),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            ConstTextWidthWidget(
                              text: '경기',
                              width: 26,
                              center: true,
                              bold: true,
                            ),
                            ConstTextWidthWidget(
                              text: '최근 경기',
                              width: 70,
                              center: true,
                              bold: true,
                            ),
                            ConstTextWidthWidget(
                              text: '승',
                              center: true,
                              bold: true,
                            ),
                            ConstTextWidthWidget(
                              text: '무',
                              center: true,
                              bold: true,
                            ),
                            ConstTextWidthWidget(
                              text: '패',
                              center: true,
                              bold: true,
                            ),
                            ConstTextWidthWidget(
                              text: '득실',
                              width: 26,
                              center: true,
                              bold: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.goNamed(
                            SquadsScreen.routeName,
                            params: {
                              'type': widget.type,
                              'team': rank.league.standings[0][index].team.id
                                  .toString()
                            },
                          );
                        },
                        child: TeamsList(
                          rank: rank.league.standings[0][index],
                        ),
                      );
                    },
                    itemCount: rank.league.standings[0].length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status == NetworkStatus.error) {
          print('에러 발생');
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if (!context.read<RankBloc>().state.rank.containsKey(widget.type)) {
      context.read<RankBloc>().add(GetRankEvent(type: widget.type));
    }
  }
}

class TeamsList extends StatelessWidget {
  final Rank rank;
  const TeamsList({required this.rank, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        children: [
          rank.team.logo.endsWith('png')
              ? Image.network(
                  rank.team.logo,
                  height: 30,
                  width: 30,
                  fit: BoxFit.fitWidth,
                )
              : SvgPicture.network(
                  rank.team.logo,
                  height: 30,
                  width: 30,
                  fit: BoxFit.fitWidth,
                  cacheColorFilter: true,
                ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 100,
              child: Text(rank.team.name!, overflow: TextOverflow.ellipsis)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConstTextWidthWidget(
                    text: rank.all.played.toString(), width: 26),
                ConstTextWidthWidget(
                  text: rank.form,
                  width: 70,
                ),
                ConstTextWidthWidget(text: rank.all.win.toString()),
                ConstTextWidthWidget(text: rank.all.draw.toString()),
                ConstTextWidthWidget(text: rank.all.lose.toString()),
                ConstTextWidthWidget(
                  text: rank.goalsDiff.toString(),
                  width: 26,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConstTextWidthWidget extends StatelessWidget {
  final String text;
  final double width;
  final bool center;
  final bool bold;
  const ConstTextWidthWidget(
      {required this.text,
      this.width = 10,
      this.center = false,
      this.bold = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: center
          ? Center(
              child: Text(
              text,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
            ))
          : Text(text,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
    );
  }
}
