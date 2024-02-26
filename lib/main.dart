import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_clean_architecture/core/services/bloc_observer.dart';
import 'package:movies_app_clean_architecture/core/services/service_locator.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/data_source/movies_details_remote_data_source.dart';
import 'package:movies_app_clean_architecture/modules/movies/data/repos/movies_details_repo_impl.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app_clean_architecture/test_screen.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<MoviesCubit>()
        ..getPopularMovies()
        ..getNowPlayingMovies()
        ..getTopRatedMovies(),
      child: MaterialApp(
        title: 'Movies APP',
        theme: ThemeData.dark(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          // textTheme:   GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: const MoviesScreen(),
      ),
    );
  }
}
