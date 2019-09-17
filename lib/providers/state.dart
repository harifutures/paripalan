import 'package:flutter/foundation.dart';

class StateRastram with ChangeNotifier {
  final int stateId;
  final String stateName;
  final int roleId;

StateRastram ({
  @required this.stateId,
  @required this.stateName,
  this.roleId
});

bool operator ==(o) => o is StateRastram && o.stateName == stateName && o.stateId == stateId;
int get hashCode => stateName.hashCode^stateId.hashCode;

}