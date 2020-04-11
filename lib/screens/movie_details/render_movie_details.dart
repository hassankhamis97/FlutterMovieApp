import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab3/dataAccessLayer/bloc/movie_details_bloc.dart';
import 'package:flutterlab3/dataAccessLayer/model/icon_properties.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie_details.dart';
import 'package:provider/provider.dart';

import 'genre_listview.dart';

class RenderMovieDetails extends StatefulWidget {
  RenderMovieDetailsState createState() => RenderMovieDetailsState();
}

class RenderMovieDetailsState extends State<RenderMovieDetails> {
  @override
  Widget build(BuildContext context) {

    final MovieDetails movieDetails =
        Provider.of<MovieDetailsBloc>(context).getMovieDetailsObj;
    final IconProperties iconProperties =
    Provider.of<MovieDetailsBloc>(context).getIconProperties();
    if (movieDetails.overview != null) {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: Text(
                movieDetails.title != null ? movieDetails.title : "",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: GenreList(
                        genres: movieDetails.genres,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: iconProperties.width,

//                      color: iconProperties.iconColor,
                      child: IconButton(
//                          iconSize: iconProperties.width,
                        iconSize: iconProperties.width,
                        icon: Icon(
                          iconProperties.favoIcon,
                          color: iconProperties.iconColor,
//                          alreadySaved ? Icons.favorite : Icons.favorite_border,
//                          color: alreadySaved ? Colors.red : null,
                        ),
                        onPressed: () {
                          if (iconProperties.width == 40) {
                            MovieDetailsBloc().ratedIcon();
                          } else {
                            MovieDetailsBloc().resetIcon();
                          }
                        },
                      ),
                    ),
//                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('${movieDetails.releaseDate}'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Descriprion",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${movieDetails.overview}',
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text("Loading..."),
        ],
      );
    }
  }

}