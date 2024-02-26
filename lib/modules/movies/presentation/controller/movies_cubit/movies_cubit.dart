import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit({
    required this.getNowPlayingUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
  }) : super(MoviesInitialState());

  MoviesCubit get(context) => BlocProvider.of(context);

  GetNowPlayingUseCase getNowPlayingUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;

  List<MovieEntity> nowPlayingMovies = [];
  List<MovieEntity> popularMovies = [];
  List<MovieEntity> topRatedMovies = [];

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoadingStates());
    var nowPlayingMoviesOrFailure = await getNowPlayingUseCase.execute();

    nowPlayingMoviesOrFailure.fold((failure) {
      emit(NowPlayingMoviesFailureState(errorMessage: failure.errorMessage));
    }, (movies) {
      nowPlayingMovies = movies;
      // print('NowPlaying Data \n $movies');
      emit(NowPlayingMoviesSuccessState(nowPlayingMovies: movies));
    });
  }

  Future<void> getPopularMovies({int pageNumber =1}) async {
    emit(PopularMoviesLoadingStates());
    var popularMoviesOrFailure = await getPopularMoviesUseCase.execute(pageNumber);

    popularMoviesOrFailure.fold((failure) {
      emit(PopularMoviesFailureState(errorMessage: failure.errorMessage));
    }, (movies) {
      // print('Popular Data \n $movies');
      popularMovies = movies;
      emit(PopularMoviesSuccessState(popularMovies: movies));
    });
  }

  Future<void> getTopRatedMovies({int pageNumber =1}) async {
    emit(TopRatedMoviesLoadingStates());
    var topRatedMoviesOrFailure = await getTopRatedMoviesUseCase.execute(pageNumber);

    topRatedMoviesOrFailure.fold((failure) {
      emit(TopRatedMoviesFailureState(errorMessage: failure.errorMessage));
    }, (movies) {
      topRatedMovies = movies;
      // print(movies);
      emit(TopRatedMoviesSuccessState(topRatedMovies: movies));
    });
  }
}
