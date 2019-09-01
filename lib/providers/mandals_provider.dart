import 'package:flutter/material.dart';
import '../models/mandal.dart';

class MandalsProvider with ChangeNotifier {
  List<Mandal> mandalsForDistrcit = [];
  List<Mandal> _mandalsList =[
    Mandal(
      mandalId: 1,
      mandalName: 'Mangalagiri',
      districtId: 1,
      roleId: 6
    ),
    Mandal(
      mandalId: 1,
      mandalName: 'China Kakani',
      districtId: 1,
      roleId: 7
    ),
    Mandal(
      mandalId: 2,
      mandalName: 'Avanigadda',
      districtId: 2,
      roleId: 6
    ),
    Mandal(
      mandalId: 2,
      mandalName: 'Vuyyuru',
      districtId: 2,
      roleId: 7
    ),
    Mandal(
      mandalId: 3,
      mandalName: 'Gadwal',
      districtId: 3,
      roleId: 6
    ),
    Mandal(
      mandalId: 3,
      mandalName: 'Gadwal',
      districtId: 3,
      roleId: 7
    ),
    Mandal(
      mandalId: 4,
      mandalName: 'KPHB',
      districtId: 4,
      roleId: 6
    ),
    Mandal(
      mandalId: 4,
      mandalName: 'KPHB',
      districtId: 4,
      roleId: 7
    )
  ];

List<Mandal> get mandalList {
  return [..._mandalsList];
}

Mandal findById(int mandalId) {
   return _mandalsList.firstWhere((md) => md.mandalId == mandalId);
}

List<Mandal> findDistrictsByStateId (int districtId) {
   return _mandalsList.where((md) => md.districtId == districtId).toList();
}

void setMandlasForDistrict(List<Mandal> mandalsForDistrict) {
  this.mandalsForDistrcit = mandalsForDistrict;
  notifyListeners();
}

}