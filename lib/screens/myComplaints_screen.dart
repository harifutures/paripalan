import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyComplaints extends StatelessWidget {
  
  @override
  Widget build (BuildContext context) {

    return new MaterialApp(
      home: new Material(
        child: new Center(
          child: new Text("We see all the complaints reported Here...!"),
        ),
      ),
    );

  }
  
} 