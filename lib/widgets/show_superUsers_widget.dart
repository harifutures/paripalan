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
  
  List<User> superUsers1;
  ShowSuperUsers({Key key, this.superUsers1}) : super(key: key);

  @override
  _ShowSuperUsersState createState() => _ShowSuperUsersState();
}

class _ShowSuperUsersState extends State<ShowSuperUsers> {
  UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return 
                     Container(
      child:justPrint()
      );
    

  }

  justPrint() {
    List<User> superUsers = userProvider.getSuperUsers;
    print("Inside Super Users length============>:");
    if(null != widget.superUsers1) {
      print("Super Users length============>:"+widget.superUsers1.length.toString());
    }
  }
}

