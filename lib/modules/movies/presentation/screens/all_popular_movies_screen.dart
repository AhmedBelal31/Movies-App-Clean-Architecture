import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/services/service_locator.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_states.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/all_movies_item.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/all_movies_item_loading.dart';

class AllPopularMovies extends StatelessWidget {
  const AllPopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text( 'Popular Movies'),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
      ),
      body: BlocBuilder<MoviesCubit, MoviesStates>(
        builder: (context, state) {
          var moviesCubit = BlocProvider.of<MoviesCubit>(context);
          if (moviesCubit.topRatedMovies.isNotEmpty) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  AllMoviesItem(movie: moviesCubit.popularMovies[index]),
              separatorBuilder: (context, index) =>
              const SizedBox(height: 10),
              itemCount: 8,
            );

          }
          else if (state is PopularMoviesFailureState) {
            return Center(child: Text('Error , ${state.errorMessage}'));
          }
          else {
            return allMoviesItemLoading();
          }
        },
      ),
    );
  }
}
