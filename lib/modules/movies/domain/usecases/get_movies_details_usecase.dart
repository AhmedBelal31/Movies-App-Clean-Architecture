import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_details_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/movies_details_repo.dart';

class GetMoviesDetailsUseCase extends UseCase<MovieDetailsEntity, int> {
  MoviesDetailsRepo moviesDetailsRepo;

  GetMoviesDetailsUseCase({required this.moviesDetailsRepo});

  @override
  Future<Either<Failure, MovieDetailsEntity>> execute([int? param]) async {
    return await moviesDetailsRepo.getMoviesDetails(movieId: param!);
  }
}
