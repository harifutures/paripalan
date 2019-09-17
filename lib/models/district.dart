import 'package:flutter/foundation.dart';

class District with ChangeNotifier {
  final int districtId;
  final String districtName;
  final int stateId;
  final int roleId;

District ({
  @required this.districtId,
  @required this.districtName,
  this.stateId,
  this.roleId
});

bool operator ==(o) => o is District && o.districtName == districtName && o.districtId == districtId && o.roleId == roleId;
int get hashCode => districtName.hashCode^districtId.hashCode^roleId.hashCode;
/*bool operator ==(o) => o is District && o.districtName == districtName;
int get hashCode => districtName.hashCode;*/
}