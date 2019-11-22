import 'package:flutter/material.dart';
import 'package:paripalan/models/role.dart';
import 'package:paripalan/providers/role_provider.dart';
import 'package:paripalan/providers/users_provider.dart';
import 'package:provider/provider.dart';

import './providers/departments_provider.dart';
import './providers/states_provider.dart';
import './providers/districts_provider.dart';
import './providers/mandals_provider.dart';
import './providers/villages_provider.dart';
import './providers/departments_provider.dart';
import './providers/state.dart';
import './models/district.dart';
import './models/mandal.dart';
import './models/village.dart';
import './models/user.dart';

import './screens/subscribe_screen.dart';
import './screens/bucket_screen.dart';
import './screens/profile_screen.dart';
import './screens/home/navigations_screen.dart';
import './screens/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return ChangeNotifierProvider (
    return MultiProvider (

     // builder: (context) => Departments(),
      //builder: (context) => StatesProvider(),
      providers: [
        ChangeNotifierProvider.value(
          value: StatesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: StateRastram(),
        ),
        ChangeNotifierProvider.value(
          value: DistrictsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: District(),
        ),
        ChangeNotifierProvider.value(
          value: MandalsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Mandal(),
        ),
        ChangeNotifierProvider.value(
          value: VillagesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Village(),
        ),
        ChangeNotifierProvider.value(
          value: RoleProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Role(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: User(),
        )
        
      ],
      child: MaterialApp(
        title: 'Paripalan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationPage(),
       // home: HomePage(),
        //initialRoute: '/',
        routes: {
        //Complaints.routeName: (ctx) => Complaints(),
        Subscribe.routeName: (ctx) => Subscribe(),
        Bucket.routeName: (ctx) => Bucket(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
          if (settings.name == '/profile') {
            return MaterialPageRoute(builder: (ctx) => Profile(),);
          }
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Profile(),);
      }
      )
    );
  }
}

