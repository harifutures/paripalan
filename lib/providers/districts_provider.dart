import 'package:flutter/material.dart';
import '../models/district.dart';

class DistrictsProvider with ChangeNotifier {
List<District> _districtsForState = [];
District _district;
  List<District> _districtList = [
    District (
      districtId: 1,
      districtName: 'Guntur',
      stateId: 1,
      roleId: 3  // Role id is given for position, Ex: Every Mandal MRO office have Tasildar post/role.
    ),
 /*   District (
      districtId: 1,
      districtName: 'Guntur',
      stateId: 1,
      roleId: 4
    ),
    District (
      districtId: 1,
      districtName: 'Guntur',
      stateId: 1,
      roleId: 5
    ),
    District (
      districtId: 2,
      districtName: 'Krishna',
      stateId: 1,
      roleId: 3
    ),
    District (
      districtId: 2,
      districtName: 'Krishna',
      stateId: 1,
      roleId: 4
    ),*/
    District (
      districtId: 2,
      districtName: 'Krishna',
      stateId: 1,
      roleId: 5
    ),
    /*District (
      districtId: 3,
      districtName: 'Warnagal',
      stateId: 2,
      roleId: 3
    ),
    District (
      districtId: 3,
      districtName: 'Warnagal',
      stateId: 2,
      roleId: 4
    ),*/
    District (
      districtId: 3,
      districtName: 'Warnagal',
      stateId: 2,
      roleId: 5
    ),
    District (
      districtId: 4,
      districtName: 'Hyderabab',
      stateId: 2,
      roleId: 3
    ),
   /* District (
      districtId: 4,
      districtName: 'Hyderabad',
      stateId: 2,
      roleId: 4
    ),
    District (
      districtId: 4,
      districtName: 'Hyderabad',
      stateId: 2,
      roleId: 5
    ),*/
    
  ];

List<District> get districtList {
    return [..._districtList];
}

District findById(int districtId) {
   return _districtList.firstWhere((dt) => dt.districtId == districtId);
}

List<District> findDistrictsByStateId (int stateId) {
   return _districtList.where((dt) => dt.stateId == stateId).toList();
}

List<District> get districtsForState => _districtsForState;

void setDistrictsForState(List<District> districtsForState) {
  this._districtsForState = districtsForState;
  notifyListeners();
}

void setDistrict(District district) {
  this._district = district;
  notifyListeners();
}

District get getDistrict => _district;

}