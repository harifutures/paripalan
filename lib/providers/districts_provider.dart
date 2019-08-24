import 'package:flutter/material.dart';
import '../models/district.dart';

class DistrictsProvider with ChangeNotifier {

  List<Distric> _districtList = [
    Distric (
      districtId: 1,
      districtName: 'Guntur',
      stateId: 1,
      roleId: 3  // Role id is given for position, Ex: Every Mandal MRO office have Tasildar post/role.
    ),
    Distric (
      districtId: 1,
      districtName: 'Guntur',
      stateId: 1,
      roleId: 4
    ),
    Distric (
      districtId: 1,
      districtName: 'Guntur',
      stateId: 1,
      roleId: 5
    ),
    Distric (
      districtId: 2,
      districtName: 'Krishna',
      stateId: 1,
      roleId: 3
    ),
    Distric (
      districtId: 2,
      districtName: 'Krishna',
      stateId: 1,
      roleId: 4
    ),
    Distric (
      districtId: 2,
      districtName: 'Krishna',
      stateId: 1,
      roleId: 5
    ),
    Distric (
      districtId: 3,
      districtName: 'Warnagal',
      stateId: 2,
      roleId: 3
    ),
    Distric (
      districtId: 3,
      districtName: 'Warnagal',
      stateId: 2,
      roleId: 4
    ),
    Distric (
      districtId: 3,
      districtName: 'Warnagal',
      stateId: 2,
      roleId: 5
    ),
    Distric (
      districtId: 4,
      districtName: 'Hyderabab',
      stateId: 2,
      roleId: 3
    ),
    Distric (
      districtId: 4,
      districtName: 'Hyderabad',
      stateId: 2,
      roleId: 4
    ),
    Distric (
      districtId: 4,
      districtName: 'Hyderabad',
      stateId: 2,
      roleId: 5
    ),
    
  ];


}