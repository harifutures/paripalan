import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../widgets/main_drawer.dart';
import '../screens/viewProfilePage.dart';
import '../screens/personalInformation_screen.dart';
import  '../providers/users_provider.dart';
import '../models/appConstants.dart';
import '../customWidgets/textViews.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile';
  
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _hostingString;
  MemoryImage _profileImage;

  void _navigateToProfilePage() {
    Navigator.pushNamed(
      context,
      ViewProfilePage.routeName,
     // arguments: AppConstants.currentUser.createContactFromUser(),
    );
  }

  void _navigateToSettingsPage() {
    Navigator.push(
      context,
      //MaterialPageRoute(builder: (context) => PersonalInformationPage()),
      MaterialPageRoute(builder: (ctx) => MyPersonalInformationScreen()),
    );
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
                  padding: const EdgeInsets.fromLTRB(AppConstants.smallPadding, 0.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      HeadingText(
                        //text: AppConstants.currentUser.firstName,
                        text: Provider.of<UserProvider>(context, listen: false).findById(1).firstName,
                        fontSize: AppConstants.largeFontSize,
                      ),
                      RegularText(
                        //AppConstants.currentUser.email,
                        text:Provider.of<UserProvider>(context, listen: false).findById(1).email,
                      ),
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
                    _navigateToSettingsPage();
                  },
                ),
                PersonalProfilePageListTile(
                  text: "Subscribe",
                  iconData: Icons.payment,
                ),
                PersonalProfilePageListTile(
                  text: "Notifications",
                  iconData: Icons.notifications,
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
