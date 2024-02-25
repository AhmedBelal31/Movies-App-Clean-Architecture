import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/similar_movies_repo.dart';

class GetSimilarMoviesUseCase extends UseCase<List<MovieEntity>, int> {
  SimilarMoviesRepo similarMoviesRepo;

  GetSimilarMoviesUseCase({required this.similarMoviesRepo});

  @override
  Future<Either<Failure, List<MovieEntity>>> execute([int? param]) async {
    return await similarMoviesRepo.getSimilarMovies(similarMovieId: param!);
  }
}
