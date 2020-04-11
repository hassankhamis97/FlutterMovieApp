import 'package:flutter/foundation.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie.dart';
import 'package:flutterlab3/dataAccessLayer/repository/movie_reopository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieBloc with ChangeNotifier {
   Set<String> _saved = <String>{};
  MovieBloc._privateConstructor();
  List<Movie> movies;
  Movie selectedMovie;
  static MovieBloc _instance = MovieBloc._privateConstructor();
  void setMovie (Movie sMovie)
  {
    selectedMovie = sMovie;
//    notifyListeners();
  }
  Movie getMovie() {
    return selectedMovie;
  }
   void saveMovie(String value) {
     _saved.add(value);
     addStringToSF(value);
   }
   void deleteMovie(String value) {
     _saved.remove(value);
     addStringToSF(value);
   }

   factory MovieBloc() {
    return _instance;
  }
  void getMoviesFromApi () async
  {
    if (movies == null) {
      movies = await MovieRepository().movies();
      notifyListeners();
    }
//    return movies;
  }
   List<Movie> get getAllMovies {
//    if(_movieDetails.overview == null)
//      _movieDetails.overview = "Loading";
     return movies;
   }
  bool getSavedStatus(String title) {
    return _saved.contains(title);
  }
   int getCount(){
     return _saved.length;
   }
//
   Future<bool> getSavedFavouiteFromPref() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     List<String> data = prefs.getStringList("Favourite");
     _saved.clear();
     for(int i = 0 ; i < data.length ; i++) {
         _saved.add(data[i]);
     }
     return true;
  }
  addStringToSF(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("Favourite", _saved.toList());
    prefs.setString(title, title);
  }
}