import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/squad.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/squads_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/widgets/custom_sliver_persistent_header.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = 'favorite';
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        final teams = state.favoriteTeams;
        final players = state.favoritePlayers;

        return Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 4),
          child: Stack(
            children: [
              // const BackGroundWidget(),
              Column(
                children: const [
                  BackgroundPaint(),
                  BackgroundPaint(),
                ],
              ),
              SingleChildScrollView(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                  child: Column(
                    children: [
                      FavoriteList(
                          label: 'My Favorite Team', data: teams, isTeam: true),
                      FavoriteList(
                          label: 'My Favorite Player',
                          data: players,
                          isTeam: false),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FavoriteList extends StatelessWidget {
  final String label;
  final List data;
  final bool isTeam;
  const FavoriteList({
    required this.label,
    required this.data,
    required this.isTeam,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
              // SliverPersistentHeader가 없어지지 않고 쌓인다
              pinned: false,
              floating: true,
              delegate: CustomSliverPersistentHeaderDelegate(
                child: FavoriteLabel(text: label),
                maxHeight: 50,
                minHeight: 30,
              )),
          data.isEmpty
              ? const SliverToBoxAdapter(
                  child: Text('데이터가 없습니다'),
                )
              : isTeam
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: data.length,
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TeamCard(team: data[index]),
                          );
                        },
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: data.length,
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: PlayerCard(player: data[index]),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  final DetailPlayer player;
  const PlayerCard({required this.player,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: 130,
          child: Text(player.name, overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(onPressed: () {}, child: Text('일정')),
                TextButton(onPressed: () {}, child: Text('상세보기')),
                TextButton(onPressed: () {
                  context.read<FavoriteBloc>().add(ChangeFavoritePlayerEvent(favoritePlayer: player,isInsert: false));
                }, child: Text('싫어요')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class TeamCard extends StatelessWidget {
  final Team team;
  const TeamCard({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: 130,
          child: Text(team.team.name, overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(onPressed: () {}, child: Text('일정')),
                TextButton(onPressed: () {}, child: Text('상세보기')),
                TextButton(onPressed: () {
                  context.read<FavoriteBloc>().add(ChangeFavoriteTeamEvent(favoriteTeam: team,isInsert: false));
                }, child: Text('싫어요')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BackgroundPaint extends StatelessWidget {
  const BackgroundPaint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientPainter(
        strokeWidth: 4,
        radius: 8,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.blueGrey.shade50,
            Colors.blueGrey.shade100,
            Colors.blueGrey.shade200,
            Colors.blueGrey.shade300,
          ],
        ),
      ),
      size: MediaQuery.of(context).size,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }
}

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4 * 2),
        child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
                Color(0xFFECEFF1),
                Color(0xFFECEFF1),
                Color(0xFFECEFF1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteLabel extends StatelessWidget {
  final String text;
  const FavoriteLabel({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontStyle: FontStyle.italic)),
      ],
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;
  final Paint paintObject = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    RRect innerRect2 = RRect.fromRectAndRadius(
        Rect.fromLTRB(strokeWidth, strokeWidth, size.width - (strokeWidth),
            size.height - (strokeWidth)),
        Radius.circular(radius - strokeWidth));

    RRect outerRect = RRect.fromRectAndRadius(
        Rect.fromLTRB(0, 0, size.width, size.height), Radius.circular(radius));
    paintObject.shader = gradient.createShader(Offset.zero & size);

    Path outerRectPath = Path()..addRRect(outerRect);
    Path innerRectPath2 = Path()..addRRect(innerRect2);
    canvas.drawPath(
        Path.combine(PathOperation.difference, outerRectPath, innerRectPath2),
        paintObject);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
