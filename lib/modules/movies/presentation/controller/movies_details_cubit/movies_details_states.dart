import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_details_entity.dart';

abstract class MoviesDetailsStates {}

class MoviesDetailsInitialState extends MoviesDetailsStates {}

class MoviesDetailsLoadingState extends MoviesDetailsStates {}

class MoviesDetailsSuccessState extends MoviesDetailsStates {
  MovieDetailsEntity movieDetailsEntity;

  MoviesDetailsSuccessState({required this.movieDetailsEntity});
}

class MoviesDetailsFailureState extends MoviesDetailsStates {
  String errorMessage;

  MoviesDetailsFailureState({required this.errorMessage});
}
