import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ServiceCategory with ChangeNotifier {

  final int serviceCategoryId;
  final String serviceCategoryName;
  charts.Color categoryColor;


  ServiceCategory({
    this.serviceCategoryId,
    this.serviceCategoryName,
    this.categoryColor
  });

  int get getServiceCategoryId => this.serviceCategoryId;
  charts.Color get getCategoryColor => this.categoryColor;

  ServiceCategory withCategoryColor(charts.Color newColor) {
    this.categoryColor = newColor;
    return this;
  }

}