import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:soccer_board/core/route/go_route.dart';
import 'package:soccer_board/feature/league_category/data/data_source/competition_service.dart';
import 'package:soccer_board/feature/league_category/data/data_source/hive_connection.dart';
import 'package:soccer_board/feature/league_category/data/repository/competition_repository_impl.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/team.dart';
import 'package:soccer_board/feature/league_category/domain/model/entities/top_scorer.dart';
import 'package:soccer_board/feature/league_category/domain/repository/competition_repository.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/players_bloc/players_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/rank_bloc/rank_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/scorers_bloc/scorers_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/selected_type_bloc/selected_type_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/squads_bloc/squads_bloc.dart';
import 'package:soccer_board/feature/league_category/presentation/blocs/teams_bloc/teams_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Hive Adapter
  Hive.registerAdapter(TeamAdapter()); // 0
  Hive.registerAdapter(DetailAdapter()); // 1
  Hive.registerAdapter(VenueAdapter()); // 2
  Hive.registerAdapter(DetailPlayerAdapter()); // 3
  Hive.registerAdapter(BirthAdapter()); // 4


  //dio retrofit
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  //hive connection
  serviceLocator.registerLazySingleton<HiveConnection>(() => HiveConnection());

  //data source(service)
  serviceLocator.registerLazySingleton<CompetitionService>(() => CompetitionService(serviceLocator(),baseUrl: 'https://v3.football.api-sports.io'));

  //repoimpl
  serviceLocator.registerLazySingleton<CompetitionRepository>(() => CompetitionRepositoryImpl(competitionService: serviceLocator(),hiveConnection: serviceLocator()));

  //blocs
  serviceLocator.registerFactory<TeamsBloc>(() => TeamsBloc(competitionRepository: serviceLocator()));
  serviceLocator.registerFactory<RankBloc>(() => RankBloc(competitionRepository: serviceLocator()));
  serviceLocator.registerFactory<SquadsBloc>(() => SquadsBloc(competitionRepository: serviceLocator()));
  serviceLocator.registerFactory<ScorersBloc>(() => ScorersBloc(competitionRepository: serviceLocator()));
  serviceLocator.registerFactory<PlayersBloc>(() => PlayersBloc(competitionRepository: serviceLocator()));
  serviceLocator.registerFactory<FavoriteBloc>(() => FavoriteBloc(competitionRepository: serviceLocator()));

  serviceLocator.registerFactory<SelectedTypeBloc>(() => SelectedTypeBloc());

  // go_router
  serviceLocator.registerLazySingleton<GoRouter>(() => GoRouter(
    routes: SoccerGoRouter().routes,
    initialLocation: '/splash',
    // refreshListenable: serviceLocator<AuthBloc>(),
    // redirect: serviceLocator<AuthBloc>().redirectLogic,
  ));
}