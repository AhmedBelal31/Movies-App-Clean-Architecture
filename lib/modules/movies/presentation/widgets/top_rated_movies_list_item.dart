import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_architecture/core/utiles/constants/api_constants.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
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
          /// TODO : NAVIGATE TO  MOVIE DETAILS
        },
        child: ClipRRect(
          borderRadius:
          const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: imageUrl(movie.imagePath),
            placeholder: (context, url) => buildShimmerEffect(),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Shimmer buildShimmerEffect() {
    return Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              height: 170.0,
              width: 120.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          );
  }
}