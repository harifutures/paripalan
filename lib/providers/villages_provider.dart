import 'package:flutter/material.dart';
import '../models/village.dart';

class VillagesProvider with ChangeNotifier {
  List<Village> _villagesForMandal = [];
  Village _village;
  List<Village> _villagesList = [
    Village(
      villageId: 1,
      villageName: 'Kaza',
      mandalId: 1,
      roleId: 8,
    ),
    Village(
      villageId: 2,
      villageName: 'Chinna Kakani',
      mandalId: 1,
      roleId: 9
    ),
    Village(
      villageId: 3,
      villageName: 'Bobbarlanka',
      mandalId: 2,
      roleId: 9
    ),
    Village(
      villageId: 4,
      villageName: 'Piratilanka',
      mandalId: 2,
      roleId: 9
    ),
    /*Village(
      villageId: 1,
      villageName: 'Kaza',
      mandalId: 1,
      roleId: 10
    ),*/
    Village(
      villageId: 5,
      villageName: 'KothaPet',
      mandalId: 3,
      roleId: 8,
    ),
    Village(
      villageId: 6,
      villageName: 'Puligadda',
      mandalId: 3,
      roleId: 9
    ),
    /*Village(
      villageId: 2,
      villageName: 'KothaPet',
      mandalId: 2,
      roleId: 10
    ),*/
    Village(
      villageId: 7,
      villageName: 'Gidavari Khani',
      mandalId: 4,
      roleId: 8,
    ),
    Village(
      villageId: 8,
      villageName: 'NizampPet',
      mandalId: 4,
      roleId: 9
    ),
   /* Village(
      villageId: 3,
      villageName: 'Gidavari Khani',
      mandalId: 3,
      roleId: 10
    ),*/
    Village(
      villageId: 9,
      villageName: 'KukatPally',
      mandalId: 5,
      roleId: 8,
    ),
    Village(
      villageId: 10,
      villageName: 'Pragati Nagar',
      mandalId: 5,
      roleId: 9
    ),
    /*Village(
      villageId: 4,
      villageName: 'KukatPally',
      mandalId: 4,
      roleId: 10
    ),*/
  ];

  List<Village> get villageList {
    return [..._villagesList];
  }

  Village fidnById(int villageId) {
     //return _stateRastramList.firstWhere((st) => st.stateId == stateId);
     return _villagesList.firstWhere((vg) => vg.villageId == villageId);
  }

List<Village> findVillagesByMandalId (int mandalId) {
   return _villagesList.where((md) => md.mandalId == mandalId).toList();
}

List<Village> get villagesForMandal => _villagesForMandal;

void setVillagesForMandal(List<Village> villagesForMandal) {
  this._villagesForMandal = villagesForMandal;
  notifyListeners();
}

Village setVillage (Village village) {
   this._village = village;
}

Village get getVillage => _village;


}