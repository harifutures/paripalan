import 'package:flutter/material.dart';
import '../models/role.dart';

class RoleProvider with ChangeNotifier {
  List<Role> _rolesList = [
    Role(
      roelId: 1,
      roleName: 'CM'
    ),
    Role(
      roelId: 2,
      roleName: 'Home Minister'
    ),
    Role(
      roelId: 3,
      roleName: 'Collector'
    ),
    Role(
      roelId: 4,
      roleName: 'ZPTC'
    ),
    Role(
      roelId: 5,
      roleName: 'Counciler'
    ),
    Role(
      roelId: 6,
      roleName: 'Tasildar/MRO'
    ),
    Role(
      roelId: 7,
      roleName: 'MPTC'
    ),
    Role(
      roelId: 8,
      roleName: 'Sarpanch'
    ),
    Role(
      roelId: 9,
      roleName: 'VRO'
    ),
    Role(
      roelId: 10,
      roleName: 'Village Voulanteer'
    )

  ];
}