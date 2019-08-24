import 'package:flutter/foundation.dart';

class Mandal {
  final int mandalId;
  final String mandalName;
  final int districtId;
  final int roleId;
  
Mandal ({
  @required this.mandalId,
  @required this.mandalName,
  this.districtId,
  this.roleId
});

}