import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

abstract class SimilarMoviesRepo {
  Future<Either<Failure, List<MovieEntity>>> getSimilarMovies({required int similarMovieId});
}
