import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_architecture/core/utiles/movies_list.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/popular_movies_list_Item.dart';


class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            final movie = moviesList[index];
            return PopularMoviesListItem(movie: movie);
          },
        ),
      ),
    );
  }
}
