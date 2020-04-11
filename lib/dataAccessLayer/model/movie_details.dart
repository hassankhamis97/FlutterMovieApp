// To parse this JSON data, do
//
//     final movieDetails = movieDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:flutterlab3/dataAccessLayer/model/icon_properties.dart';

import 'genre.dart';

MovieDetails movieDetailsFromJson(String str) => MovieDetails.fromJson(json.decode(str));

String movieDetailsToJson(MovieDetails data) => json.encode(data.toJson());

class MovieDetails {
  String backdropPath;
  int budget;
  List<Genre> genres;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  MovieDetails({
    this.backdropPath,
    this.budget,
    this.genres,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
    backdropPath: json["backdrop_path"],
    budget: json["budget"],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    releaseDate: json["release_date"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "budget": budget,
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "id": id,
    "overview": overview,
    "poster_path": posterPath,
    "release_date": releaseDate,
    "title": title,
  };
}


