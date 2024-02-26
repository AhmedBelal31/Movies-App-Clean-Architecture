import 'package:movies_app_clean_architecture/core/services/web_service.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/models/movies_details_model.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_details_entity.dart';

abstract class MoviesDetailsRemoteDataSource {
  Future<MovieDetailsEntity> getMoviesDetails({required int movieId});
}

class MoviesDetailsRemoteDataSourceImpl extends MoviesDetailsRemoteDataSource {
  ApiService apiService;

  MoviesDetailsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<MovieDetailsEntity> getMoviesDetails({required int movieId}) async {
    var data = await apiService.getData(endPoint: '$moviesDetails$movieId');
    var movieDetails = MovieDetailsModel.fromJson(data);
    return movieDetails;
  }
}
