import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture/core/error/failure.dart';
import 'package:movies_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/movies_repo.dart';

class GetTopRatedMoviesUseCase extends UseCase<List<MovieEntity>, int> {
  MoviesRepo moviesRepo;

  GetTopRatedMoviesUseCase({required this.moviesRepo});

  @override
  Future<Either<Failure, List<MovieEntity>>> execute([int? param]) async {
    return await moviesRepo.getTopRatedMovies(pageNumber: param!);
  }
}
