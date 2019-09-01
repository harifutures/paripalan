import 'package:flutter/material.dart';
import '../models/role.dart';

class RoleProvider with ChangeNotifier {
  List<Role> _rolesList = [
    Role(
      roleId: 1,
      roleName: 'CM'
    ),
    Role(
      roleId: 2,
      roleName: 'Home Minister'
    ),
    Role(
      roleId: 3,
      roleName: 'Collector'
    ),
    Role(
      roleId: 4,
      roleName: 'ZPTC'
    ),
    Role(
      roleId: 5,
      roleName: 'Counciler'
    ),
    Role(
      roleId: 6,
      roleName: 'Tasildar/MRO'
    ),
    Role(
      roleId: 7,
      roleName: 'MPTC'
    ),
    Role(
      roleId: 8,
      roleName: 'Sarpanch'
    ),
    Role(
      roleId: 9,
      roleName: 'VRO'
    ),
    Role(
      roleId: 10,
      roleName: 'Village Voulanteer'
    )

  ];

  List<Role> get roleList {
    return [..._rolesList];
  }

  Role fidnById(int roleId) {
     //return _stateRastramList.firstWhere((st) => st.stateId == stateId);
     return _rolesList.firstWhere((rl) => rl.roleId == roleId);
  }

}