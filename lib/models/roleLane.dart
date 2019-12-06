import 'package:flutter/foundation.dart';
import 'package:paripalan/widgets/change_role_form_widget.dart';
import '../models/role.dart';

class RoleLane with ChangeNotifier {
  final int roleLaneId;
  /* Same role category persons fall under same lane.
    Ex: If there are 3 vaulanteers in a village each one has a diffrent role but they are fall under same lane/category.
    And the next level employees like VRO and similar roles fall under a diffrent lane.
    i.e. RoleLane 1 {role1, role2, role3 ...}
    RoleLane 2 {role4, role5 ...}
  */
  final String roleLaneName;
  final Role role;
  /*TODO: Convert Division to enum */
  final int divisionId;

  RoleLane({
    this.roleLaneId,
    this.roleLaneName,
    this.divisionId,
    this.role
  });
}