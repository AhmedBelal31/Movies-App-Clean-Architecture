import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

abstract class SimilarMoviesStates {}

class SimilarMoviesInitialState extends SimilarMoviesStates {}

///States For Similar Movies
class SimilarMoviesLoadingStates extends SimilarMoviesStates {}

class SimilarMoviesSuccessState extends SimilarMoviesStates {
  List<MovieEntity> similarMovies;

  SimilarMoviesSuccessState({required this.similarMovies});
}

class SimilarMoviesFailureState extends SimilarMoviesStates {
  String errorMessage;

  SimilarMoviesFailureState({required this.errorMessage});
}
