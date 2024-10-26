import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../MovieSearchProvider/movie_search_provider.dart';
import '../Widgets/movie_list_tile.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMDB Movie Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for a movie...",
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                Provider.of<MovieSearchProvider>(context, listen: false).searchMovies(query);
              },
            ),
          ),
          Expanded(
            child: Consumer<MovieSearchProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (provider.movies.isEmpty) {
                  return Center(child: Text("No movies found."));
                }
                return ListView.builder(
                  itemCount: provider.movies.length,
                  itemBuilder: (context, index) {
                    final movie = provider.movies[index];
                    return MovieListTile(movie: movie);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
