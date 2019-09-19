import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/main_drawer.dart';

class Subscribe extends StatelessWidget {
  static const routeName = '/subscribe';

  @override
  Widget build (BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe Form'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Please Subscribe Here..!'),
      ),
    );

  }
  
}