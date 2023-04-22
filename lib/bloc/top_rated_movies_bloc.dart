import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_now/util/const.dart';

class TopRatedMoviesBloc extends Cubit<List<dynamic>> {
  TopRatedMoviesBloc() : super([]);

  Future<void> fetchTopRatedMovies(String apiKey) async {
    final response = await http.get(
      Uri.parse("$topRatedMoviesApi?api_key=$apiKey"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)["results"];
      emit(data);
    } else {
      emit(state);
    }
  }
}
