import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soccer_board/core/presentation/widgets/default_layout.dart';
import 'package:soccer_board/core/utils/debounce_throttle.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/players_bloc/players_bloc.dart';

class PlayersScreen extends StatefulWidget {
  static const routeName = 'players';

  final String type;
  const PlayersScreen({required this.type, Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayersBloc, PlayersState>(
      builder: (context, state) {
        if (state.status == PlayersStatus.error) {
          return const DefaultLayout(
              child: Center(
            child: Text('에러발생'),
          ));
        } else if (state.status == PlayersStatus.loading ||
            state.status == PlayersStatus.initial) {
          return const DefaultLayout(
              child: Center(child: CircularProgressIndicator()));
        }

        if (!state.players.containsKey(widget.type)) {
          return const Center(
            child: Text('잠시만 기다려 주세요!'),
          );
        }

        final players = state.filteredPlayers;

        return DefaultLayout(
          title: '${widget.type} - Player',
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  SearchBox(type: widget.type),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return PlayerList(
                          player: players![index].player,
                          stat: players[index].statistics[0],
                        );
                      },
                      itemCount: players!.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey[300],
                          thickness: 2.0,
                          indent: 8.0,
                          endIndent: 8.0,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status == PlayersStatus.error) {
          print('에러 발생');
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if (!context.read<PlayersBloc>().state.players.containsKey(widget.type)) {
      context.read<PlayersBloc>().add(GetPlayersEvent(type: widget.type));
    }else{
      context.read<PlayersBloc>().add(ClearFilteredPlayerEvent(type: widget.type));
    }
  }
}

class PlayerList extends StatelessWidget {
  final DetailPlayer player;
  final Stat stat;
  const PlayerList({required this.player, required this.stat, Key? key})
      : super(key: key);

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
              child: Text(player.name, overflow: TextOverflow.ellipsis)),
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
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                player.weight == null
                    ? const Text(
                        '몸무게 : -',
                      )
                    : Text(
                        '몸무게 : ${player.weight}',
                      ),
                player.height == null
                    ? const Text(
                        '신장 : -',
                      )
                    : Text(
                        '신장 : ${player.height}',
                      ),
                player.age == null
                    ? const Text(
                        '나이 : -',
                      )
                    : Text(
                        '나이 : ${player.age}살',
                      ),
                player.injured
                    ? const Text(
                        '부상 O',
                        style: TextStyle(color: Colors.redAccent),
                      )
                    : const Text(
                        '부상 X',
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final String type;
  SearchBox({required this.type, Key? key}) : super(key: key);

  final debounce = Debounce(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        filled: false,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.blueGrey,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        focusColor: Colors.black12,
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        hintText: '검색',
        hintStyle: const TextStyle(fontSize: 16.0, color: Colors.blueGrey),
      ),
      onChanged: (String? value) {
        if (value != null && value!.trim().isNotEmpty) {
          debounce.run(() {
            context
                .read<PlayersBloc>()
                .add(SearchPlayerEvent(name: value, type: type));
          });
        }
      },
    );
  }
}
