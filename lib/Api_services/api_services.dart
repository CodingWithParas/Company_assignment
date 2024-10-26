import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '1bf7f31660mshdc60b7800029caep19a2dejsn212c566de097'; // Replace with your actual key
  final String baseUrl = 'https://imdb-movies-web-series-etc-search.p.rapidapi.com';

  Future<List<dynamic>> searchMovies(String query) async {
    final url = '$baseUrl/$query.json';
    final response = await http.get(Uri.parse(url), headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'imdb-movies-web-series-etc-search.p.rapidapi.com',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'] ?? []; // Ensure it returns a list, handling potential nulls
    } else {
      throw Exception('Failed to load movies');
    }
  }
}


