import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieBloc extends Cubit<Map<String, dynamic>> {
  MovieBloc() : super({});

  void fetchPopularMovies(String apiKey) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final movieData = jsonDecode(response.body);
      emit(movieData);
    } else {
      emit({});
    }
  }

  void fetchPopularTVShows(String apiKey) async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final movieData = jsonDecode(response.body);
      emit(movieData);
    } else {
      emit({});
    }
  }
}
