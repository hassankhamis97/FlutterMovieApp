import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab3/dataAccessLayer/model/icon_properties.dart';
class MovieFavouriteAnimatedBloc with ChangeNotifier {
  MovieFavouriteAnimatedBloc._privateConstructor();
  static MovieFavouriteAnimatedBloc _instance = MovieFavouriteAnimatedBloc._privateConstructor();
  factory MovieFavouriteAnimatedBloc() {
    return _instance;
  }
  IconProperties iconProperties = new IconProperties(60, Colors.blueGrey, Icons.star_border);
  void setIconProperties(IconProperties iconProperties) {
    this.iconProperties = iconProperties;
    notifyListeners();
  }

  IconProperties getIconProperties() {
    return iconProperties;
  }
}
