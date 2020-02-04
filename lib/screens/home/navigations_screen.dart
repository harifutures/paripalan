import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paripalan/widgets/main_drawer.dart';
import '../service_request_screen.dart';
import '../myService_requests_screen.dart';
import '../../widgets/myService_requests_tabs_widget.dart';
import '../policies_screen.dart';
import '../more_screen.dart';
import '../profile_screen.dart';

class NavigationPage extends StatefulWidget {
  int tabIndex;
  static const routeName = "/navigationsPage";
  NavigationPage({Key key, this.tabIndex}) : super(key: key);

  @override
  NavigationPageState createState() => NavigationPageState();

}

class NavigationPageState extends State<NavigationPage> {//}with SingleTickerProviderStateMixin {

  int _selectedIndex;
  //TabController _tabController;
  Widget _selectedPage;
  int indexed = 0;

  @override
  void initState() {
    //_selectedIndex = widget.selectedIndex;
    super.initState();
    _pages = [
      {
        'page': ServiceRequestScreen(),
        'title': 'Service Request',
      },
      {
        //'page': MyServiceRequests(),
        'page': MyServiceRequestsTabs(),
        'title': 'View Requests..',
      },
      {
        'page': GovtPolicies(),
        'title': 'Policies Progress Report',
      },
      {
        'page': Profile(),
        'title': 'More Details',
      },

    ];
    _selectedIndex = 0;
    _selectedPage = _pages[_selectedIndex]['page'];
    //_tabController = TabController(vsync: this, length: _pages.length);
  }

  @override
  void dispose() {
    //_tabController.dispose();
    print("DISPOSE=======");
    super.dispose();
  }

  final widgetOptions = [
    Text('Service Request'),
    Text('My Requests'),
    Text('Policies'),
    Text('More'),
  ];

  List<Map<String, Object>> _pages;

  @override
  Widget build(BuildContext context) {
    print("_selectedIndex ============="+_selectedIndex.toString());
    print("widget.tabIndex ============="+widget.tabIndex.toString());
   // indexed = ModalRoute.of(context).settings.arguments;
    widget.tabIndex = ModalRoute.of(context).settings.arguments;
    print("Indexed==========="+ indexed.toString());
    if(null != widget.tabIndex && 0 != widget.tabIndex && indexed != 1) { // index = 1 to differentiate between tab 1 and others tabs
    //if(indexed != null && 0 != indexed) {
      _selectedIndex = widget.tabIndex;
      _onItemTapped(_selectedIndex);
   //   widget.tabIndex = 0;
    }
    print("_selectedIndex After============="+_selectedIndex.toString());
    //_pages.forEach((i) => dynams.add(i));
    //var names = _pages1[0] as List;
    return Scaffold (
      // Hiding Appbar for 'Service Request' screen here as to customize it for 'save' button
      appBar: (_selectedIndex != 0 && _selectedIndex != 1 ) ? AppBar(
        title: Text(_pages[_selectedIndex]['title'])
      ) : null,
      drawer: MainDrawer(),
      body: _selectedPage,//_pages[_selectedIndex]['page'],
      /*TabBarView(
        controller: _tabController,
        children: <Widget>[
          ServiceRequestScreen(),
          MyServiceRequests(),
          GovtPolicies(),
          Profile(),
        ]
      ),*/

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              //icon: Icon(Icons.bug_report), 
              icon: Icon(Icons.record_voice_over), 
              title: Text('Request')),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_list), title: Text('My Requests')),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart), title: Text('Govt Policies')),
           BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), title: Text('More')),    
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedPage = _pages[_selectedIndex]['page'];
      if(null != widget.tabIndex && 0 != widget.tabIndex) {
        indexed = 1;
      }
    });
    /*if(null != widget.tabIndex && 0 != widget.tabIndex ) {
      this.dispose();
    }*/

    //_tabController.animateTo(_selectedIndex);
  }


}