import 'package:flutter/material.dart';
import 'package:paripalan/models/state.dart';
import 'package:provider/provider.dart';

import './providers/departments_provider.dart';
import './providers/states_provider.dart';
import './providers/districts_provider.dart';
import './providers/mandals_provider.dart';
import './providers/villages_provider.dart';
import './providers/departments_provider.dart';

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
          value: DistrictsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MandalsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: VillagesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: StateRastram(stateId: 1, stateName: "hello"),
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

