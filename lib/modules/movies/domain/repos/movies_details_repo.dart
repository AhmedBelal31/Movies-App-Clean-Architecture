import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_details_entity.dart';

abstract class MoviesDetailsRepo {
  Future<Either<Failure, MovieDetailsEntity>> getMoviesDetails(
      {required int movieId});
}
