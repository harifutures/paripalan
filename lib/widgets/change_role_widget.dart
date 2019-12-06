import 'dart:io';
//import '../screens/HomePage.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paripalan/widgets/inhertited_changeRole_stream_widget.dart';
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
import '../widgets/change_role_form_widget.dart';
import '../models/appConstants.dart';
import '../utils/search_delegate.dart';

class ChangeRoleWidget extends StatelessWidget {

  User changeRoleUser;
  //ChangeRoleWidget({Key key, this.changeRoleUser}) : super(key: key);

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
  Widget build(BuildContext context) {
    changeRoleUser = InheritedChangeRole.of(context).changeUserRoledata; 
    return showChangeRoleScreen(changeRoleUser, context);
  }

  Widget showChangeRoleScreen(User changeRoleUser, BuildContext context) {
    if(changeRoleUser != null) {
      return Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
         Container( 
           padding: EdgeInsets.all(6.0),
         /* margin: const EdgeInsets.fromLTRB(AppConstants.tinyPadding,
                  AppConstants.smallPadding,
                  AppConstants.tinyPadding,
                  460.0,),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent)
          ),*/
          child:displayChangeRoleUser(changeRoleUser, context),
        ),
        ChangeRoleForm(),
        
      ],
      );
    }
  }

  //Shows Search result
  void showSearchPage(BuildContext context,
      CustomSearchDelegate searchDelegate) async {
    final String selected = await showSearch<String>(
      context: context,
      delegate: searchDelegate,
    );
    print("SHow search..after await");
    if (selected != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Your Word Choice: $selected'),
        ),
      );
    }
  }

  Widget displayChangeRoleUser(User changeUserRole, BuildContext context) {
    Address address = changeUserRole.getAddress;
    String stateName = "";
    String districtName = "";
    String mandalName = "";
    String villageName = "";
    //stateName = address.getStateRastram.stateName;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Padding(
            //padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, AppConstants.smallPadding),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RawMaterialButton(
                  //onPressed: _navigateToProfilePage,
                  child: CircleAvatar(
                    //backgroundImage: _profileImage,
                    child: Icon(Icons.person),
                    radius: MediaQuery.of(context).size.width / 10.0,
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.fromLTRB(AppConstants.smallPadding, 0.0, 0.0, 0.0),
                  padding: const EdgeInsets.symmetric(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        //text: AppConstants.currentUser.firstName,
                        changeUserRole.firstName + changeUserRole.lastName,
                        maxLines: 1,
                        maxFontSize: 24.0,
                        overflow: TextOverflow.visible,
                        minFontSize: 2.0,
                        presetFontSizes: [20,25,30],
                      ),
                      AutoSizeText(
                        //AppConstants.currentUser.email,
                        "Phone: "+changeUserRole.phoneNumber.toString(),
                        maxLines: 1,
                        maxFontSize: 24.0,
                        overflow: TextOverflow.fade,
                        minFontSize: 2.0,
                        presetFontSizes: [15, 20, 25],
                      ),
                     // Row(
                       // children: <Widget>[
                         // Displaying address in diffrent rows to adjust the space.
                          AutoSizeText(
                            buildPersonInfo1(address),
                            maxLines: 2,
                            maxFontSize: 15.0,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 2.0,
                           // presetFontSizes: [15],
                          ),
                          AutoSizeText(
                            buildPersonInfo2(address),
                            maxLines: 2,
                            maxFontSize: 15.0,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 2.0,
                           // presetFontSizes: [15],
                          ),
                          
                      //  ],
                      //)
                    ],
                  ),
                ),
               // ChangeRoleForm(),
        ]))]);
  }

  String buildPersonInfo1(Address address) {
    //This just diplays like this on screen: statename -> districName
    String personalInfo ="";
    if(null != address.getStateRastram.stateName) {
      personalInfo +=address.stateRastram.stateName + "->";
    }
    if(null != address.getDistrict.districtName) {
      personalInfo +=address.getDistrict.districtName + "->";
    }
    return personalInfo;
  }

  String buildPersonInfo2(Address address) {
    //This just diplays like this on screen: mandalName -> villageName
    String personalInfo ="";
    if(null != address.getMandal.mandalName) {
      personalInfo +=address.getMandal.mandalName + "->";
    }
    if(null != address.getVillage.villageName) {
      personalInfo +=address.getVillage.villageName;
    }
    return personalInfo;
  }

}