import 'package:flutter/foundation.dart';

class Department {
  final String id;
  final String departmentName;
  final String description;
  final String state;
  final String district;
  final String mandal;
  final String village;
  final String role;

  Department({
    @required this.id,
    @required this.departmentName,
    this.description,
    @required this.state,
    @required this.district,
    this.mandal,
    this.village,
    @required this.role
  });
}