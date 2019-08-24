import 'package:flutter/foundation.dart';

class Distric {
  final int districtId;
  final String districtName;
  final int stateId;
  final int roleId;

Distric ({
  @required this.districtId,
  @required this.districtName,
  this.stateId,
  this.roleId
});

}