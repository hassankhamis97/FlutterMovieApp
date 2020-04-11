import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab3/dataAccessLayer/model/icon_properties.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie_details.dart';
import 'package:flutterlab3/dataAccessLayer/repository/movie_reopository.dart';
import 'package:flutterlab3/dataAccessLayer/model/screen_args.dart';

class MovieDetailsBloc with ChangeNotifier {
  ScreenArguments screenArguments;
  MovieDetails _movieDetails = new MovieDetails();
  MovieDetailsBloc._privateConstructor();
  int movieID = null;
  static MovieDetailsBloc _instance = MovieDetailsBloc._privateConstructor();
  factory MovieDetailsBloc() {
    return _instance;
  }
  void setScreenArguments(ScreenArguments screenArguments) {
    this.screenArguments = screenArguments;
//    notifyListeners();
  }

  ScreenArguments getScreenArguments() {
    return screenArguments;
  }

  void getmovieDetails(int movieId) async {
//    _movieDetails.overview = "loading";

    if (movieID != movieId) {
      movieID = movieId;
      _movieDetails = new MovieDetails();
      _movieDetails = await MovieRepository().movieDetails(movieId);
      resetIcon();
      notifyListeners();
    }
  }

  MovieDetails get getMovieDetailsObj {
//    if(_movieDetails.overview == null)
//      _movieDetails.overview = "Loading";
    return _movieDetails;
  }
  IconProperties iconProperties = new IconProperties(30, Colors.blueGrey, Icons.star_border);
//  void setIconProperties(IconProperties iconProperties) {
//    this.iconProperties = iconProperties;
//    notifyListeners();
//  }

  IconProperties getIconProperties() {
    return iconProperties;
  }
  @override
  void dispose() {}

  void resetIcon() {
    iconProperties.width = 40;
    iconProperties.favoIcon = Icons.star_border;
    iconProperties.iconColor = Colors.blueGrey;
    notifyListeners();
  }
  void ratedIcon() {
    iconProperties.width = 60;
    iconProperties.favoIcon = Icons.star;
    iconProperties.iconColor = Colors.yellow;
    notifyListeners();
  }
}
