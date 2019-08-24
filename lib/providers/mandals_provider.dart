import 'package:flutter/material.dart';
import '../models/mandal.dart';

class MandalsProvider with ChangeNotifier {
  List<Mandal> _mandalsList =[
    Mandal(
      mandalId: 1,
      mandalName: 'Mangalagiri',
      districtId: 1,
      roleId: 6
    ),
    Mandal(
      mandalId: 1,
      mandalName: 'Mangalagiri',
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
      mandalName: 'Avanigadda',
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
}