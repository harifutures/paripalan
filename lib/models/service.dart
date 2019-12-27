import 'package:flutter/foundation.dart';

class Service with ChangeNotifier {

  final int serviceId;
  // Divisions are : state, district, Mandal, Village.
  final int divisionId;
  final String serviceName;

  Service({
    this.serviceId,
    this.divisionId,
    this.serviceName
  });

  int get getServiceId => this.serviceId;
}