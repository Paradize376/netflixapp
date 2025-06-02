import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {

  List<String> trendingMovies = [];

  Future<void> loadHomeData() async {

    trendingMovies = ['Movie1', 'Movie2', 'Movie3'];
    notifyListeners();
  }
}
