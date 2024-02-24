import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.id,
    required super.genreIds,
    required super.title,
    required super.imageUrl,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      genreIds: List.from(json['genres'].map((e) => MoviesGenreIdsModel.fromJson(e))),
      title: json['title'],
      imageUrl: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      voteAverage: json['vote_average'],
    );
  }
}

class MoviesGenreIdsModel extends MoviesGenreIdsEntity {
  const MoviesGenreIdsModel({
    required super.id,
    required super.name,
  });

  factory MoviesGenreIdsModel.fromJson(Map<String, dynamic> json) {
    return MoviesGenreIdsModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
