import 'package:flutter/material.dart';
import 'package:paripalan/screens/profile_screen.dart';
import 'package:paripalan/screens/service_request_screen.dart';
import '../screens/subscribe_screen.dart';
import '../screens/bucket_screen.dart';


class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            //fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.blueGrey
            
          ),
        ),
        onTap: tapHandler,
      );
    }

  @override
  Widget build(BuildContext context) {

    return Drawer (
      elevation: 20.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Hari Prasad'),
          accountEmail: Text('NoEmail@gmail.com'),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            )
          ),

          //Image.network('https://hammad-tariq.com/img/profile.png'),
          decoration: BoxDecoration(color: Colors.blueAccent),
        ),
        buildListTile(
            'Subscribe',
            Icons.subscriptions,
            () {Navigator.of(context).pushReplacementNamed(Subscribe.routeName);}
        ),
        Divider(
          height: 2.0,
        ),
          buildListTile(
            'Bucket',
            Icons.notifications_active,
            () {Navigator.of(context).pushReplacementNamed(Bucket.routeName);}
        ),
          Divider(
            height: 2.0,
          ),
          buildListTile(
            'Profile',
            Icons.account_circle, 
            () {Navigator.of(context).pushReplacementNamed(Profile.routeName);}
        ),
          Divider(
            height: 2.0,
          ),
      ],
    ),
    
    );


  }
}