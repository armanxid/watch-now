import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_now/bloc/popular_movies_bloc.dart';
import 'package:watch_now/page/MoviePage.dart';

final String movieApi = "https://api.themoviedb.org/3/movie/popular";
final String tvApi = "https://api.themoviedb.org/3/tv/popular";
final String apiKey = "6036ea2ac46ff5cda401bf260987f937";

void main() {
  runApp(MyApp(
    popularMoviesBloc: PopularDataBloc()..fetchPopularData(movieApi, apiKey),
    popularTvShowsBloc: PopularDataBloc()..fetchPopularData(tvApi, apiKey),
  ));
}

class MyApp extends StatelessWidget {
  final PopularDataBloc popularMoviesBloc;
  final PopularDataBloc popularTvShowsBloc;

  const MyApp({
    Key? key,
    required this.popularMoviesBloc,
    required this.popularTvShowsBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name Here',
      home: PopularDataPage(
        popularMoviesBloc: popularMoviesBloc,
        popularTvShowsBloc: popularTvShowsBloc,
      ),
    );
  }
}
