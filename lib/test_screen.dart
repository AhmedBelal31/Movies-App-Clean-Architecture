import 'package:flutter/material.dart';
import 'package:movies_app_clean_architecture/modules/movies/presentation/screens/movies_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

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
