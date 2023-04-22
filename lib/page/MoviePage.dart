import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_now/bloc/popular_movies_bloc.dart';

class PopularDataPage extends StatelessWidget {
  final PopularDataBloc popularMoviesBloc;
  final PopularDataBloc popularTvShowsBloc;
  final PopularDataBloc topRatedMoviesBloc;
  final PopularDataBloc nowPlayingMoviesBloc;

  const PopularDataPage(
      {Key? key,
      required this.popularMoviesBloc,
      required this.popularTvShowsBloc,
      required this.topRatedMoviesBloc,
      required this.nowPlayingMoviesBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch Now!"),
      ),
      body: BlocBuilder<PopularDataBloc, List<dynamic>>(
        bloc: popularMoviesBloc,
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Now Playing...",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: BlocBuilder<PopularDataBloc, List<dynamic>>(
                    bloc: nowPlayingMoviesBloc,
                    builder: (context, state) {
                      if (state.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            final nowPlaying = state[index];
                            return Container(
                              margin: EdgeInsets.only(left: 16.0),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500${nowPlaying["poster_path"]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      nowPlaying["title"],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                          nowPlaying['vote_average'].toString())
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Popular Movies",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final movie = state[index];
                      return Container(
                        margin: EdgeInsets.only(left: 16.0),
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500${movie["poster_path"]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                movie["title"],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate,
                                  color: Colors.amber,
                                ),
                                Text(movie['vote_average'].toString())
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Popular TV Shows",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: BlocBuilder<PopularDataBloc, List<dynamic>>(
                    bloc: popularTvShowsBloc,
                    builder: (context, state) {
                      if (state.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            final tvShow = state[index];
                            return Container(
                              margin: EdgeInsets.only(left: 16.0),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500${tvShow["poster_path"]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      tvShow["name"],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate,
                                        color: Colors.amber,
                                      ),
                                      Text(tvShow['vote_average'].toString())
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Top Rated Movies",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: BlocBuilder<PopularDataBloc, List<dynamic>>(
                    bloc: topRatedMoviesBloc,
                    builder: (context, state) {
                      if (state.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            final topRated = state[index];
                            return Container(
                              margin: EdgeInsets.only(left: 16.0),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500${topRated["poster_path"]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      topRated["title"],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate,
                                        color: Colors.amber,
                                      ),
                                      Text(topRated['vote_average'].toString())
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
