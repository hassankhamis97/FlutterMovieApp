
import 'package:flutterlab3/dataAccessLayer/api/movie_api.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie_details.dart';

class MovieRepository
{
  Future<List<Movie>> movies() async => await MovieApi().getMovies();

  Future<MovieDetails> movieDetails(int movieId) async {
    return await MovieApi().getMovieDetails(movieId);
  }
}