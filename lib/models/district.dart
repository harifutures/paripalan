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

bool operator ==(o) => o is District && o.districtName == districtName && o.districtId == districtId && o.stateId == stateId;
int get hashCode => districtName.hashCode^districtId.hashCode^stateId.hashCode;


// bool operator ==(o) => o is Person && name == o.name && age == o.age;
//   int get hashCode => hash2(name.hashCode, age.hashCode);

}