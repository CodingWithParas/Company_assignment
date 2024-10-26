import 'package:flutter/material.dart';
import '../Api_services/api_services.dart';


class MovieSearchProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool isLoading = false;
  List<dynamic> movies = [];

  Future<void> searchMovies(String query) async {
    isLoading = true;
    notifyListeners();

    try {
      movies = await _apiService.searchMovies(query);
    } catch (e) {
      movies = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
