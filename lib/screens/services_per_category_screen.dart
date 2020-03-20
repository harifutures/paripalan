import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

import '../models/service.dart';
import '../providers/services_category_provider.dart';
import '../providers/services_provider.dart';
import '../widgets/inherited_servicesPerCategory_stream_widget.dart';

class ServicesPerServiceCategory extends StatefulWidget {
  static const routeName = '/servicesPerCategoryScreen';
  List<charts.SeriesDatum> servicesCategoriesData;
  List<Service> servicesPerCategoryList;
  List<Service> servicesSelected = [];

  ServicesPerServiceCategory({Key key, this.servicesCategoriesData})
      : super(key: key);

  @override
  _ServicesPerServiceCategoryState createState() =>
      _ServicesPerServiceCategoryState();
}

class _ServicesPerServiceCategoryState
    extends State<ServicesPerServiceCategory> {

  List<charts.SeriesDatum> serviceCategory;

  @override
  Widget build(BuildContext context) {

    /*TODO: We don't need to reload complete build method  (This loops through the list every time we reload which is not required)
       every time we select an item, instead work on to load only the selected item part
     */
    if(null == widget.servicesCategoriesData) {
      widget.servicesCategoriesData = ModalRoute
          .of(context)
          .settings
          .arguments;
      Provider.of<ServiceCategoryProvider>(context)
          .setServiceCategorySelected(
          widget.servicesCategoriesData.first.datum);
    }

    /*widget.servicesCategoriesData = ModalRoute.of(context).settings.arguments;
    Provider.of<ServiceCategoryProvider>(context)
        .setServiceCategorySelected(widget.servicesCategoriesData.first.datum);*/
    if(null == widget.servicesPerCategoryList || widget.servicesPerCategoryList.length == 0) {
      widget.servicesPerCategoryList = Provider.of<ServiceProvider>(context)
          .findServicesByCategoryId(
          widget.servicesCategoriesData.first.datum.serviceCategoryId);
    }

    /*final servicesPerCategoryList = Provider.of<ServiceProvider>(context)
        .findServicesByCategoryId(
            widget.servicesCategoriesData.first.datum.serviceCategoryId);*/

    /*serviceCategory = InheritedServicesPerCategory.of(context).serviceCategoryData;
    if(null != InheritedServicesPerCategory.of(context) && null != InheritedServicesPerCategory.of(context).serviceCategoryData) {
      serviceCategory = InheritedServicesPerCategory
          .of(context)
          .getServiceCategoryData();
    }*/
    return Scaffold(
      appBar: new AppBar(title: Text("Servcies for Category")),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: widget.servicesPerCategoryList.length,
              itemBuilder: (ctx, index) =>
              _showAllService(widget.servicesPerCategoryList, index)
                  //_showAllService(servicesPerCategoryList[index], index),
            ),
          )
        ],
      ),
    );
  }

  Widget _showAllService(List<Service> servicesPerCategoryList, int index) {
    return GestureDetector(
      onTap: () {
        if (servicesPerCategoryList.any((item) => null != item.isSelected && item.isSelected)) {
          setState(() {
            if(null != servicesPerCategoryList[index].isSelected) {
              servicesPerCategoryList[index].isSelected =
              !servicesPerCategoryList[index].isSelected;
              if(null != widget.servicesSelected) {
                //widget.servicesSelected = Provider.of<ServiceProvider>(context).getServicesSelected();
                widget.servicesSelected.remove(servicesPerCategoryList[index]);
              }
            } else {
              servicesPerCategoryList[index].isSelected = true;

              if(null == widget.servicesSelected || 0 == widget.servicesSelected.length ||
                  (widget.servicesSelected[0].serviceCategoryId == widget.servicesCategoriesData.first.datum.serviceCategoryId)) {
                //widget.servicesSelected = Provider.of<ServiceProvider>(context).getServicesSelected();
                widget.servicesSelected.add(servicesPerCategoryList[index]);
              } else { // If current serviceCategoryId and the serviceCategoryId in servicesSelected is not matched.
                widget.servicesSelected = null;
                //widget.servicesSelected = Provider.of<ServiceProvider>(context).getServicesSelected();
                widget.servicesSelected.add(servicesPerCategoryList[index]);
              }
            }
            Provider.of<ServiceProvider>(context).setServicesSelected(widget.servicesSelected);
          });
        }
      },
      onLongPress: () {
        /*At any time,an user can select/submit services under only one category,
              if the user already selected services under another category then
              just make servicesSelected empty and add current selected services to the servicesSelected list.
              So, servicesSelected is null/empty in 2 cases,
              1) If the user first time selected category.
              2) If the user was under one category before but wanted to choose a different category services now (we make the servicesSelected null and add the new selection).
              Note: If the user selects the same category again again then the servicesSelected list data wont be lost.
              */
        if(null == widget.servicesSelected || 0 == widget.servicesSelected.length ||
            (widget.servicesSelected[0].serviceCategoryId == widget.servicesCategoriesData.first.datum.serviceCategoryId)) {
          //widget.servicesSelected = Provider.of<ServiceProvider>(context).getServicesSelected();
          widget.servicesSelected.add(servicesPerCategoryList[index]);
        } else { // If current serviceCategoryId and the serviceCategoryId in servicesSelected is not matched.
          widget.servicesSelected = null;
          widget.servicesSelected.add(servicesPerCategoryList[index]);
        }

        setState(() {
          servicesPerCategoryList[index].isSelected = true;
        });

        Provider.of<ServiceProvider>(context).setServicesSelected(widget.servicesSelected);
      },
      /*TODO: onTap is responding slowly if we enable onDoubleTap, Not sure why? re enable this when find the solution for quick onTap response*/
      /*onDoubleTap: () {
        setState(() {
          servicesPerCategoryList[index].isSelected = true;
        });
      },*/

      child: Card(
        //height: 100,
        elevation: 1,
        //margin: EdgeInsets.symmetric(vertical: 4),
          margin: EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 8.0),
        color: (null != servicesPerCategoryList[index].isSelected && servicesPerCategoryList[index].isSelected) ? Colors.grey[300] : Colors.white,
        child:Padding(
          padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 7.0),
          child: ListTile(
            leading: (null != servicesPerCategoryList[index].isSelected && servicesPerCategoryList[index].isSelected) ?
              Padding(
              padding: EdgeInsets.all(3),
              child: Icon(
                Icons.check_circle,
                color: Colors.blue,
                size: 30,
              ))
            : null,
             title: Text(servicesPerCategoryList[index].serviceName,
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
              ),
            ),
        )
      )
    );

  }
}
