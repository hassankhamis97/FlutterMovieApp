import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab3/dataAccessLayer/model/genre.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie.dart';
import 'package:flutterlab3/dataAccessLayer/model/movie_details.dart';

class GenreList extends StatelessWidget {
  List<Genre> genres;

  GenreList({@required this.genres});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        height: 50,
        child: ListView.builder(
//          padding: EdgeInsets.fromLTRB(50,0,50,0),

          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: ActionChip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(
                  genres[index].name,
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),
                onPressed: () => {},
                backgroundColor: Colors.white70,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
