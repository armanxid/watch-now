import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_now/bloc/popular_movies_bloc.dart';
import 'package:watch_now/page/MoviePage.dart';
import 'package:watch_now/util/const.dart';

void main() {
  runApp(MyApp(
    popularMoviesBloc: PopularDataBloc()..fetchPopularData(movieApi, apiKey),
    popularTvShowsBloc: PopularDataBloc()..fetchPopularData(tvApi, apiKey),
    topRatedMoviesBloc: PopularDataBloc()
      ..fetchPopularData(topRatedMoviesApi, apiKey),
    nowPlayingMoviesBloc: PopularDataBloc()
      ..fetchPopularData(nowPlayingMoviesApi, apiKey),
  ));
}

class MyApp extends StatelessWidget {
  final PopularDataBloc popularMoviesBloc;
  final PopularDataBloc popularTvShowsBloc;
  final PopularDataBloc topRatedMoviesBloc;
  final PopularDataBloc nowPlayingMoviesBloc;

  const MyApp(
      {Key? key,
      required this.popularMoviesBloc,
      required this.popularTvShowsBloc,
      required this.topRatedMoviesBloc,
      required this.nowPlayingMoviesBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PopularDataPage(
        popularMoviesBloc: popularMoviesBloc,
        popularTvShowsBloc: popularTvShowsBloc,
        topRatedMoviesBloc: topRatedMoviesBloc,
        nowPlayingMoviesBloc: nowPlayingMoviesBloc,
      ),
    );
  }
}
