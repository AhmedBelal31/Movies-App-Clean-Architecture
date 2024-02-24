import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';
import 'package:movies_app_clean_architecture/core/utiles/methods/build_custom_loading.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/screens/movies_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedMoviesListItem extends StatelessWidget {
  const TopRatedMoviesListItem({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
                print(movie.id);
                return MoviesDetailsScreen(movieId: movie.id);
              },
            ),
          );
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: imageUrl(movie.imagePath),
            placeholder: (context, url) => buildCustomLoading(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
