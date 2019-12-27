import 'package:flutter/material.dart';
import 'package:paripalan/screens/home/navigations_screen.dart';

void main() => runApp(NavigationHelper());

class NavigationHelper extends StatelessWidget {
  static const routeName = '/navigationHelper';
  @override
  Widget build(BuildContext context) {
    print("=========>onGenerated=======");
    return MaterialApp(
      // Provide a function to handle named routes. Use this function to
      // identify the named route being pushed and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (null != settings.arguments) {
          print("=========>onGenerated.."+settings.arguments.toString());
          // Cast the arguments to the correct type: ScreenArguments.
          int tabIndexNumber = settings.arguments;
          // Then, extract the required data from the arguments and
          // pass the data to the correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return NavigationPage(
                tabIndex : tabIndexNumber,

              );
            },
          );
        }
      },
      title: 'Navigation with Arguments',
      home: NavigationPage(),
    );
  }
}