import 'package:flutter/material.dart';
import 'package:movies_app_clean_architecture/core/services/service_locator.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/screens/movies_screen.dart';

void main()  {
   setupServiceLocator() ;
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
      home: MoviesScreen(),
    );
  }
}


