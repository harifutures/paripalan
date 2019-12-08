import 'package:flutter/material.dart';
import '../models/role.dart';

class RoleProvider with ChangeNotifier {
  List<Role> _rolesList = [
    Role(
      roleId: 12,
      divisionId: 4,
      roleName: 'CM',
      roleLayerId: 8
    ),
    Role(
      roleId: 11,
      divisionId: 4,
      roleName: 'Home Minister',
      roleLayerId: 7

    ),
    Role(
      roleId: 8,
      divisionId: 3,
      roleName: 'Corporation Counciler',
      roleLayerId: 6
    ),
    Role(
      roleId: 10,
      divisionId: 3,
      roleName: 'Collector',
      roleLayerId: 6
    ),
    Role(
      roleId: 9,
      divisionId: 3,
      roleName: 'ZPTC',
      roleLayerId: 5
    ),
    Role(
      roleId: 8,
      divisionId: 3,
      roleName: 'Munciple Counciler',
      roleLayerId: 4
    ),
    Role(
      roleId: 7,
      divisionId: 2,
      roleName: 'Tasildar/MRO',
      roleLayerId: 4
    ),
    Role(
      roleId: 6,
      divisionId: 2,
      roleName: 'MPTC',
      roleLayerId: 3
    ),
    Role(
      roleId: 5,
      divisionId: 1,
      roleName: 'Sarpanch',
      roleLayerId: 2
    ),
    Role(
      roleId: 4,
      divisionId: 1,
      roleName: 'VRO',
      roleLayerId: 2
    ),
    Role(
      roleId: 3,
      divisionId: 1, 
      roleName: 'Village Voulanteer',
      roleLayerId: 1
    ),
    Role(
      roleId: 2,
      divisionId: 1, 
      roleName: 'Village Level2',
      roleLayerId: 1
    ),
    Role(
      roleId: 1,
      divisionId: 1, 
      roleName: 'Village Level1',
      roleLayerId: 1
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

  List<Role> findRolesByRoleLaneId(int roleLayerId) {
     return _rolesList.where((role) => role.roleLayerId == roleLayerId).toList();
  }

}