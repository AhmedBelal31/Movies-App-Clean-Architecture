import 'package:movies_app_clean_architecture/modules/movies/data/models/movies_model.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

List<MovieEntity> getMoviesList(Map<String, dynamic> data) {
  List<MovieEntity> movies = [];
  for (var movieMap in data['results']) {
    movies.add(MoviesModel.fromJson(movieMap));
  }
  return movies;
}
