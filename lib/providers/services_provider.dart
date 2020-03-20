import 'package:flutter/material.dart';
import '../providers/roleLayer_provider.dart';
import '../models/service.dart';

class ServiceProvider with ChangeNotifier {
  List<Service> _serviceSelected = [];
  static RoleLayerProvider roleLayer;
  List<Service> _serviceList = [
    Service(
      serviceId: 1,
      divisionId: 1,
      serviceCategoryId: 1,
      serviceName: "R.O.R - 1B",
      roleLayerForService: roleLayer.fidnById(1)
    ),
    Service(
        serviceId: 2,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "EC",
        roleLayerForService: roleLayer.fidnById(2)
    ),
    Service(
        serviceId: 3,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Mutation Confirmation Documents",
        roleLayerForService: roleLayer.fidnById(1)
    ),
    Service(
        serviceId: 4,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "House Tax Payment",
        roleLayerForService: roleLayer.fidnById(2)
    ),
    Service(
        serviceId: 5,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Property Tax Payment",
        roleLayerForService: roleLayer.fidnById(1)
    ),
    Service(
        serviceId: 6,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Water Tax Payment",
        roleLayerForService: roleLayer.fidnById(2)
    ),
    Service(
        serviceId: 7,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Current Bill Payment",
        roleLayerForService: roleLayer.fidnById(1)
    ),
    Service(
        serviceId: 9,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "YSR Bhema Claim Services",
        roleLayerForService: roleLayer.fidnById(2)
    ),
    Service(
        serviceId: 10,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Changes In Ration Card",
        roleLayerForService: roleLayer.fidnById(1)
    ),
    Service(
        serviceId: 11,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Birth Registration",
        roleLayerForService: roleLayer.fidnById(2)
    ),
    Service(
        serviceId: 12,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Death Registration",
        roleLayerForService: roleLayer.fidnById(1)
    ),
    Service(
        serviceId: 13,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Marriage Registration",
        roleLayerForService: roleLayer.fidnById(2)
    ),
    Service(
        serviceId: 14,
        divisionId: 1,
        serviceCategoryId: 1,
        serviceName: "Matsyakara Society Registration",
        roleLayerForService: roleLayer.fidnById(1)
    ),
    Service(
        serviceId: 15,
        divisionId: 1,
        serviceCategoryId: 2,
        serviceName: "Issue New Ration Card",
        roleLayerForService: roleLayer.fidnById(1)
    ),
    Service(
        serviceId: 16,
        divisionId: 1,
        serviceCategoryId: 2,
        serviceName: "Occupancy Certificate",
        roleLayerForService: roleLayer.fidnById(2)
    ),Service(
        serviceId: 17,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Title Deed Cum Pass Book",
        roleLayerForService: roleLayer.fidnById(1)
    ),Service(
        serviceId: 18,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Income Certificate",
        roleLayerForService: roleLayer.fidnById(2)
    ),
    Service(
        serviceId: 19,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Job Card Payment Details",
        roleLayerForService: roleLayer.fidnById(1)
    ),Service(
        serviceId: 20,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Local Residence Confirmation Document",
        roleLayerForService: roleLayer.fidnById(2)
    ),Service(
        serviceId: 21,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Trade Licence Renewal",
        roleLayerForService: roleLayer.fidnById(1)
    ),Service(
        serviceId: 22,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Current Meter Testing",
        roleLayerForService: roleLayer.fidnById(2)
    ),Service(
        serviceId: 23,
        divisionId: 1,
        serviceCategoryId: 3,
        serviceName: "Change Current Connection Category",
        roleLayerForService: roleLayer.fidnById(1)
    ),Service(
        serviceId: 24,
        divisionId: 1,
        serviceCategoryId: 4,
        serviceName: "F-LINE Application",
        roleLayerForService: roleLayer.fidnById(1)
    ),Service(
        serviceId: 25,
        divisionId: 1,
        serviceCategoryId: 4,
        serviceName: "Village Map Copy",
        roleLayerForService: roleLayer.fidnById(2)
    ),Service(
        serviceId: 26,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "OBC Certificate",
        roleLayerForService: roleLayer.fidnById(1)
    ),Service(
        serviceId: 27,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "Issue Income & Property Certificate For Finacially Backward Peoples/Sections",
        roleLayerForService: roleLayer.fidnById(2)
    ),Service(
        serviceId: 28,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "Integrated Certificate",
        roleLayerForService: roleLayer.fidnById(1)
    ),Service(
        serviceId: 29,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "Change Improper Functioning Current Meter (Slow/Over Speed/Not Working)",
        roleLayerForService: roleLayer.fidnById(2)
    ),Service(
        serviceId: 30,
        divisionId: 1,
        serviceCategoryId: 5,
        serviceName: "LT Current Connection For Houses",
        roleLayerForService: roleLayer.fidnById(1)
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

  List<Service> getServicesSelected() {
    return _serviceSelected;
  }

  setServicesSelected(List<Service> servicesSelected) {
    this._serviceSelected = servicesSelected;
  }
}