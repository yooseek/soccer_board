import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/players_bloc/players_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/rank_bloc/rank_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/scorers_bloc/scorers_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/selected_type_bloc/selected_type_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/squads_bloc/squads_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/teams_bloc/teams_bloc.dart';
import 'package:soccer_board/injection_container.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TeamsBloc>(create: (context)=> serviceLocator()),
        BlocProvider<RankBloc>(create: (context)=> serviceLocator()),
        BlocProvider<SquadsBloc>(create: (context)=> serviceLocator()),
        BlocProvider<ScorersBloc>(create: (context)=> serviceLocator()),
        BlocProvider<PlayersBloc>(create: (context)=> serviceLocator()),
        BlocProvider<SelectedTypeBloc>(create: (context)=> serviceLocator(),lazy: false,),
        BlocProvider<FavoriteBloc>(create: (context)=> serviceLocator()..add(InitFavoriteEvent()),lazy: false,),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: serviceLocator<GoRouter>().routerDelegate,
        routeInformationParser: serviceLocator<GoRouter>().routeInformationParser,
        routeInformationProvider: serviceLocator<GoRouter>().routeInformationProvider,
      ),
    );
  }
}