import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final int id;

  final List<MoviesGenreIdsEntity> genreIds;

  final String title;

  final String imageUrl;

  final String overview;

  final String releaseDate;

  final int runtime;

  final num voteAverage;

  const MovieDetailsEntity({
    required this.id,
    required this.genreIds,
    required this.title,
    required this.imageUrl,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        id,
        genreIds,
        title,
        imageUrl,
        overview,
        releaseDate,
        runtime,
        voteAverage,
      ];
}

class MoviesGenreIdsEntity extends Equatable {
  final int id;

  final String name;

  const MoviesGenreIdsEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
