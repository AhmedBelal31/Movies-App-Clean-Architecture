import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';

class MoviesModel extends MovieEntity {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.imagePath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'],
      title: json['title'],
      imagePath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
    );
  }
}
