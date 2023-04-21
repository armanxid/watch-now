import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularDataBloc extends Cubit<List<dynamic>> {
  PopularDataBloc() : super([]);

  Future<void> fetchPopularData(String apiEndpoint, String apiKey) async {
    final response = await http.get(
      Uri.parse("$apiEndpoint?api_key=$apiKey"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)["results"];
      emit(data);
    } else {
      emit(state);
    }
  }
}
