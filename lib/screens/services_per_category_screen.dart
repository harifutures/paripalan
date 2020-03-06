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

  ServicesPerServiceCategory({Key key, this.servicesCategoriesData})
      : super(key: key);

  @override
  _ServicesPerServiceCategoryState createState() =>
      _ServicesPerServiceCategoryState();
}

class _ServicesPerServiceCategoryState
    extends State<ServicesPerServiceCategory> {

  var _isLongPress = false;
  var _itemColor = Colors.white;
  List<charts.SeriesDatum> serviceCategory;

  @override
  Widget build(BuildContext context) {
    widget.servicesCategoriesData = ModalRoute.of(context).settings.arguments;
    Provider.of<ServiceCategoryProvider>(context)
        .setServiceCategorySelected(widget.servicesCategoriesData.first.datum);
    final servicesPerCategoryList = Provider.of<ServiceProvider>(context)
        .findServicesByCategoryId(
            widget.servicesCategoriesData.first.datum.serviceCategoryId);

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
          //SizedBox(height: 10),
          //Center(child:Text("\"Pull Right to Select\"", style: TextStyle(fontSize: 22, color: Colors.blueGrey),)),
          /*Container (
            height: 70,
           // width: 400,
            //constraints: BoxConstraints(maxHeight: 35.00),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/drag_to_select4.png'),
                  //fit: BoxFit.cover,
                )
            )),*/
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: servicesPerCategoryList.length,
              itemBuilder: (ctx, index) =>
              _showAllService(servicesPerCategoryList, index)
                  //_showAllService(servicesPerCategoryList[index], index),
            ),
          )
        ],
      ),
    );
  }

  //Widget _showAllService(Service service, int index) {
  Widget _showAllService(List<Service> servicesPerCategoryList, int index) {

    return GestureDetector(
      onTap: () {
        if (servicesPerCategoryList.any((item) => null != item.isSelected && item.isSelected)) {
          setState(() {
            if(null != servicesPerCategoryList[index].isSelected) {
              servicesPerCategoryList[index].isSelected =
              !servicesPerCategoryList[index].isSelected;
            } else {
              servicesPerCategoryList[index].isSelected = true;
            }
          });
        }
      },
      onLongPress: () {
        setState(() {
          servicesPerCategoryList[index].isSelected = true;
        });
      },
      child: Card(
        //height: 100,
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 4),
        color: (null != servicesPerCategoryList[index].isSelected && servicesPerCategoryList[index].isSelected) ? Colors.grey[300] : Colors.white,
        child:Padding(
          padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 7.0),
          child: ListTile(
                title: Text(servicesPerCategoryList[index].serviceName,
                    style: TextStyle(fontSize: 22, color: Colors.blueGrey),
              ),
            ),
        )
      )
    );




      /*Container(
      height: 100,*/
      //Flex ( direction: Axis.horizontal,children: <Widget> [Expanded (
          //child: Container(
            //height: 100,
    //          child:
   /* Container(
                //elevation: 2.0,
                margin: EdgeInsets.all(5.0),


                color: service.isSelected ? Colors.grey[300] : Colors.white,
                //color: _colorChange(),
                //color: _itemColor,
                *//*margin: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 4,
          ),*//*

                *//*child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Padding(
                        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),*//*
                        child: ListTile(
                          selected: _isLongPress,
                          onLongPress: _toggleSelection,
                          title: Text(service.serviceName,
                          style: TextStyle(fontSize: 22, color: Colors.blueGrey),
                          //    overflow: TextOverflow.ellipsis
                          ),
                          ),
                          //trailing: processTrails(myRequest, index),
                        *//*),
                    ]),*//*
              );*///)
      //)]);
  }

  void _toggleSelection() {
    setState(() {
      if (_isLongPress) {
        _itemColor = Colors.white;
        _isLongPress = false;
      } else {
        _itemColor = Colors.grey[300];
        _isLongPress = true;
      }
    });
  }

  Color _colorChange() {
    //setState(() {
      if (_isLongPress) {
        _itemColor = Colors.grey[300];
        _isLongPress = false;
      } else {
        _itemColor = Colors.white;
      }
    //});
    return _itemColor;
  }
}
