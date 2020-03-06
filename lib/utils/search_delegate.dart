import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/users_provider.dart';
import '../widgets/suggest_phonenumbers_widget.dart';
import '../widgets/change_role_widget.dart';
import '../models/user.dart';
import '../models/address.dart';
import '../screens/change_role_screen.dart';
import '../widgets/inherited_changeRole_stream_widget.dart';

class CustomSearchDelegate extends SearchDelegate<String> {

  CustomSearchDelegate();
  User changeRoleUserObj;

  @override
  String get searchFieldLabel => "Enter Phone Number..";

  @override
  List<Widget> buildActions(BuildContext context) {
    print("Build Actions.....");
    return <Widget>[
      query.isNotEmpty ?
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ): IconButton(
        icon: const Icon(Icons.mic),
        tooltip: 'Voice input',
        onPressed: () {
          this.query = 'TBW: Get input from voice';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    print("Build Leading...");
   /* return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );*/
    // Setting leading icon for the search bar.
    //Clicking on back arrow will take control to main page
      return IconButton(
        tooltip: 'Back',
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          //Take control back to previous page
          this.close(context, null);
        },
      );
    }

  @override
  Widget buildResults(BuildContext context) {
    print("Build Results...");
    if (query.length < 10) {
      print("Build Results...3");
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Phone number should be 10 numbers.",
            ),
          )
        ],
      );
    }
    //this.close(context, null);
    //Navigator.pop(context, null);
    print('Build Result 2..');
    //Builds page to populate search results.
    
    //return ChangeRoleWidget(changeRoleUser: changeRoleUserObj);
    return InheritedChangeRole(child: ChangeRoleWidget(), changeUserRoledata: changeRoleUserObj);
   // return showChangeRoleScreen(changeRoleUserObj);
    //this.close(context, null);
   // return ChangeRole(changeRoleUser: changeRoleUserObj);
    
    /*Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Entered Phone Number is...'),
            GestureDetector(
              onTap: () {
                print("PH from Obje"+this.userObj.phoneNumber.toString());
                //Define your action when clicking on result item.
                //In this example, it simply closes the page
                //this.close(context, this.query);
                //Text(userObj.phoneNumber.toString());
              },
              child: ChangeRole(),
              /*child: Text(
                userObj.phoneNumber.toString(),
                style: Theme.of(context)
                    .textTheme
                    .display2
                    .copyWith(fontWeight: FontWeight.normal),
              ),*/
            ),
          ],
        ),
      ),
    );*/
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("Build Suggestions...");

    if(this.query.isNotEmpty &&query.length == 10) { // Phone number is of 10 digit lengh, suggest number when '> 9'  numbers are matched
      // This method is called everytime the search term changes. 
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return PhoneNumberSuggestions(
      query: this.query,
      onSelected: (User suggestion) {
        this.query = suggestion.phoneNumber.toString();
        setChangeRoleUserObj(suggestion);
        showResults(context);
      },
    );
    } else {
      return Column();
    }
    
  }

  /*@override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }*/

User get getChangeRoleUserObj => this.changeRoleUserObj;
void setChangeRoleUserObj(User value) {
  assert(value != null);
  this.changeRoleUserObj = value;
}

}