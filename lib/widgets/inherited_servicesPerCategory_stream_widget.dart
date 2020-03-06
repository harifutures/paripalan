import 'package:flutter/material.dart';
import '../models/serviceCategory.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class InheritedServicesPerCategory extends InheritedWidget {
final List<charts.SeriesDatum> serviceCategoryData;
final charts.Color originalColor;
InheritedServicesPerCategory({
  Key key,
  this.serviceCategoryData,
  this.originalColor,
  Widget child
}) : super(key:key, child: child);

@override
bool updateShouldNotify(InheritedServicesPerCategory oldWidget) => serviceCategoryData != oldWidget.serviceCategoryData || originalColor != oldWidget.originalColor;
static InheritedServicesPerCategory of(BuildContext context) =>         context.dependOnInheritedWidgetOfExactType<InheritedServicesPerCategory>();
}