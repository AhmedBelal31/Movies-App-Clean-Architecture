import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_architecture/core/services/bloc_observer.dart';
import 'package:movies_app_clean_architecture/core/services/service_locator.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/controller/movies_cubit/movies_cubit.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app_clean_architecture/test_screen.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MoviesScreen(),
    );
  }
}
