import 'package:flutter/foundation.dart';

class Mandal with ChangeNotifier {
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

bool operator ==(o) => o is Mandal && o.mandalName == mandalName && o.mandalId == mandalId && o.roleId == roleId;
int get hashCode => mandalName.hashCode^mandalId.hashCode^roleId.hashCode;
/*bool operator ==(o) => o is Mandal && o.mandalName == mandalName;
int get hashCode => mandalName.hashCode;*/
}