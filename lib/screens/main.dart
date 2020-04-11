import 'package:flutter/material.dart';
import 'package:flutterlab3/screens/movie_list/structurePageState.dart';
import 'package:flutterlab3/screens/routing/router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Named Routing',
        onGenerateRoute: router.generateRoute
    );
  }
}

