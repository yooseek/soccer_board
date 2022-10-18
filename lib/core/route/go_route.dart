import 'package:go_router/go_router.dart';
import 'package:soccer_board/core/presentation/screens/root_screen.dart';
import 'package:soccer_board/core/presentation/screens/splash_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/favorite_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/league_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/players_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/rank_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/show_venue.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/squads_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/team_detail_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/teams_screen.dart';
import 'package:soccer_board/feature/league_category/presentation/screens/top_scorers_screen.dart';

class SoccerGoRouter {
  SoccerGoRouter();

  List<GoRoute> get routes => [
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/root',
          name: RootScreen.routeName,
          builder: (context, state) => const RootScreen(),
          routes: [
            GoRoute(
              path: 'rank/:type',
              name: RankScreen.routeName,
              builder: (context, state) => RankScreen(
                type: state.params['type']!,
              ),
            ),
            GoRoute(
              path: 'scorer/:type',
              name: TopScorersScreen.routeName,
              builder: (context, state) => TopScorersScreen(
                type: state.params['type']!,
              ),
            ),
            GoRoute(
              path: 'players/:type',
              name: PlayersScreen.routeName,
              builder: (context, state) => PlayersScreen(
                type: state.params['type']!,
              ),
            ),
            GoRoute(
              path: 'detailTeams/:type',
              name: DetailTeamsScreen.routeName,
              builder: (context, state) => DetailTeamsScreen(
                type: state.params['type']!,
              ),
              routes: [
                GoRoute(
                  path: 'squads/:team',
                  name: SquadsScreen.routeName,
                  builder: (context, state) => SquadsScreen(
                    team: state.params['team']!,
                  ),
                ),
              ]
            ),
          ],
        ),
        GoRoute(
          path: '/league',
          name: LeagueScreen.routeName,
          builder: (context, state) => const LeagueScreen(),
        ),
        GoRoute(
          path: '/teams',
          name: TeamsScreen.routeName,
          builder: (context, state) => TeamsScreen(),
        ),
        GoRoute(
          path: '/favorite',
          name: FavoriteScreen.routeName,
          builder: (context, state) => FavoriteScreen(),
        ),
      ];

  String? redirectLogic(GoRouterState state) {
    print('Gorouter_state : $state');

    return null;
  }
}
