import 'package:flutter/material.dart';
import '../models/roleLane.dart';
import '../models/role.dart';

class RoleLaneProvider with ChangeNotifier {
  List<RoleLane> _roleLaneList = [
    RoleLane(
      roleLaneId: 1,
      role: Role (
        roleId: 1
      ),
    ),
    RoleLane(
      roleLaneId: 1,
      role: Role (
        roleId: 2
      ),
    ),
    RoleLane(
      roleLaneId: 1,
      role: Role (
        roleId: 3
      ),
    ),
    RoleLane(
      roleLaneId: 2,
      role: Role (
        roleId: 4
      ),
    ),
    RoleLane(
      roleLaneId: 2,
      role: Role (
        roleId: 5
      ),
    )

    


  ];

  List<RoleLane> get roleLaneList {
    return [..._roleLaneList];
  }

  RoleLane fidnById(int roleLaneId) {
     //return _stateRastramList.firstWhere((st) => st.stateId == stateId);
     return _roleLaneList.firstWhere((rl) => rl.roleLaneId == roleLaneId);
  }

  List<RoleLane> fidnRolesByRoleLaneId(int roleLaneId) {
     return _roleLaneList.where((roleLane) => roleLane.roleLaneId == roleLaneId);
  }

  /* Checking is this the last RoleLane in that division,
   If (current RoleLane + 1 and diviosionId) matches*/
  RoleLane findNextRoleLaneByRoleLaneAndDivision(int roleLaneId, int divisionId) {
     return _roleLaneList.firstWhere((rl) => rl.roleLaneId+1 == roleLaneId+1 &&
                                          rl.role.divisionId == divisionId);
  }

}