import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soccer_board/core/presentation/widgets/default_layout.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/squad.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/squads_bloc/squads_bloc.dart';

class SquadsScreen extends StatefulWidget {
  static const routeName = 'squads';

  final String team;
  const SquadsScreen({required this.team, Key? key}) : super(key: key);

  @override
  State<SquadsScreen> createState() => _SquadsScreenState();
}

class _SquadsScreenState extends State<SquadsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SquadsBloc, SquadsState>(
      builder: (context, state) {
        if (state.status == SquadesStatus.error) {
          return const DefaultLayout(
              child: Center(
                child: Text('에러발생'),
              ));
        } else if (state.status == SquadesStatus.loading ||
            state.status == SquadesStatus.initial) {
          return const DefaultLayout(
              child: Center(child: CircularProgressIndicator()));
        }

        if(!context.read<SquadsBloc>().state.squads.containsKey(widget.team)) {
          return const DefaultLayout(
              child: Center(child: CircularProgressIndicator()));
        }

        final squad = state.squads[widget.team];

        return DefaultLayout(
          title: '${squad![0].team.name} - Squad',
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0),
                            child: PlayersList(
                              player: squad![0].players[index],
                            )),
                      );
                    },
                    itemCount: squad![0].players.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status == SquadesStatus.error) {
          print('에러 발생');
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if(!context.read<SquadsBloc>().state.squads.containsKey(widget.team)) {
      context.read<SquadsBloc>().add(GetSquadsEvent(team: widget.team));
    }
  }
}

class PlayersList extends StatelessWidget {
  final Player player;
  const PlayersList({required this.player, Key? key}) : super(key: key);

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
            fit: BoxFit.cover,
          )
              : SvgPicture.network(
            player.photo,
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 100,
              child: Text(player.name, overflow: TextOverflow.ellipsis)),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('나이 : ${player.age}'),
              Text('번호 : ${player.number ?? '미정'}'),
              Text('포지션 : ${player.position ?? '미정'}'),
            ],
          ),
        ],
      ),
    );
  }
}
