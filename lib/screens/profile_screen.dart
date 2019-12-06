import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../widgets/main_drawer.dart';
import '../screens/viewProfilePage.dart';
import '../screens/personalInformation_screen.dart';
import '../screens/change_role_screen.dart';
import  '../providers/users_provider.dart';
import '../models/appConstants.dart';
import '../models/user.dart';
import '../customWidgets/textViews.dart';
import '../utils/search_delegate.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile';
  
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _hostingString;
  MemoryImage _profileImage;
  User _changeRoleUser;
  String phoneNumberSelected;
  CustomSearchDelegate _searchDelegate;

  void _navigateToProfilePage() {
    Navigator.pushNamed(
      context,
      ViewProfilePage.routeName,
     // arguments: AppConstants.currentUser.createContactFromUser(),
    );
  }

  void _navigateToPersonalInformationScreen() {
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MyPersonalInformationScreen()),
    );*/
    //Navigator.of(context).pushNamed(MyPersonalInformationScreen.routeName, arguments: a,b);
    Navigator.of(context).pushNamed(MyPersonalInformation.routeName);
  }

  showSearchPage(BuildContext context,
      ) async {
        _searchDelegate = CustomSearchDelegate();
      final String selectedUser = await showSearch<String>(
      context: context,
      delegate: _searchDelegate,
    ) ;
    
    print("SHow search..after await");
    print(selectedUser);
    if(selectedUser != null) {
      print("SHow search..after await: selected is not null..");
     // showChangeRoleScreen(Provider.of<UserProvider>(context).findUsersByPhone(selectedUser));
    }
    
    
  }

  void _navigateToAddSuperUserScreen() {
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MyPersonalInformationScreen()),
    );*/
    //Navigator.of(context).pushNamed(MyPersonalInformationScreen.routeName, arguments: a,b);
    Navigator.of(context).pushNamed(ChangeRole.routeName);
  }

 /* void _changeCurrentlyHosting() {
    if (AppConstants.currentUser.isHost) {
      if (AppConstants.currentUser.isCurrentlyHosting) {
        AppConstants.currentUser.changeHosting(false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        AppConstants.currentUser.changeHosting(true);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HostingHomePage()),
        );
      }
    } else {
      AppConstants.currentUser.becomeAHost();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HostingHomePage()),
      );
    }
  }*/

  void _navigateToLoginPage() {
   /* widget.auth.signOut();
    AppConstants.currentUser = null;
    UserLoginFunctions.clearUserInfo();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );*/
  }

  void _loadImage() {
    /*AppConstants.currentUser.getImageFromDatabase().then((image){
      setState(() {
        _profileImage = image;
      });
    });*/
  }

  // void _setHostingString() {
  //   _hostingString = AppConstants.currentUser.isHost ? "Hosting Dashboard": "Become a Host";
  //   if (AppConstants.currentUser.isCurrentlyHosting) {
  //     _hostingString = "Guest Home";
  //   }
  // }

  @override
  void initState() {
    //_setHostingString();
    _loadImage();

    super.initState();
  }


  @override
  Widget build (BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.smallPadding,
        AppConstants.smallPadding,
        AppConstants.smallPadding,
        0.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, AppConstants.smallPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: _navigateToProfilePage,
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
                        Provider.of<UserProvider>(context, listen: false).findById(1).firstName,
                        maxLines: 1,
                        maxFontSize: 24.0,
                        overflow: TextOverflow.visible,
                        minFontSize: 2.0,
                        presetFontSizes: [20,25,30],
                      ),
                      AutoSizeText(
                        //AppConstants.currentUser.email,
                        Provider.of<UserProvider>(context, listen: false).findById(1).phoneNumber.toString(),
                        maxLines: 1,
                        maxFontSize: 24.0,
                        overflow: TextOverflow.fade,
                        minFontSize: 2.0,
                        presetFontSizes: [15, 20, 25],
                      ),
                      if(null != Provider.of<UserProvider>(context, listen: false).findById(1).email)
                      AutoSizeText(
                        //AppConstants.currentUser.email,
                        Provider.of<UserProvider>(context, listen: false).findById(1).email,
                        maxLines: 1,
                        maxFontSize: 24.0,
                        overflow: TextOverflow.fade,
                        minFontSize: 2.0,
                        presetFontSizes: [15, 20, 25],
                      ),
                      Row(
                        children: <Widget>[
                          AutoSizeText(
                            //AppConstants.currentUser.email,
                            Provider.of<UserProvider>(context, listen: false).findById(1).address.getDistrict.districtName +"-> "+
                            Provider.of<UserProvider>(context, listen: false).findById(1).address.getMandal.mandalName +"-> " +
                            Provider.of<UserProvider>(context, listen: false).findById(1).address.getVillage.villageName
                             ,
                            maxLines: 1,
                            maxFontSize: 24.0,
                            overflow: TextOverflow.fade,
                            minFontSize: 2.0,
                            presetFontSizes: [15],
                          ),
                          
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  child: PersonalProfilePageListTile(
                    text: "Personal Information",
                    iconData: Icons.person,
                  ),
                  onTap: () {
                    _navigateToPersonalInformationScreen();
                  },
                ),
                /*PersonalProfilePageListTile(
                  text: "Subscribe",
                  iconData: Icons.payment,
                ),*/
                PersonalProfilePageListTile(
                  text: "Notifications",
                  iconData: Icons.notifications,
                ),
                GestureDetector(
                  child: PersonalProfilePageListTile(
                    text: "Change Role",
                    iconData: Icons.supervised_user_circle,
                  ),
                  onTap: () {
                    //_navigateToAddSuperUserScreen();
                    showSearchPage(context);
                  },
                ),
                /*GestureDetector(
                  child: PersonalProfilePageListTile(
                    text: _hostingString,
                    iconData: Icons.hotel,
                  ),
                 // onTap: _changeCurrentlyHosting,
                ),*/
                /*GestureDetector(
                  child: PersonalProfilePageListTile(
                    text: "Log Out",
                    iconData: null,
                  ),
                //  onTap: _navigateToLoginPage,
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalProfilePageListTile extends StatelessWidget {

  final String text;
  final IconData iconData;

  PersonalProfilePageListTile({Key key, this.text, this.iconData}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.tinyPadding),
      child: ListTile(
        leading: RegularText(text: text),
        trailing: Icon(iconData, size: 30.0,),
      ),
    );
  }
}
