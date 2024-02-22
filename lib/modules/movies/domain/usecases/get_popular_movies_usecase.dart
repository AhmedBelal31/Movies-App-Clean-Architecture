import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/movies_repo.dart';

class GetPopularMoviesUseCase extends UseCase<List<MovieEntity>, void> {
  MoviesRepo moviesRepo;

  GetPopularMoviesUseCase({required this.moviesRepo});

  @override
  Future<Either<Failure, List<MovieEntity>>> execute([void param]) async {
    return await moviesRepo.getPopularMovies();
  }
}
