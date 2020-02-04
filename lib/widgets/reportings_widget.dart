import 'package:flutter/material.dart';

class ReportingsWidget extends StatelessWidget {
  final int index;

  ReportingsWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('NewPage, index: $index'),
    );
  }
}