import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String imagePath;
  final String posterPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.posterPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        imagePath,
        posterPath,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
      ];
}
