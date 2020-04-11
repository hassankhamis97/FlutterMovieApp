import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab3/dataAccessLayer/bloc/movieBloc.dart';
import 'package:flutterlab3/screens/movie_details/movie_details.dart';
import 'package:flutterlab3/screens/movie_list/structurePageState.dart';
import 'package:flutterlab3/screens/routing/router.dart' as router;
import 'package:flutterlab3/screens/routing/router_constants.dart';
import 'package:provider/provider.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieBloc(),
        ),
      ],
      child: Consumer<MovieBloc>(builder: (context, counter, _) {
        Provider.of<MovieBloc>(context, listen: false)
            .getMoviesFromApi();
        return MaterialApp(
            routes: {
              MovieDetailsViewRoute: (context) => MovieDetails(),
            },
            title: 'Movies',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: StructurePage(),
            onGenerateRoute: router.generateRoute);
      }),
    );
  }
}
