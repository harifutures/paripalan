import 'package:flutter/foundation.dart';

class Role with ChangeNotifier {
  final int roleId;
  // Divisions are : state, district, Mandal, Village.
  final int divisionId;
  final String roleName;
  final int roleLaneId;
  // Super user gets subscription requests notification and he has has permissions to approve that subscription under his division.
  final bool isSuperUser;

  Role({
    this.roleId,
    this.roleName,
    // Divisions are : state, district, Mandal, Village.
    this.divisionId,
    this.isSuperUser,
    this.roleLaneId
  });
}