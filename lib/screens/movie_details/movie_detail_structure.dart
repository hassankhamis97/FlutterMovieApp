import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab3/dataAccessLayer/bloc/movie_details_bloc.dart';
import 'package:flutterlab3/dataAccessLayer/model/icon_properties.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie_details.dart';
import 'package:flutterlab3/dataAccessLayer/model/screen_args.dart';
import 'package:flutterlab3/screens/movie_details/render_movie_details.dart';
import 'package:provider/provider.dart';

import 'genre_listview.dart';

class MovieDetailStructureState extends State<MovieDetailStructure> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args =
        Provider.of<MovieDetailsBloc>(context).getScreenArguments();
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.cyan[50],

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 0,
              child: Hero(
                tag: args.id,
                flightShuttleBuilder: (BuildContext flightContext,
                        Animation<double> animation,
                        HeroFlightDirection flightDirection,
                        BuildContext fromHeroContext,
                        BuildContext toHeroContext) =>
                    Material(child: toHeroContext.widget),
                child: Container(
                  color: Colors.cyan[50],
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      args.posterPath),
                            ),
                          ),
                        ),
//                      SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            RenderMovieDetails(),
          ],
        ),
      ),
    );
  }

}

class MovieDetailStructure extends StatefulWidget {
  MovieDetailStructureState createState() => MovieDetailStructureState();
}
