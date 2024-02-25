import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/similar_movies_cubit/similar_movies_states.dart';
import 'package:shimmer/shimmer.dart';

class SimilarMoviesGridView extends StatelessWidget {
  const SimilarMoviesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarMoviesCubit, SimilarMoviesStates>(
      listener: (context, state) {
        if (state is SimilarMoviesSuccessState) {
          if (state.similarMovies.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'No Similar Movies 🥺',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                duration: Duration(milliseconds: 800),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        if (state is SimilarMoviesSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.similarMovies.isNotEmpty)
                  FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
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
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5 / 2.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl(state.similarMovies[index].posterPath),
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/No-Image-Placeholder.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  itemCount: state.similarMovies.length,
                ),
              ],
            ),
          );
        } else if (state is SimilarMoviesFailureState) {
          return Center(child: Text('Error , ${state.errorMessage}'));
        } else {
          return buildGridViewShimmerEffect();
        }
      },
    );
  }

  Widget buildGridViewShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.35,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}
