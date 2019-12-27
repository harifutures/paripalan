import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/departments_provider.dart';
import './providers/states_provider.dart';
import './providers/districts_provider.dart';
import './providers/mandals_provider.dart';
import './providers/villages_provider.dart';
import './providers/services_provider.dart';
import './providers/myRequests_provider.dart';
import './providers/state.dart';
import './providers/role_provider.dart';
import './providers/users_provider.dart';
import './models/district.dart';
import './models/mandal.dart';
import './models/village.dart';
import './models/user.dart';
import './models/service.dart';
import './models/serviceRequest.dart';
import './models/role.dart';
import './screens/myService_requests_screen.dart';
import './screens/subscribe_screen.dart';
import './screens/bucket_screen.dart';
import './screens/profile_screen.dart';
import './screens/personalInformation_screen.dart';
import './screens/change_role_screen.dart';
import './screens/home/navigations_screen.dart';
import './screens/home/navigation_helper.dart';
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
        ),
        ChangeNotifierProvider.value(
          value: ServiceProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Service(),
        ),
        ChangeNotifierProvider.value(
          value: ServiceRequest(),
        ),
        ChangeNotifierProvider.value(
          value: MyRequestsProvider(),
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
        MyPersonalInformation.routeName: (ctx) => MyPersonalInformation(),
        ChangeRole.routeName: (ctx) => ChangeRole(),
        MyServiceRequests.routeName : (ctx) => MyServiceRequests(),
        NavigationPage.routeName : (ctx) =>  NavigationPage(),
        NavigationHelper.routeName : (ctx) =>  NavigationHelper(),

      },
      onGenerateRoute: (RouteSettings settings) {
        print(settings.arguments);

        /*var routes = <String, WidgetBuilder>{
          //Complaints.routeName: (ctx) => Complaints(),
          Subscribe.routeName: (ctx) => Subscribe(),
          Bucket.routeName: (ctx) => Bucket(),
          MyPersonalInformation.routeName: (ctx) => MyPersonalInformation(),
          ChangeRole.routeName: (ctx) => ChangeRole(),
          MyServiceRequests.routeName: (ctx) => MyServiceRequests(),
          NavigationPage.routeName: (ctx) => NavigationPage(),
          NavigationHelper.routeName: (ctx) => NavigationHelper(),
        };
        WidgetBuilder builder =  routes[settings.name];*/

          if (settings.name == '/profile') {
            return MaterialPageRoute(builder: (ctx) => Profile(),);
          }

        /*if (settings.name == NavigationPage.routeName) {
          return MaterialPageRoute(builder: (ctx) => NavigationPage(tabIndex: settings.arguments));
        }

          return MaterialPageRoute(builder: (ctx) => builder(ctx));*/
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

