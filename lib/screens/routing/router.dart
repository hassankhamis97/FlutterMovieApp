import 'package:flutter/material.dart';
import 'package:flutterlab3/screens/movie_details/movie_details.dart';
import 'package:flutterlab3/screens/movie_list/movie_list.dart';
import 'package:flutterlab3/screens/routing/router_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MovieListViewRoute:
      return MaterialPageRoute(builder: (context) => MovieList());
    case MovieDetailsViewRoute:
      return MaterialPageRoute(builder: (context) => MovieDetails());
    default:
      return MaterialPageRoute(builder: (context) => MovieList());
  }
}