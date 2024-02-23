import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/exceptions.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/movies_repo.dart';

class MoviesRepoImpl extends MoviesRepo {
  MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepoImpl({required this.moviesRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    try {
      List<MovieEntity> nowPlayingMovies =
          await moviesRemoteDataSource.getNowPlayingMovies();
      return right(nowPlayingMovies);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      List<MovieEntity> popularMovies =
          await moviesRemoteDataSource.getPopularMovies();
      return right(popularMovies);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    try {
      List<MovieEntity> topRatedMovies =
          await moviesRemoteDataSource.getTopRatedMovies();
      return right(topRatedMovies);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }
}
