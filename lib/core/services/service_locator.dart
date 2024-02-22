import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_architecture/core/services/web_service.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/repos/movies_repo_impl.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/movies_repo.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  ///Register Api Service
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  ///Register Remote DataSource
  getIt.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(apiService: getIt.get<ApiService>()));

  ///Register Movies Repo Impl
  getIt.registerLazySingleton<MoviesRepo>(() => MoviesRepoImpl(
      moviesRemoteDataSource: getIt.get<MoviesRemoteDataSource>()));

  /// Register GetNowPlayingUseCase
  getIt.registerLazySingleton<GetNowPlayingUseCase>(
      () => GetNowPlayingUseCase(moviesRepo: getIt.get<MoviesRepo>()));

  ///Register MoviesCubit
  getIt.registerLazySingleton<MoviesCubit>(() =>
      MoviesCubit(getNowPlayingUseCase: getIt.get<GetNowPlayingUseCase>()));
}
