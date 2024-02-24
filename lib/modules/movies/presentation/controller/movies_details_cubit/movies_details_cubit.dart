import 'package:bloc/bloc.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_details_cubit/movies_details_states.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsStates> {
  MoviesDetailsCubit({required this.getMoviesDetailsUseCase})
      : super(MoviesDetailsInitialState());

  GetMoviesDetailsUseCase getMoviesDetailsUseCase;

  Future<void> getMoviesDetails({required int id}) async {
    emit(MoviesDetailsLoadingState());
    var result = await getMoviesDetailsUseCase.execute(id);

    result.fold(
        (failure) =>
            emit(MoviesDetailsFailureState(errorMessage: failure.errorMessage)),
        (movieDetails) {
      emit(MoviesDetailsSuccessState(movieDetailsEntity: movieDetails));
    });
  }
}
