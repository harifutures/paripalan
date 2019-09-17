import 'package:flutter/foundation.dart';

class Village with ChangeNotifier {
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

bool operator ==(v) => v is Village && v.villageName == villageName && v.villageId == villageId;
int get hashCode => villageName.hashCode^villageId.hashCode;

}