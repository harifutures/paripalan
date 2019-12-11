import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/role.dart';
import '../models/user.dart';
import '../models/roleLayer.dart';
import '../providers/role_provider.dart';
import '../providers/users_provider.dart';
import '../providers/roleLayer_provider.dart';
import '../widgets/inhertited_changeRole_stream_widget.dart';

class ShowSuperUsers extends StatefulWidget {
  
  List<User> superUsers;
  ShowSuperUsers({Key key, this.superUsers}) : super(key: key);

  @override
  _ShowSuperUsersState createState() => _ShowSuperUsersState();
}

class _ShowSuperUsersState extends State<ShowSuperUsers> {
  UserProvider userProvider;
  List<Widget> widgets = [];
  @override
  Widget build(BuildContext context) {
    print("Super users screen========>"+widget.superUsers.length.toString());
    //final userProvider = Provider.of<UserProvider>(context);
    var superUsersSize = 0;
    if(null != widget.superUsers && widget.superUsers.length >0) {
      superUsersSize = widget.superUsers.length;
    }
    for (var i = 0; i<superUsersSize;  i++) {
      widgets.add(Container(
          //height: 35.0,
          //width: 45.0,
          height: 15.0,
          width: 130.0,
          margin: EdgeInsets.all(
              3.0
          ),
          decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(100.0),
              boxShadow:[
                new BoxShadow(
                    //color: Color.fromARGB(50, 50, 50, 50),
                    color: Colors.white30 ,
                    blurRadius: 6.0,
                    offset: Offset(6.0, 6.0)
                )
              ],
              border: Border.all(
                  width: 1.0,
                  style:BorderStyle.solid ,
                  color: Colors.indigo
              ),
          ),
          child: AutoSizeText(
              widget.superUsers[i].firstName + " " +
              widget.superUsers[i].lastName + ",\n "
              +"PH:"+widget.superUsers[i].phoneNumber.toString() + ", " +
              widget.superUsers[i].getRole.roleName + ", ",
            //style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold ),
            style: TextStyle(fontSize: 16),
            presetFontSizes: [16,18,20],
            textAlign: TextAlign.center,
          )
      ) );

    }
    return Container(
        margin: EdgeInsets.all(3.0),
        //constraints: BoxConstraints(maxWidth: 355.0, maxHeight: 200.0),
        constraints: BoxConstraints(maxWidth: 355.0, maxHeight: 140.0),
        /*padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            shape: BoxShape.rectangle),*/

        child: ListView(
            //scrollDirection: Axis.vertical,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(0.0),
            children: widgets
        )
    );
    

  }

  justPrint() {
    if(null != userProvider) {
      final superUsers1 = userProvider.getSuperUsers;
      print("Super Users length============>:"+superUsers1.length.toString());
    }
    print("Inside Super Users length============>:");
  }
}

