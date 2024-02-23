import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/utiles/methods/build_custom_loading.dart';
import 'package:movies_app_clean_architecture/core/utiles/movies_list.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_states.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/top_rated_movies_list_item.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStates>(
      builder: (context, state) {
        var moviesCubit = BlocProvider.of<MoviesCubit>(context);
        if (state is TopRatedMoviesSuccessState ||
            moviesCubit.topRatedMovies.isNotEmpty) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: moviesCubit.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = moviesCubit.topRatedMovies[index];
                  return TopRatedMoviesListItem(movie: movie);
                },
              ),
            ),
          );
        } else if (state is TopRatedMoviesFailureState) {
          return Center(child: Text('Error , ${state.errorMessage}'));
        } else {
          return buildCustomLoading();
        }
      },
    );
  }
}
