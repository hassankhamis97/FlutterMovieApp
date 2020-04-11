
import 'package:flutterlab3/dataAccessLayer/client_http.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie_details.dart';


class MovieApi
{
  Future<List<Movie>> getMovies() async {
    var movies = await HttpClient().getMovies();
    return movies;

  }

  Future<MovieDetails> getMovieDetails(int movieId) async {
    return await HttpClient().getMovieDetails(movieId);
  }
}