import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_states.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingCarouselSlider extends StatelessWidget {
  const NowPlayingCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesStates>(
      builder: (context, state) {
        print('nowPlayingMovies rebuild ');
        var moviesCubit = BlocProvider.of<MoviesCubit>(context);
        //Arrange the list randomly
        final randomMovie = moviesCubit.nowPlayingMovies;
        randomMovie.shuffle();
        if (state is NowPlayingMoviesSuccessState ||
            moviesCubit.nowPlayingMovies.isNotEmpty) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
                autoPlayCurve: Curves.easeInToLinear,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: randomMovie.map(
                (item) {
                  return buildCarouselSliderItem(item);
                },
              ).toList(),
            ),
          );
        } else if (state is NowPlayingMoviesFailureState) {
          return Center(child: Text('Error , ${state.errorMessage}'));
        } else {
          return buildCarouselSliderLoading();
        }
      },
    );
  }

  Shimmer buildCarouselSliderLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: 400.0,
        width: double.infinity,
        color: Colors.black,
      ),
    );
  }

  Widget buildCarouselSliderItem(item) {
    return GestureDetector(
      key: const Key('openMovieMinimalDetail'),
      onTap: () {
        /// TODO : NAVIGATE TO MOVIE DETAILS
      },
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // fromLTRB
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0, 0.3, 0.5, 1],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              height: 560.0,
              imageUrl: imageUrl(item.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.redAccent,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        'Now Playing'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
