import 'package:flutter/material.dart';
import '../models/mandal.dart';

class MandalsProvider with ChangeNotifier {
  List<Mandal> _mandalsForDistrcit = [];
  Mandal _mandal;
  List<Mandal> _mandalsList =[
    Mandal(
      mandalId: 1,
      mandalName: 'Mangalagiri',
      districtId: 1,
      roleId: 6
    ),
    Mandal(
      mandalId: 2,
      mandalName: 'Repalle',
      districtId: 1,
      roleId: 7
    ),
    Mandal(
      mandalId: 3,
      mandalName: 'Avanigadda',
      districtId: 2,
      roleId: 6
    ),
    /*Mandal(
      mandalId: 2,
      mandalName: 'Vuyyuru',
      districtId: 2,
      roleId: 7
    ),*/
    Mandal(
      mandalId: 4,
      mandalName: 'Gadwal',
      districtId: 3,
      roleId: 6
    ),
   /* Mandal(
      mandalId: 3,
      mandalName: 'Gadwal',
      districtId: 3,
      roleId: 7
    ),*/
    Mandal(
      mandalId: 5,
      mandalName: 'KPHB',
      districtId: 4,
      roleId: 6
    ),
  /*  Mandal(
      mandalId: 4,
      mandalName: 'KPHB',
      districtId: 4,
      roleId: 7
    )*/
  ];

List<Mandal> get mandalList {
  return [..._mandalsList];
}

Mandal findById(int mandalId) {
   return _mandalsList.firstWhere((md) => md.mandalId == mandalId);
}

List<Mandal> findMandalsByDistrictId (int districtId) {
   return _mandalsList.where((md) => md.districtId == districtId).toList();
}

List<Mandal> get mandalsForDistricts => _mandalsForDistrcit;

void setMandlasForDistrict(List<Mandal> mandalsForDistrict) {
  this._mandalsForDistrcit = mandalsForDistrict;
  notifyListeners();
}

Mandal setMandal (Mandal mandal) {
   this._mandal = mandal;
}

Mandal get getMandal => _mandal;

}