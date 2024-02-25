import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_clean_architecture/core/services/service_locator.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';
import 'package:movies_app_clean_architecture/core/utiles/styles.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_details_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_details_cubit/movies_details_states.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/screens/movies_details_screen.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/movie_banner.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/movie_details_custom_loading.dart';
import 'package:shimmer/shimmer.dart';

class MoviesDetailsScreen extends StatelessWidget {
  const MoviesDetailsScreen({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesDetailsCubit(
          getMoviesDetailsUseCase: getIt.get<GetMoviesDetailsUseCase>())
        ..getMoviesDetails(id: movieId),
      child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsStates>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: state is! MoviesDetailsSuccessState
                  ? const CustomLoadingIndicator()
                  : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MovieBanner(movie: state.movieDetailsEntity),
                          FadeInUp(
                            from: 20,
                            duration: const Duration(milliseconds: 500),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.movieDetailsEntity.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  buildMovieRatingAndDate(state),
                                  const SizedBox(height: 20.0),
                                  Text(
                                    state.movieDetailsEntity.overview,
                                    style: Styles.textStyle14,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    'Genres: ${_showGenres(state.movieDetailsEntity.genreIds)}',
                                    // 'Genres: ${state.movieDetailsEntity.genreIds[0]}',
                                    style: Styles.textStyle14.copyWith(
                                      color: Colors.grey[800] ,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FadeInUp(
                            from: 20,
                            duration: const Duration(milliseconds: 500),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16 , bottom: 16),
                              child: Text(
                                'More like this'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1 / 1.35,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              itemCount: 6,
                            ),
                          ),
                        ],
                      ),
                  ),

              // : const CustomLoadingIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget buildMovieRatingAndDate(MoviesDetailsSuccessState state) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            // movie.releaseDate.split('-')[0],
            state.movieDetailsEntity.releaseDate.split('-')[0],
            style: Styles.textStyle16.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(width: 16.0),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20.0,
            ),
            const SizedBox(width: 4.0),
            Text(
              (state.movieDetailsEntity.voteAverage / 2).toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Text(
          _showDuration(state.movieDetailsEntity.runtime),
          style: Styles.textStyle16,
        ),
      ],
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  String _showGenres(List<MoviesGenreIdsEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}




