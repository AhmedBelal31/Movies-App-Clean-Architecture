import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/services/service_locator.dart';
import 'package:movies_app_clean_architecture/modules/movies/domain/entity/movie_entity.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_states.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/all_movies_item.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/all_movies_item_loading.dart';

class AllTopRatedMovies extends StatefulWidget {
  const AllTopRatedMovies({super.key});

  @override
  State<AllTopRatedMovies> createState() => _AllTopRatedMoviesState();
}

class _AllTopRatedMoviesState extends State<AllTopRatedMovies> {
  late final ScrollController _scrollController;

  bool isLoading = false;

  int nextPage = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      return addListenToListState();
    });
    super.initState();
  }

  void addListenToListState() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollLength * 0.7) {
      print('iam 70% here ');
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<MoviesCubit>(context)
            .getTopRatedMovies(pageNumber: nextPage);
        nextPage++;
        print('Page is $nextPage');
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
      ),
      body: BlocBuilder<MoviesCubit, MoviesStates>(
        builder: (context, state) {
          // print('List $allTopRatedMovies');
          var topRatedMovies =
              BlocProvider.of<MoviesCubit>(context).topRatedMovies;
          if (topRatedMovies.isNotEmpty) {
            return ListView.separated(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  AllMoviesItem(movie: topRatedMovies[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: topRatedMovies.length,
            );
          } else if (state is TopRatedMoviesFailureState) {
            return Center(child: Text('Error , ${state.errorMessage}'));
          } else {
            return allMoviesItemLoading();
          }
        },
      ),
    );
  }
}
