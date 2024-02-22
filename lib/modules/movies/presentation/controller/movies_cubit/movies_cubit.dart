import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit({required this.getNowPlayingUseCase})
      : super(MoviesInitialStates());

  MoviesCubit get(context) => BlocProvider.of(context);

  GetNowPlayingUseCase getNowPlayingUseCase;

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoadingStates());
    var nowPlayingMoviesOrFailure = await getNowPlayingUseCase.execute();

    nowPlayingMoviesOrFailure.fold((failure) {
      emit(NowPlayingMoviesFailureStates(errorMessage: failure.errorMessage));
    }, (movies) {
      print(movies);
      emit(NowPlayingMoviesSuccessStates(nowPlayingMovies: movies));
    });
  }
}
