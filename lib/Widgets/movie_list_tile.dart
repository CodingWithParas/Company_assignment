import 'package:flutter/material.dart';

class MovieListTile extends StatelessWidget {
  final Map<String, dynamic> movie;

  MovieListTile({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie['title'] ?? "Unknown Title"),
      subtitle: Text(movie['genre'] ?? "Unknown Genre"),
      trailing: Text("${movie['imdbRating'] ?? 'N/A'} IMDB"),
    );
  }
}
