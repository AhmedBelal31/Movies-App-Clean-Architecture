import 'package:movies_app_clean_architecture/core/services/web_service.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';
import 'package:movies_app_clean_architecture/core/utiles/methods/get_movies_list.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

abstract class SimilarMoviesRemoteDataSource {
  Future<List<MovieEntity>> getSimilarMovies({required int movieId});
}

class SimilarMoviesRemoteDataSourceImpl extends SimilarMoviesRemoteDataSource {
  ApiService apiService;

  SimilarMoviesRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> getSimilarMovies({required int movieId}) async {
    var data = await apiService.getData('$similarDetails$movieId/similar');
    var movieDetails = getMoviesList(data);
    // print('Similar movies ${movieDetails}');
    return movieDetails;
  }
}
