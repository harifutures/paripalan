import 'package:flutter/material.dart';
import 'package:paripalan/screens/myService_requests_screen.dart';
import 'package:paripalan/widgets/reportings_widget.dart';

class MyServiceRequestsTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyServiceRequestsTabsState();
  }

  class MyServiceRequestsTabsState extends State<MyServiceRequestsTabs> with SingleTickerProviderStateMixin {
    TabController _controller;
    int _index;

    @override
    void initState() {
      super.initState();
      _controller = new TabController(length: 2, vsync: this);
      _index = 0;
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
          /*appBar: new AppBar(
          //title: new Text("New AppBar"),
          bottom: new TabBar(controller: _controller, tabs: <Tab>[
            new Tab(text: "My Requests"),
            new Tab(text: "Reportings"),
          ]),
      ),*/
        appBar: new AppBar(
          automaticallyImplyLeading: false, // Removes Back button
          flexibleSpace: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new TabBar(controller: _controller,
                  labelColor: Colors.white,
                  indicatorColor: Colors.purple,
                  unselectedLabelStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                  tabs: <Tab>[
                new Tab(child: Text("MY REQUESTS", style: TextStyle(fontSize: 16),)),
                new Tab(child: Text("REPORTINGS", style: TextStyle(fontSize: 16),)),
              ]),
            ],
          ),
        ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new MyServiceRequests(),
          new ReportingsWidget(_index),
        ],
      ),);


    }
}