import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

abstract class MoviesStates {}

class MoviesInitialStates extends MoviesStates {}


///States For NowPlaying
class NowPlayingMoviesLoadingStates extends MoviesStates {}

class NowPlayingMoviesSuccessStates extends MoviesStates {
  List<MovieEntity> nowPlayingMovies;

  NowPlayingMoviesSuccessStates({required this.nowPlayingMovies});
}

class NowPlayingMoviesFailureStates extends MoviesStates {
  String errorMessage;

  NowPlayingMoviesFailureStates({required this.errorMessage});
}
