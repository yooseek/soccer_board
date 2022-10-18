import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:soccer_board/core/presentation/widgets/default_layout.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/teams_bloc/teams_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/show_venue.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/squads_screen.dart';

class DetailTeamsScreen extends StatefulWidget {
  static const routeName = 'detailTeams';

  final String type;
  const DetailTeamsScreen({required this.type, Key? key}) : super(key: key);

  @override
  State<DetailTeamsScreen> createState() => _DetailTeamsScreenState();
}

class _DetailTeamsScreenState extends State<DetailTeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamsBloc, TeamsState>(
      builder: (context, state) {
        if (state.status == NetworkStatus.error) {
          return const DefaultLayout(
              child: Center(
            child: Text('에러발생'),
          ));
        } else if (state.status == NetworkStatus.loading ||
            state.status == NetworkStatus.initial) {
          return const DefaultLayout(
              child: Center(child: CircularProgressIndicator()));
        }

        if(!state.teams.containsKey(widget.type)) {
          return const Center(child: Text('잠시만 기다려 주세요!'),);
        }

        final teams = state.teams[widget.type];

        return DefaultLayout(
          title: '${widget.type} - Team',
          child: Scaffold(
            body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ShowVenue(venue: teams[index].venue)));
                            },
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: TeamsList(
                                  type: widget.type,
                                  team: teams[index],
                                )),
                          );
                        },
                        itemCount: teams!.length,
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

    if(!context.read<TeamsBloc>().state.teams.containsKey(widget.type)) {
      context.read<TeamsBloc>().add(GetTeamsEvent(type: widget.type));
    }
  }
}

class TeamsList extends StatelessWidget {
  final String type;
  final Team team;
  const TeamsList({required this.type,required this.team, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        children: [
          team.team.logo.endsWith('png')
              ? Image.network(
                  team.team.logo,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                )
              : SvgPicture.network(
                  team.team.logo,
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 100,
              child: Text(team.team.name, overflow: TextOverflow.ellipsis)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('이름 : ${team.team.name}'),
                Text('지역 : ${team.team.country}'),
                Text('창단 년도 : ${team.team.founded} 년'),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ShowVenue(venue: team.venue)));
              }, child: Text('경기장 보기'),),
              TextButton(onPressed: (){
                context.goNamed(
                  SquadsScreen.routeName,
                  params: {'type' : type,'team' : team.team.id.toString()},
                );
              }, child: Text('스쿼드 보기'),),
              TextButton(onPressed: (){
                context.read<FavoriteBloc>().add(ChangeFavoriteTeamEvent(favoriteTeam: team));
              }, child: Text('좋아요'),),
            ],
          ),

        ],
      ),
    );
  }

}
