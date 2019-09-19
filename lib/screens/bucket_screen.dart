import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/main_drawer.dart';

class Bucket extends StatelessWidget {
  static const routeName = '/bucket';

  @override
  Widget build (BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Show Requests '),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('See requests reported to you..!'),
      ),
    );

  }
  
}