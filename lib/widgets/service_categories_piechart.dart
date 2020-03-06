import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:paripalan/models/serviceCategory.dart';
import 'package:provider/provider.dart';

import '../widgets/inherited_servicesPerCategory_stream_widget.dart';
import '../screens/services_per_category_screen.dart';
import '../providers/services_category_provider.dart';

class ServiceCategoriesPie extends StatefulWidget {

List<charts.Series> seriesCategoriesData;
ServiceCategoriesPie({Key key, this.seriesCategoriesData}) : super(key: key);

@override
_ServiceCategoriesPieState createState() => _ServiceCategoriesPieState();

}

class _ServiceCategoriesPieState extends State<ServiceCategoriesPie> {
  ServiceCategory serviceCategorySelected;
  charts.Color originalColorOfServiceCategorySelected;
  charts.Color setOriginalColorOfServiceCategorySelected;
  @override
  Widget build(BuildContext context) {
    serviceCategorySelected = Provider.of<ServiceCategoryProvider>(context, listen:false).getServiceCategorySelected;
    /**
     * If user selects category1 for the first time then that category1 color in pie chart should be changed/highlighted to indicate that this is being selected.
     */
    if(null != serviceCategorySelected) {
      widget.seriesCategoriesData.forEach((element) {
        element.data.forEach((serviceCategoryData) {
          print("Printg Instance..");
          if (identical(serviceCategoryData, serviceCategorySelected)) {
            setOriginalColorOfServiceCategorySelected = Provider.of<ServiceCategoryProvider>(context, listen: false).getOriginalColor;
            if(null == setOriginalColorOfServiceCategorySelected) {
              originalColorOfServiceCategorySelected =
                  serviceCategoryData.getCategoryColor;
              Provider.of<ServiceCategoryProvider>(context).setOriginalColor(serviceCategoryData.getCategoryColor);
            } else {
              originalColorOfServiceCategorySelected = setOriginalColorOfServiceCategorySelected;
              Provider.of<ServiceCategoryProvider>(context).setOriginalColor(originalColorOfServiceCategorySelected);
            }
            serviceCategoryData.withCategoryColor(charts.MaterialPalette.green.shadeDefault.lighter);
          }

        });
      });
    }
    print("===inside pie===");
    return Container (
        padding: EdgeInsets.all(8.0),
        //  constraints: BoxConstraints(maxHeight: 400.00),
        height: 350.00,
        width: 350.00,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
        child:
            new charts.PieChart(widget.seriesCategoriesData,
                animate: true,
                //animationDuration: Duration(seconds: 5),
                //defaultInteractions: true,
                /*behaviors: [
                        new charts.SelectNearest(
                          expandToDomain: true,
                          selectClosestSeries: false,
                          eventTrigger: charts.SelectionTrigger.tap,
                        ),
                        new charts.DatumLegend(
                          outsideJustification:
                          charts.OutsideJustification.endDrawArea,
                          horizontalFirst: false,
                          desiredMaxRows: 3,
                          cellPadding:
                          new EdgeInsets.only(right: 5.0, bottom: 5.0,top:5.0),
                          entryTextStyle: charts.TextStyleSpec(
                              color: charts.MaterialPalette.white,
                              fontFamily: 'Georgia',
                              fontSize: 15),
                        )
                      ],*/
                      selectionModels: [
                        new charts.SelectionModelConfig(
                          type: charts.SelectionModelType.info,
                          changedListener: _onSelectionChanged,
                        )
                      ],
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 110,
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator(

                                labelPosition: charts.ArcLabelPosition.inside,
                                insideLabelStyleSpec: charts.TextStyleSpec(color: charts.MaterialPalette.indigo.shadeDefault, fontSize: 13)
                          )]),

            ))
          ],
        )
    );
  }

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    if (selectedDatum.isNotEmpty) {

      /**
       * Setting selected category color back to its original when it was deselected, means if user selected another category than before.
       * Ex: If user selects category1 for the first time then that category1 color in pie chart would be changed/highlighted to indicate that this is being selected. After this
       * If user decided to change the category to category2 (click on category2 in pie chart) from category1, then category2 color should be changed/highlighted and category1 color should be unselected (changed back to category1's original color of pie chart)
       *
       * */
      if (null != serviceCategorySelected) {
        widget.seriesCategoriesData.forEach((element) {
          element.data.forEach((serviceCategoryData) {
            print("Printg Instance..");
            if (identical(serviceCategoryData, serviceCategorySelected)) {
              serviceCategoryData.withCategoryColor(
                  originalColorOfServiceCategorySelected);
            }
          });
        });
      }
        //InheritedServicesPerCategory(child: ServicesPerServiceCategory(servicesCategoriesData: selectedDatum), serviceCategoryData: selectedDatum);
        Navigator.pushNamed(
            context,
            //NavigationHelper.routeName,
            ServicesPerServiceCategory.routeName,
            arguments: selectedDatum
        );

        print("=====Name======== " +
            selectedDatum.first.datum.serviceCategoryId.toString());
        setState(() {

        });
      }
    }
  }