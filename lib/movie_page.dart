import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_now/movie_bloc.dart';

class MoviePage extends StatelessWidget {
  final String apiKey;

  const MoviePage({Key? key, required this.apiKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularMoviesBloc = MovieBloc()..fetchPopularMovies(apiKey);
    final popularTVShowsBloc = MovieBloc()..fetchPopularTVShows(apiKey);

    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Movie'),
      ),
      body: BlocBuilder<MovieBloc, Map<String, dynamic>>(
        bloc: popularMoviesBloc,
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final movies = state['results'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Popular Movies',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      final title = movie['title'];
                      final imageUrl =
                          'https://image.tmdb.org/t/p/w500/${movie['poster_path']}';

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Image.network(
                              imageUrl,
                              width: 75,
                              height: 112.5,
                            ),
                            SizedBox(height: 4),
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
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
