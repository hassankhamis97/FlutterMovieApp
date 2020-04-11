
import 'dart:convert';

import 'movie.dart';

MovieResults MovieResultsFromJson(String str) => MovieResults.fromJson(json.decode(str));

String MovieResultsToJson(MovieResults data) => json.encode(data.toJson());

class MovieResults {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> movies;

  MovieResults({
    this.page,
    this.totalResults,
    this.totalPages,
    this.movies,
  });

  factory MovieResults.fromJson(Map<String, dynamic> json) => MovieResults(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    movies: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_results": totalResults,
    "total_pages": totalPages,
    "results": List<dynamic>.from(movies.map((x) => x.toJson())),
  };
}