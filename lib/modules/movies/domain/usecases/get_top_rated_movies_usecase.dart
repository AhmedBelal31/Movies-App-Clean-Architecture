import 'package:movies_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/repos/movies_repo.dart';

class GetTopRatedMoviesUseCase extends UseCase<List<MovieEntity>, void> {
  MoviesRepo moviesRepo;

  GetTopRatedMoviesUseCase({required this.moviesRepo});

  @override
  Future<List<MovieEntity>> execute([void param]) async {
    return await moviesRepo.getTopRatedMovies();
  }
}
