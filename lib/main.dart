import 'package:company_assignment/MovieSearchProvider/movie_search_provider.dart';
import 'package:company_assignment/Screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => MovieSearchProvider()),
      ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMDB Movie Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen()
    );
  }
}


