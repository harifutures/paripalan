import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceProvider with ChangeNotifier {
  List<Service> _serviceList = [
    Service(
      serviceId: 1,
      divisionId: 1,
      serviceName: "Ration Card",
    ),
    Service(
        serviceId: 2,
        divisionId: 1,
        serviceName: "Current Bill"
    ),
    Service(
        serviceId: 3,
        divisionId: 1,
        serviceName: "Water Servcie"
    ),
    Service(
        serviceId: 4,
        divisionId: 1,
        serviceName: "Adhar Card"
    ),
    Service(
        serviceId: 5,
        divisionId: 1,
        serviceName: "Pass Book"
    ),
    Service(
        serviceId: 6,
        divisionId: 1,
        serviceName: "Pension"
    ),
    Service(
        serviceId: 7,
        divisionId: 1,
        serviceName: "Amma vodi"
    ),
    Service(
        serviceId: 8,
        divisionId: 1,
        serviceName: "Nava Ratnalu 1"
    ),
    Service(
        serviceId: 9,
        divisionId: 1,
        serviceName: "Nava Ratnalu 2"
    ),
    Service(
        serviceId: 10,
        divisionId: 1,
        serviceName: "Nava Ratnalu 3"
    ),
    Service(
        serviceId: 11,
        divisionId: 1,
        serviceName: "Nava Ratnalu 4"
    ),
    Service(
        serviceId: 12,
        divisionId: 1,
        serviceName: "Nava Ratnalu 5"
    ),

  ];

  List<Service> get serviceList {
    return [..._serviceList];
  }

  List<Service> findServicesByDivisionId(int divisionId) {
    return _serviceList.where((service) => service.divisionId == divisionId).toList();
  }
}