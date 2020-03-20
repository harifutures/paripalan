import 'package:flutter/foundation.dart';

import '../models/roleLayer.dart';
import '../models/serviceCategory.dart';

class Service with ChangeNotifier {

  final int serviceId;
  final int serviceCategoryId;
  // Divisions are : state, district, Mandal, Village.
  final int divisionId;
  final String serviceName;
  final RoleLayer roleLayerForService;
  bool isSelected;

  Service({
    this.serviceId,
    this.divisionId,
    this.serviceName,
    this.serviceCategoryId,
    this.isSelected,
    this.roleLayerForService
  });

  int get getServiceId => this.serviceId;
}