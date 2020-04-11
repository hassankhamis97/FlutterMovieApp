import 'dart:convert';
import 'package:flutterlab3/dataAccessLayer/model/movie_details.dart';
import 'package:http/http.dart' as http;
import 'model/movie_results.dart';

class HttpClient{

  Future<List> getMovies() async {

    final moviesListAPIUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc';
    final response = await http.get(moviesListAPIUrl);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      MovieResults movieList = MovieResults.fromJson(jsonResponse);
      return movieList.movies;
    } else {
      throw Exception('Failed to load Movies from API');
    }
  }

  Future<MovieDetails> getMovieDetails(int movieId) async {
    final moviesDetailsAPIUrl = 'https://api.themoviedb.org/3/movie/'+ movieId.toString() +'?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US';
    final response = await http.get(moviesDetailsAPIUrl);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      MovieDetails movieDetails = MovieDetails.fromJson(jsonResponse);
      return movieDetails;
    } else {
      throw Exception('Failed to load Movies from API');
    }
  }
}