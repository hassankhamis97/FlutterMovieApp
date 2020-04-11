import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'movie_listview.dart';

class StructurePageState extends State<StructurePage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
       backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      body: Center(
       child: Movies(),
      ),
    );
  }

}
class StructurePage extends StatefulWidget {
  StructurePageState createState() => StructurePageState();
}


