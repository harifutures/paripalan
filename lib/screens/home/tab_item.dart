
import 'package:flutter/material.dart';

enum TabItem { request, myRequests, govtPolicies, more }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.request: TabItemData(title: 'Service Request', icon: Icons.record_voice_over),
    TabItem.myRequests: TabItemData(title: 'My Requests', icon: Icons.filter_list),
    TabItem.govtPolicies: TabItemData(title: 'Govt Policies', icon: Icons.insert_chart),
    TabItem.more: TabItemData(title: 'More', icon: Icons.more_horiz),
  };
}