import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/utiles/methods/build_custom_loading.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_states.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/popular_movies_list_Item.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStates>(
      builder: (context, state) {
        var moviesCubit = BlocProvider.of<MoviesCubit>(context);
        if (state is PopularMoviesSuccessState ||
            moviesCubit.popularMovies.isNotEmpty) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: moviesCubit.popularMovies.length,
                itemBuilder: (context, index) {
                  final reversedMovie =
                      moviesCubit.popularMovies.reversed.toList()[index];
                  // final randomMovie = moviesCubit.popularMovies;
                  // randomMovie.shuffle();
                  return PopularMoviesListItem(movie: reversedMovie);
                },
              ),
            ),
          );
        } else if (state is PopularMoviesFailureState) {
          return Center(child: Text('Error , ${state.errorMessage}'));
        } else {
          return buildCustomLoading();
        }
      },
    );
  }
}
