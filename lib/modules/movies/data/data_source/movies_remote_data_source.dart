import 'package:movies_app_clean_architecture/core/services/web_service.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/core/methods/get_movies_list.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> getNowPlaying();

  Future<List<MovieEntity>> getPopularMovies();

  Future<List<MovieEntity>> getTopRatedMovies();
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  ApiService apiService;

  MoviesRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> getNowPlaying() async {
    var data = await apiService.getData(nowPlayingEndPoint);
    List<MovieEntity> nowPlayingMovies = getMoviesList(data);
    return nowPlayingMovies;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    var data = await apiService.getData(popularMoviesEndPoint);
    List<MovieEntity> popularMovies = getMoviesList(data);
    return popularMovies;
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    var data = await apiService.getData(topRatedMoviesEndPoint);
    List<MovieEntity> topRatedMovies = getMoviesList(data);
    return topRatedMovies;
  }
}
