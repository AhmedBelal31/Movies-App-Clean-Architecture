import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}


///States For NowPlaying
class NowPlayingMoviesLoadingStates extends MoviesStates {}

class NowPlayingMoviesSuccessState extends MoviesStates {
  List<MovieEntity> nowPlayingMovies;

  NowPlayingMoviesSuccessState({required this.nowPlayingMovies});
}

class NowPlayingMoviesFailureState extends MoviesStates {
  String errorMessage;

  NowPlayingMoviesFailureState({required this.errorMessage});
}
