import 'package:flutter/material.dart';
import 'package:paripalan/models/role.dart';
import 'package:paripalan/providers/role_provider.dart';
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

import './screens/home/navigations_screen.dart';

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
          value: StateRastram(stateId: 0, stateName: ''),
        ),
        ChangeNotifierProvider.value(
          value: DistrictsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: District(stateId: 0, districtId: 0, districtName: '' ),
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
      ],
      child: MaterialApp(
        title: 'Paripalan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationPage(),
      )
    );
  }
}

