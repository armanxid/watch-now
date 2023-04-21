import 'package:flutter/material.dart';
import 'package:watch_now/movie_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final apiKey = '6036ea2ac46ff5cda401bf260987f937';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviePage(apiKey: apiKey),
    );
  }
}
