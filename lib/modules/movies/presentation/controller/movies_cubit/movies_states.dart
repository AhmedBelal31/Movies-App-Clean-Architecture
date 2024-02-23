import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

///States For NowPlaying Movies
class NowPlayingMoviesLoadingStates extends MoviesStates {}

class NowPlayingMoviesSuccessState extends MoviesStates {
  List<MovieEntity> nowPlayingMovies;

  NowPlayingMoviesSuccessState({required this.nowPlayingMovies});
}

class NowPlayingMoviesFailureState extends MoviesStates {
  String errorMessage;

  NowPlayingMoviesFailureState({required this.errorMessage});
}

///States For Popular Movies
class PopularMoviesLoadingStates extends MoviesStates {}

class PopularMoviesSuccessState extends MoviesStates {
  List<MovieEntity> popularMovies;

  PopularMoviesSuccessState({required this.popularMovies});
}

class PopularMoviesFailureState extends MoviesStates {
  String errorMessage;

  PopularMoviesFailureState({required this.errorMessage});
}

///States For Top Rated Movies
class TopRatedMoviesLoadingStates extends MoviesStates {}

class TopRatedMoviesSuccessState extends MoviesStates {
  List<MovieEntity> topRatedMovies;

  TopRatedMoviesSuccessState({required this.topRatedMovies});
}

class TopRatedMoviesFailureState extends MoviesStates {
  String errorMessage;

  TopRatedMoviesFailureState({required this.errorMessage});
}
