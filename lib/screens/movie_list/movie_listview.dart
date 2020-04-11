import 'package:flutter/material.dart';
import 'package:flutterlab3/dataAccessLayer/bloc/movieBloc.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie.dart';
import 'package:flutterlab3/screens/routing/router_constants.dart';
import 'package:flutterlab3/dataAccessLayer/model/screen_args.dart';
import 'package:provider/provider.dart';


class MoviesListView extends State<Movies> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    MovieBloc().getSavedFavouiteFromPref().then((bool result) {
      setState(() {
        count = MovieBloc().getCount();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = Provider.of<MovieBloc>(context).getAllMovies;
    if (movies != null) {

      return _moviesListView(movies);
    } else {
      return Center(
        heightFactor: 50.0,
        widthFactor: 50.0,
        child: CircularProgressIndicator(),
      );
    }
  }
  ListView _moviesListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index]);
        });
  }
  Widget _tile(Movie movie) {
    final alreadySaved = MovieBloc().getSavedStatus(movie.title);
    return Card(

      child: Hero(
        tag: movie.id,
        flightShuttleBuilder: (BuildContext flightContext, Animation<double> animation, HeroFlightDirection flightDirection, BuildContext fromHeroContext, BuildContext toHeroContext) => Material(child: toHeroContext.widget),

        child: ListTile(
          title: Text(movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,

              )),
          subtitle: Text(
            movie.overview,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ) ,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network("https://image.tmdb.org/t/p/w185" + movie.posterPath),
          ),
          trailing:
          IconButton(

              icon: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  if (alreadySaved) {
                    MovieBloc().deleteMovie(movie.title);
                    setState(() {
                      count--;
                    });
                  } else {
                    MovieBloc().saveMovie(movie.title);
                    setState(() {
                      count++;
                    });
                  }
                });
              }
          ),

          onTap: () {
            Navigator.pushNamed(
              context,
              MovieDetailsViewRoute,
              arguments: ScreenArguments(
                movie.id,
                movie.posterPath,
              ),
            );
          },
        ),
      ),
    );
  }
}
class Movies extends StatefulWidget {
  @override
  MoviesListView createState() => MoviesListView();
}