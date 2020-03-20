import 'package:flutter/material.dart';
import '../models/serviceCategory.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ServiceCategoryProvider with ChangeNotifier {
  ServiceCategory _serviceCategorySelected;
  charts.Color _originalColor;
  List<ServiceCategory> _serviceCategoryList = [
    ServiceCategory(
        serviceCategoryId: 0,
        serviceCategoryName: "Others",
        categoryColor: charts.MaterialPalette.gray.shade500
    ),
    ServiceCategory(
      serviceCategoryId: 1,
        serviceCategoryName: "72 HOURS \n(280 SERVCIES)",
      categoryColor: charts.MaterialPalette.gray.shade400
    ),
    ServiceCategory(
        serviceCategoryId: 2,
        serviceCategoryName: "5 DAYS \n(6 SERVCIES)",
        categoryColor: charts.MaterialPalette.gray.shade500
    ),
    ServiceCategory(
        serviceCategoryId: 3,
        serviceCategoryName: "7 DAYS \n(98 SERVCIES)",
        categoryColor: charts.MaterialPalette.gray.shade400
    ),
    ServiceCategory(
        serviceCategoryId: 4,
        serviceCategoryName: "10 DAYS \n(2 SERVCIES)",
        categoryColor: charts.MaterialPalette.gray.shade500
    ),
    ServiceCategory(
        serviceCategoryId: 5,
        serviceCategoryName: "30 DAYS \n(57 SERVCIES)",
        categoryColor: charts.MaterialPalette.gray.shade400
    ),

  ];

  List<ServiceCategory> get serviceCategoryList {
    return [..._serviceCategoryList];
  }

  setServiceCategorySelected(ServiceCategory serviceCategory) {
    this._serviceCategorySelected = serviceCategory;
  }

  ServiceCategory fidnById(int serviceCategoryId) {
    //return _stateRastramList.firstWhere((st) => st.stateId == stateId);
    return _serviceCategoryList.firstWhere((sc) => sc.serviceCategoryId == serviceCategoryId);
  }

  ServiceCategory get getServiceCategorySelected => this._serviceCategorySelected;

  setOriginalColor(charts.Color originalColor) {
    this._originalColor =  originalColor;
  }

  charts.Color get getOriginalColor => this._originalColor;

}