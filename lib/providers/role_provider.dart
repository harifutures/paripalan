import 'package:flutter/material.dart';
import '../models/role.dart';

class RoleProvider with ChangeNotifier {
  List<Role> _rolesList = [
    Role(
      roleId: 12,
      divisionId: 4,
      roleName: 'CM',
      roleLaneId: 8
    ),
    Role(
      roleId: 11,
      divisionId: 4,
      roleName: 'Home Minister',
      roleLaneId: 7

    ),
    Role(
      roleId: 8,
      divisionId: 3,
      roleName: 'Corporation Counciler',
      roleLaneId: 6
    ),
    Role(
      roleId: 10,
      divisionId: 3,
      roleName: 'Collector',
      roleLaneId: 6
    ),
    Role(
      roleId: 9,
      divisionId: 3,
      roleName: 'ZPTC',
      roleLaneId: 5
    ),
    Role(
      roleId: 8,
      divisionId: 3,
      roleName: 'Munciple Counciler',
      roleLaneId: 4
    ),
    Role(
      roleId: 7,
      divisionId: 2,
      roleName: 'Tasildar/MRO',
      roleLaneId: 4
    ),
    Role(
      roleId: 6,
      divisionId: 2,
      roleName: 'MPTC',
      roleLaneId: 3
    ),
    Role(
      roleId: 5,
      divisionId: 1,
      roleName: 'Sarpanch',
      roleLaneId: 2
    ),
    Role(
      roleId: 4,
      divisionId: 1,
      roleName: 'VRO',
      roleLaneId: 2
    ),
    Role(
      roleId: 3,
      divisionId: 1, 
      roleName: 'Village Voulanteer',
      roleLaneId: 1
    ),
    Role(
      roleId: 2,
      divisionId: 1, 
      roleName: 'Village Level2',
      roleLaneId: 1
    ),
    Role(
      roleId: 1,
      divisionId: 1, 
      roleName: 'Village Level1',
      roleLaneId: 1
    )


  ];

  List<Role> get roleList {
    return [..._rolesList];
  }

  Role findById(int roleId) {
     //return _stateRastramList.firstWhere((st) => st.stateId == stateId);
     return _rolesList.firstWhere((rl) => rl.roleId == roleId);
  }

  List<Role> findRolesByDivisionId(int divisionId) {
     return _rolesList.where((role) => role.divisionId == divisionId).toList();
  }

  List<Role> findRolesByRoleLaneId(int roleLaneId) {
     return _rolesList.where((role) => role.roleLaneId == roleLaneId).toList();
  }

}