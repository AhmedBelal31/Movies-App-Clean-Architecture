import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

abstract class MoviesRepo {
  Future<List<MovieEntity>> getNowPlaying();

  Future<List<MovieEntity>> getPopularMovies();

  Future<List<MovieEntity>> getTopRatedMovies();
}
