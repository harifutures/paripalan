import 'dart:io';
//import '../screens/HomePage.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_modern/image_picker_modern.dart';

import '../providers/departments_provider.dart';
import '../providers/states_provider.dart';
import '../providers/districts_provider.dart';
import '../providers/mandals_provider.dart';
import '../providers/villages_provider.dart';
import '../providers/role_provider.dart';
import '../providers/users_provider.dart';

import '../providers/state.dart';
import '../models/district.dart';
import '../models/mandal.dart';
import '../models/village.dart';
import '../models/Role.dart';
import '../models/user.dart';
import '../models/address.dart';

import '../widgets/districts_dropdown_widget.dart';
import '../widgets/mandals_dropdown_widget.dart';
import '../widgets/dropdowns_widget.dart';
import '../widgets/main_drawer.dart';
import '../models/appConstants.dart';
import '../utils/search_delegate.dart';

class ChangeRole extends StatefulWidget {

  static const routeName = '/addSuperUser';
  User changeRoleUser;
  ChangeRole({Key key, this.changeRoleUser}) : super(key: key);


  @override
  _ChangeRoleState createState() => _ChangeRoleState();

}

class _ChangeRoleState extends State<ChangeRole> {

  User _changeRoleUser;
  String phoneNumberSelected;
  CustomSearchDelegate _searchDelegate;
  TextEditingController editingController = TextEditingController();

 /* @override
  void dispose() {
   // _phoneFocusNode.dispose();
    super.dispose();
  }*/

  /*_saveForm(UserProvider userProvider) {
    //_showMessage();

    Provider.of<UserProvider>(context).saveUserProfile(
                        userProvider.findById(1));
    Navigator.of(context).pop();
  }*/
@override
  void initState() {
    _searchDelegate = CustomSearchDelegate();
    phoneNumberSelected ="";
    super.initState();
    //Initializing search delegate with sorted list of English words
    
  }

  @override
  Widget build(BuildContext context) {
    _changeRoleUser = widget.changeRoleUser;
    setState(() {
      _changeRoleUser = widget.changeRoleUser;
    });
   return Scaffold(
       appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text('Enter Phone Number..'),
        actions: <Widget>[
          //Adding the search widget in AppBar
          IconButton(
            //tooltip: 'Search',
            icon: const Icon(Icons.search),
            //Don't block the main thread
            onPressed: () {
              showSearchPage(context, _searchDelegate, _changeRoleUser);
            },
          ),
        ],
      ),
      
     // body: showSearchPageCaller(context, _searchDelegate, _changeRoleUser),
       
    );
    /* appBar: AppBar(
          title: Text("Change User Role"),
        ),
        body: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    showSearchPage(context, _searchDelegate, widget.changeRoleUser);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Enter Phone Number...",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)))),
                ),
                MaterialButton(
                  onPressed: () => { 
                    //_saveForm(_userProvider),
                  },
                  child: Text(
                    'Find',
                    style: TextStyle(
                      fontSize: AppConstants.smallFontSize,
                      color: Colors.white,
                    ),
                  ),
                  textColor: Colors.white,
                ),
              
              ]),
        
       // showChangeRoleScreen(widget.changeRoleUser),
      );*/
    
  }

  /*void filterSearchResults(String query) {
      // List<String> dummySearchList = List<String>();
      // dummySearchList.addAll(duplicateItems);
      if(query.isNotEmpty) {
        List<String> dummyListData = List<String>();
        dummySearchList.forEach((item) {
          if(item.contains(query)) {
            dummyListData.add(item);
          }
        });
        setState(() {
          items.clear();
          items.addAll(dummyListData);
        });
        return;
      } else {
        setState(() {
          items.clear();
          items.addAll(duplicateItems);
        });
      }

    }*/
  //Shows Search result
  showSearchPageCaller(BuildContext context,
      CustomSearchDelegate searchDelegate, User changeRoleUser) {
        
        if(null != changeRoleUser) {
          print("checking changeRoleUser :");
          print(changeRoleUser);
          showSearchPage(context, searchDelegate, changeRoleUser);
        }
  }
  showSearchPage(BuildContext context,
      CustomSearchDelegate searchDelegate, User changeRoleUser) async {
      final String selectedUser = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    ) ;
    
    print("SHow search..after await");
    print(selectedUser);
    if(selectedUser != null) {
      print("SHow search..after await: selected is not null..");
      showChangeRoleScreen(Provider.of<UserProvider>(context).findUsersByPhone(selectedUser));
    }
    
    
  }

  /*void showSearchPage(BuildContext context,
    CustomSearchDelegate searchDelegate, User changeRoleUser) {
    showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );
    print("SHow search..after await");
    showChangeRoleScreen(changeRoleUser);
    
  }*/

Card displayChangeRoleUser(User changeUserRole) {
  Address address = changeUserRole.getAddress;
  print("Address:"+address.stateRastram.stateName);
  String stateName = "";
  String districtName = "";
  String mandalName = "";
  String villageName = "";
  //stateName = address.getStateRastram.stateName;
  return Card (
    child: Column(children: [
      /*if(null != stateName && "" != stateName) 
        buildBreadCrumbValue(stateName),*/
      CircleAvatar(
        //backgroundImage: _profileImage,
        child: Icon(Icons.person),
        radius: MediaQuery.of(context).size.width / 10.0,
      ),
      AutoSizeText(
        changeUserRole.firstName + changeUserRole.lastName,
        maxLines: 1,
        maxFontSize: 24.0,
        overflow: TextOverflow.fade,
        minFontSize: 2.0,
        presetFontSizes: [15, 20, 25],
        ),
        Text(changeUserRole.phoneNumber.toString()),
      AutoSizeText(
        buildPersonInfo(address),
        maxLines: 1,
        maxFontSize: 24.0,
        overflow: TextOverflow.fade,
        minFontSize: 2.0,
        presetFontSizes: [15, 20, 25],
      ),
  ]));
}

  String buildPersonInfo(Address address) {
    //This just diplays like this on screen: statename -> districName -> mandalName -> villageName
    String personalInfo ="";
    if(null != address.getStateRastram.stateName) {
      personalInfo +=address.stateRastram.stateName + "->";
    }
    if(null != address.getDistrict.districtName) {
      personalInfo +=address.getDistrict.districtName + "->";
    }
    if(null != address.getMandal.mandalName) {
      personalInfo +=address.getMandal.mandalName + "->";
    }
    if(null != address.getVillage.villageName) {
      personalInfo +=address.getVillage.villageName;
    }
    return personalInfo;
  }

  Widget showChangeRoleScreen(User changeRoleUser) {
    print("inside changeRoleUser:");
    if(changeRoleUser != null) {
      print("inside changeRoleUser not null:");
      return Padding(
        padding: EdgeInsets.all(8.0),
        child:displayChangeRoleUser(changeRoleUser),
        
      );

    }

  }
}