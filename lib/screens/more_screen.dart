import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class More extends StatelessWidget {
  
  @override
  Widget build (BuildContext context) {

    return new MaterialApp(
      home: new Material(
        child: new Center(
          child: new Text("Check here for more stuff..!"),
        ),
      ),
    );

  }
  
}