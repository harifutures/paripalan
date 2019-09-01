import 'package:flutter/material.dart';
import '../models/village.dart';

class VillagesProvider with ChangeNotifier {
  List<Village> _villagesList = [
    Village(
      villageId: 1,
      villageName: 'Kaza',
      mandalId: 1,
      roleId: 8,
    ),
    Village(
      villageId: 1,
      villageName: 'Kaza',
      mandalId: 1,
      roleId: 9
    ),
    Village(
      villageId: 1,
      villageName: 'Kaza',
      mandalId: 1,
      roleId: 10
    ),
    Village(
      villageId: 2,
      villageName: 'KothaPet',
      mandalId: 2,
      roleId: 8,
    ),
    Village(
      villageId: 2,
      villageName: 'KothaPet',
      mandalId: 2,
      roleId: 9
    ),
    Village(
      villageId: 2,
      villageName: 'KothaPet',
      mandalId: 2,
      roleId: 10
    ),
    Village(
      villageId: 3,
      villageName: 'Gidavari Khani',
      mandalId: 3,
      roleId: 8,
    ),
    Village(
      villageId: 3,
      villageName: 'Gidavari Khani',
      mandalId: 3,
      roleId: 9
    ),
    Village(
      villageId: 3,
      villageName: 'Gidavari Khani',
      mandalId: 3,
      roleId: 10
    ),
    Village(
      villageId: 4,
      villageName: 'KukatPally',
      mandalId: 4,
      roleId: 8,
    ),
    Village(
      villageId: 4,
      villageName: 'KukatPally',
      mandalId: 4,
      roleId: 9
    ),
    Village(
      villageId: 4,
      villageName: 'KukatPally',
      mandalId: 4,
      roleId: 10
    ),
  ];

  List<Village> get villageList {
    return [..._villagesList];
  }

  Village fidnById(int villageId) {
     //return _stateRastramList.firstWhere((st) => st.stateId == stateId);
     return _villagesList.firstWhere((vg) => vg.villageId == villageId);
  }
}