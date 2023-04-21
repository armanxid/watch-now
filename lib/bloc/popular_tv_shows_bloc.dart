import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularTvShowsBloc extends Cubit<List<dynamic>> {
  PopularTvShowsBloc() : super([]);

  Future<void> fetchPopularTvShows(String apiKey) async {
    final response = await http.get(
      Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=$apiKey"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)["results"];
      emit(data);
    } else {
      emit(state);
    }
  }
}
