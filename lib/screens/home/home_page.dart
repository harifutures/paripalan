
import 'package:flutter/material.dart';
import './cupertino_home_scaffold.dart';
import '../service_request_screen.dart';
import '../myService_requests_screen.dart';
import '../policies_screen.dart';
import '../more_screen.dart';
import '../profile_screen.dart';
import './tab_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.request;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.request: (_) => ServiceRequestScreen(),
      TabItem.myRequests: (_) => MyServiceRequests(),
      TabItem.govtPolicies: (_) => GovtPolicies(),
      //TabItem.more: (_) => More(),
      TabItem.more: (_) => Profile(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }

}
