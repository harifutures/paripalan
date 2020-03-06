import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceProvider with ChangeNotifier {
  List<Service> _serviceList = [
    Service(
      serviceId: 1,
      divisionId: 1,
      serviceCategoryId: 1,
      serviceName: "R.O.R - 1B",
    ),
    Service(
        serviceId: 2,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "EC"
    ),
    Service(
        serviceId: 3,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Mutation Confirmation Documents"
    ),
    Service(
        serviceId: 4,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "House Tax Payment"
    ),
    Service(
        serviceId: 5,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Property Tax Payment"
    ),
    Service(
        serviceId: 6,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Water Tax Payment"
    ),
    Service(
        serviceId: 7,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Current Bill Payment"
    ),
    Service(
        serviceId: 8,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: ""
    ),
    Service(
        serviceId: 9,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "YSR Bhema Claim Services"
    ),
    Service(
        serviceId: 10,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Changes In Ration Card"
    ),
    Service(
        serviceId: 11,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Birth Registration"
    ),
    Service(
        serviceId: 12,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Death Registration"
    ),
    Service(
        serviceId: 13,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Marriage Registration"
    ),
    Service(
        serviceId: 14,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Matsyakara Society Registration"
    ),
    Service(
        serviceId: 15,
        divisionId: 1,
        serviceCategoryId: 2,
        serviceName: "Issue New Ration Card"
    ),
    Service(
        serviceId: 16,
        divisionId: 1,
        serviceCategoryId: 2,
        serviceName: "Occupancy Certificate"
    ),Service(
        serviceId: 17,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Title Deed Cum Pass Book"
    ),Service(
        serviceId: 18,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Income Certificate"
    ),
    Service(
        serviceId: 19,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Job Card Payment Details"
    ),Service(
        serviceId: 20,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Local Residence Confirmation Document"
    ),Service(
        serviceId: 21,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Trade Licence Renewal"
    ),Service(
        serviceId: 22,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Current Meter Testing"
    ),Service(
        serviceId: 23,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Change Current Connection Category"
    ),Service(
        serviceId: 24,
        divisionId: 1,
        serviceCategoryId: 4,
        serviceName: "F-LINE Application"
    ),Service(
        serviceId: 25,
        divisionId: 1,
        serviceCategoryId: 4,
        serviceName: "Village Map Copy"
    ),Service(
        serviceId: 26,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "OBC Certificate"
    ),Service(
        serviceId: 27,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "Issue Income & Property Certificate For Finacially Backward Peoples/Sections"
    ),Service(
        serviceId: 28,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "Integrated Certificate"
    ),Service(
        serviceId: 29,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "Change Improper Functioning Current Meter (Slow/Over Speed/Not Working)"
    ),Service(
        serviceId: 30,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "LT Current Connection For Houses"
    ),
  ];

  List<Service> get serviceList {
    return [..._serviceList];
  }

  List<Service> findServicesByCategoryId(int serviceCategoryId) {
    return _serviceList.where((service) => service.serviceCategoryId == serviceCategoryId).toList();
  }
  List<Service> findServicesByDivisionId(int divisionId) {
    return _serviceList.where((service) => service.divisionId == divisionId).toList();
  }
}