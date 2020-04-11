
import 'package:flutter/material.dart';
import 'package:flutterlab3/dataAccessLayer/bloc/movie_details_bloc.dart';
import 'package:flutterlab3/screens/routing/router.dart' as router;
import 'package:flutterlab3/dataAccessLayer/model/screen_args.dart';
import 'package:provider/provider.dart';

import 'movie_detail_structure.dart';

class MovieDetails extends StatelessWidget {
  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieDetailsBloc(),),
      ],
      child: Consumer<MovieDetailsBloc>(
        builder: (context, counter, _) {
          Provider.of<MovieDetailsBloc>(context, listen: false).setScreenArguments(args);
          Provider.of<MovieDetailsBloc>(context, listen: false).getmovieDetails(args.id);
          return MaterialApp(

              title: 'Movie Detail',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MovieDetailStructure(),
              onGenerateRoute: router.generateRoute
          );
        },
      ),
    );
  }
}
