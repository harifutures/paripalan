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

}