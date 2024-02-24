import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/screens/movies_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    BlocProvider.of<MoviesDetailsCubit>(context).getMoviesDetails(id: 1072790);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MoviesScreen(),
              ),
            );
          },
          child:const  Text('Go To Home'),
        ),
      ),
    );
  }
}
