import 'package:flutter/foundation.dart';

class Role with ChangeNotifier {
  final int roleId;
  final String roleName;

  Role({
    @required this.roleId,
    @required this.roleName
  });
}