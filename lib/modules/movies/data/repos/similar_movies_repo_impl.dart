import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/exceptions.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/data_source/similar_movies_remote_data_source.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_details_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/movies_repo.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/similar_movies_repo.dart';

class SimilarMoviesRepoImpl extends SimilarMoviesRepo {
  SimilarMoviesRemoteDataSource similarMoviesRemoteDataSource;

  SimilarMoviesRepoImpl({required this.similarMoviesRemoteDataSource});



  @override
  Future<Either<Failure, List<MovieEntity>>> getSimilarMovies({required int similarMovieId}) async {
    try {
      List<MovieEntity> similarMovies =
      await similarMoviesRemoteDataSource.getSimilarMovies(movieId: similarMovieId);
      return right(similarMovies);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }


}
