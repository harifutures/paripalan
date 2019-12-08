import 'package:flutter/material.dart';
import '../models/roleLayer.dart';
import '../models/role.dart';

class RoleLayerProvider with ChangeNotifier {
  List<RoleLayer> _roleLayerList = [
    RoleLayer(
      roleLayerId: 1,
      role: Role(
        roleId: 1,
        divisionId: 1, 
        roleName: 'Village Level1',
        roleLayerId: 1
      ),
    ),
    RoleLayer(
      roleLayerId: 1,
      role: Role(
        roleId: 2,
        divisionId: 1, 
        roleName: 'Village Level2',
        roleLayerId: 1
      ),
    ),
    RoleLayer(
      roleLayerId: 1,
      role: Role(
        roleId: 3,
        divisionId: 1, 
        roleName: 'Village Voulanteer',
        roleLayerId: 1
    ),
    ),
    RoleLayer(
      roleLayerId: 2,
      role: Role(
        roleId: 4,
        divisionId: 1,
        roleName: 'VRO',
        roleLayerId: 2
    ),
    ),
    RoleLayer(
      roleLayerId: 2,
      role: Role(
        roleId: 5,
        divisionId: 1,
        roleName: 'Sarpanch',
        roleLayerId: 2
    ),
    )

  ];

  List<RoleLayer> get roleLayerList {
    return [..._roleLayerList];
  }

  RoleLayer fidnById(int roleLayerId) {
     //return _stateRastramList.firstWhere((st) => st.stateId == stateId);
     return _roleLayerList.firstWhere((rl) => rl.roleLayerId == roleLayerId);
  }

  List<RoleLayer> fidnRolesByRoleLaneId(int roleLayerId) {
     return _roleLayerList.where((roleLayer) => roleLayer.roleLayerId == roleLayerId);
  }

  /* Checking is this the last RoleLayer in that division,
   If (current RoleLayer + 1 and diviosionId) matches*/
  RoleLayer findNextRoleLaneByRoleLaneAndDivision(int roleLayerId, int divisionId) {

     return _roleLayerList.firstWhere((rl) => rl.roleLayerId == roleLayerId+1 &&
                                        (rl.role.divisionId == divisionId), orElse: () => null);
  }

}