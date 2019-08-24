import 'package:flutter/foundation.dart';

class Village {
  final int villageId;
  final String villageName;
  final int mandalId;
  final int roleId;

Village ({
  @required this.villageId,
  @required this.villageName,
  this.mandalId,
  this.roleId,
});

}