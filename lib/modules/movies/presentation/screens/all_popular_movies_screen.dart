import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/services/service_locator.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_states.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/all_movies_item.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/widgets/all_movies_item_loading.dart';

class AllPopularMovies extends StatefulWidget {
  const AllPopularMovies({super.key});

  @override
  State<AllPopularMovies> createState() => _AllPopularMoviesState();
}

class _AllPopularMoviesState extends State<AllPopularMovies> {
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
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<MoviesCubit>(context)
            .getPopularMovies(pageNumber: nextPage);
        nextPage++;
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
        title: const Text('Popular Movies'),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
      ),
      body: BlocBuilder<MoviesCubit, MoviesStates>(
        builder: (context, state) {
          var popularMovies =
              BlocProvider.of<MoviesCubit>(context).popularMovies;
          if (popularMovies.isNotEmpty) {
            return ListView.separated(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  AllMoviesItem(movie: popularMovies[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: popularMovies.length,
            );
          } else if (state is PopularMoviesFailureState) {
            return Center(child: Text('Error , ${state.errorMessage}'));
          } else {
            return allMoviesItemLoading();
          }
        },
      ),
    );
  }
}
