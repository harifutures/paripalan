import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paripalan/widgets/main_drawer.dart';
import '../complaints_screen.dart';
import '../myComplaints_screen.dart';
import '../policies_screen.dart';
import '../more_screen.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key key}) : super(key: key);

  @override
  NavigationPageState createState() => NavigationPageState();

}

class NavigationPageState extends State<NavigationPage> {

  int _selectedIndex = 0;
  final widgetOptions = [
    Text('Complaint'),
    Text('My Complaints'),
    Text('Policies'),
    Text('More'),
  ];

  final List<Map<String, Object>> _pages = [
    {
      'page': Complaints(),
      'title': 'Report a Problem',
    },
    {
      'page': MyComplaints(),
      'title': 'Reported Problems',
    },
    {
      'page': GovtPolicies(),
      'title': 'Policies Progress Report',
    },
    {
      'page': More(),
      'title': 'Policies Progress Report',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title'])
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.record_voice_over), 
              title: Text('Complaint')),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_list), title: Text('My Complaints')),
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
    });
  }


}