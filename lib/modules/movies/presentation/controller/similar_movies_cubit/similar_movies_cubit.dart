import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_similar_movies_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/similar_movies_cubit/similar_movies_states.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesStates> {
  SimilarMoviesCubit({
    required this.getSimilarMoviesUseCase,
  }) : super(SimilarMoviesInitialState());

  GetSimilarMoviesUseCase getSimilarMoviesUseCase;

  Future<void> getSimilarMovies({required int similarMovie}) async {
    emit(SimilarMoviesLoadingStates());
    var similarMoviesOrFailure =
        await getSimilarMoviesUseCase.execute(similarMovie);

    similarMoviesOrFailure.fold((failure) {
      emit(SimilarMoviesFailureState(errorMessage: failure.errorMessage));
    }, (movies) {
      emit(SimilarMoviesSuccessState(similarMovies: movies));
    });
  }
}
