import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/data_source/movies_details_remote_data_source.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_details_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/movies_details_repo.dart';

class MoviesDetailsRepoImpl extends MoviesDetailsRepo {
  MoviesDetailsRemoteDataSource moviesDetailsRemoteDataSource;

  MoviesDetailsRepoImpl({required this.moviesDetailsRemoteDataSource});

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMoviesDetails(
      {required int movieId}) async {
    try {
      var moviesDetailsOrFailure = await moviesDetailsRemoteDataSource
          .getMoviesDetails(movieId: movieId);
      return right(moviesDetailsOrFailure);
    } on ServerFailure catch (failure) {
      return left(ServerFailure(errorMessage: failure.errorMessage));
    }
  }
}
