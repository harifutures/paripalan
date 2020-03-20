import 'package:flutter/foundation.dart';
import 'package:paripalan/widgets/change_role_form_widget.dart';
import '../models/role.dart';

/// Horizontal Role
class RoleLayer with ChangeNotifier {
  final int roleLayerId;
  /* Same role category persons fall under same lane.
    Ex: If there are 3 vaulanteers in a village each one has a diffrent role but they are fall under same lane/category (horizontal roles).
    And the next level employees like VRO and similar roles fall under a diffrent lane.
    i.e. RoleLayer 1 {role1, role2, role3 ...}
    RoleLayer 2 {role4, role5 ...}
  */
  final String roleLayerName;
  final Role role;
  /*TODO: Convert Division to enum */
  final int divisionId;

  RoleLayer({
    this.roleLayerId,
    this.roleLayerName,
    this.divisionId,
    this.role
  });
}