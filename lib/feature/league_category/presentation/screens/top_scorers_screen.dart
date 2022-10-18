
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soccer_board/core/presentation/widgets/default_layout.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/scorers_bloc/scorers_bloc.dart';

class TopScorersScreen extends StatefulWidget {
  static const routeName = 'scorers';

  final String type;
  const TopScorersScreen({required this.type, Key? key}) : super(key: key);

  @override
  State<TopScorersScreen> createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScorersBloc, ScorersState>(
      builder: (context, state) {
        if (state.status == ScorersStatus.error) {
          return const DefaultLayout(
              child: Center(
                child: Text('에러발생'),
              ));
        } else if (state.status == ScorersStatus.loading ||
            state.status == ScorersStatus.initial) {
          return const DefaultLayout(
              child: Center(child: CircularProgressIndicator()));
        }

        if(!state.scorer.containsKey(widget.type)) {
          return const Center(child: Text('잠시만 기다려 주세요!'),);
        }

        final scorer = state.scorer[widget.type];

        return DefaultLayout(
          title: '${widget.type} - Best Player',
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return PlayerList(
                        player: scorer![index].player,
                        stat: scorer[index].statistics[0],
                      );
                    },
                    itemCount: scorer!.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status == ScorersStatus.error) {
          print('에러 발생');
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if(!context.read<ScorersBloc>().state.scorer.containsKey(widget.type)) {
      context.read<ScorersBloc>().add(GetScorersEvent(type: widget.type));
    }
  }
}

class PlayerList extends StatelessWidget {
  final DetailPlayer player;
  final Stat stat;
  const PlayerList({required this.player,required this.stat, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Row(
        children: [
          player.photo.endsWith('png')
              ? Image.network(
            player.photo,
            height: 50,
            width: 50,
            fit: BoxFit.fitWidth,
          )
              : SvgPicture.network(
            player.photo,
            height: 50,
            width: 50,
            fit: BoxFit.fitWidth,
            cacheColorFilter: true,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 120,
              child:
              Text(player.name, overflow: TextOverflow.ellipsis)),
          stat.team.logo.endsWith('png')
              ? Image.network(
            stat.team.logo,
            height: 50,
            width: 50,
            fit: BoxFit.fitWidth,
          )
              : SvgPicture.network(
            stat.team.logo,
            height: 50,
            width: 50,
            fit: BoxFit.fitWidth,
            cacheColorFilter: true,
          ),
          const SizedBox(width: 16.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('출장 : ${stat.games.minutes}분',),
                Text('평점 : ${(stat.games.rating != null) ?stat.games.rating!.substring(0,5) : '-'}점',),
                Text('골 : ${stat.goals.total}개',),
                Text('키 패스 : ${stat.passes.key}개',),
              ],
            ),
          ),
          TextButton(onPressed: (){
            context.read<FavoriteBloc>().add(ChangeFavoritePlayerEvent(favoritePlayer: player));
          }, child: Text('좋아요')),
        ],
      ),
    );
  }
}