import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paripalan/models/address.dart';
import 'package:paripalan/models/appConstants.dart';
import 'package:paripalan/providers/users_provider.dart';
import 'package:paripalan/screens/home/navigation_helper.dart';
import 'package:paripalan/screens/home/navigations_screen.dart';
import 'package:paripalan/screens/myService_requests_screen.dart';
import 'package:paripalan/widgets/service_categories_piechart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../providers/departments_provider.dart';
import '../providers/states_provider.dart';
import '../providers/districts_provider.dart';
import '../providers/mandals_provider.dart';
import '../providers/villages_provider.dart';
import '../providers/role_provider.dart';
import '../providers/services_provider.dart';
import '../providers/services_category_provider.dart';
import '../providers/myRequests_provider.dart';

import '../providers/state.dart';
import '../models/district.dart';
import '../models/mandal.dart';
import '../models/village.dart';
import '../models/role.dart';
import '../models/service.dart';
import '../models/serviceCategory.dart';
import '../models/serviceRequest.dart';

import '../widgets/districts_dropdown_widget.dart';
import '../widgets/mandals_dropdown_widget.dart';
import '../widgets/dropdowns_widget.dart';
import '../widgets/main_drawer.dart';

class ServiceRequestScreen extends StatefulWidget {
  static const routeName = '/serviceRequestScreen';
  
  @override
  _ServiceRequestScreenState createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  final _descriptionFocusNode = FocusNode();

  final _phoneFocusNode = FocusNode();

  final _imageUrlController = TextEditingController();
  var _serviceDescriptionController = TextEditingController();

  final _imageUrlFocusNode = FocusNode();

  List<Role> rolesByDivisionList;
  List<ServiceCategory> serviceCategoriesList;

  Role _roleToApply;

  //String _roleToDisplayByPosition = 'Role..';
  Role _roleToDisplayByPosition;
  int _divisions;
  int _primarySectors;

  List<Service> servicesByDivisionList;

  Role _serviceToApply;

  //String _serviceToDisplayByPosition = 'Service..';
  Service _serviceToDisplayByPosition;
  int _divisionsForServices;
  int _primarySectorsForServices;
  ServiceRequest _serviceRequest;
  //int _positionsDragged = 0;

  final _form = GlobalKey<FormState>();

  var _isInit = true;

  var _isLoading = false;

  File _image;
  List<charts.Series<ServiceCategory, String>> _serviceCategoryData = List<charts.Series<ServiceCategory, String>>();


  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    /*if(null != _serviceDescriptionController && "" != _serviceDescriptionController.text) {
      _serviceRequest.serviceRequestDescription =
          _serviceDescriptionController.text;
    }*/
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _phoneFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    _serviceDescriptionController.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }
//TODO: Need to validate for providing either service or description for sure, and role must be chosen always..
  Future<void> _saveForm() async {
    //_showMessage();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<MyRequestsProvider>(context, listen: false)
          .addServiceRequest(
          _serviceToDisplayByPosition,
          _roleToDisplayByPosition,
          _serviceRequest.serviceRequestDescription,
          "Pending");
      Navigator.pop(context); //Pops the current screen.
      //NavigationPage(tabIndex : 1);
      Navigator.pushNamed(
          context,
          //NavigationHelper.routeName,
          NavigationPage.routeName,
          arguments: 1 // 1 is the screen index .
      );
    } catch (error) {
      // Using await here because, to call the finally block only after user selected 'Ok' on error popup dialog.
        await showDialog(
          context: context,
          builder: (ctx) =>
              AlertDialog(
                title: Text('An error occurred!'),
                content: Text('Something went wrong.'),
                actions: <Widget>[
                  FlatButton(child: Text('Okay'), onPressed: () {
                    Navigator.of(ctx).pop();
                  },)
                ],
              ),
        );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    // final isValid = _form.currentState.validate();
    // if (!isValid) {
    //   return;
    // }
    // _form.currentState.save();
    // if (_editedProduct.id != null) {
    //   Provider.of<Products>(context, listen: false)
    //       .updateProduct(_editedProduct.id, _editedProduct);
    // } else {
    //   Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    // }
    // Navigator.of(context).pop();
  }

void _showMessage() {
    Scaffold.of(context)
        .showSnackBar(new SnackBar(
          content: new Text(
            "Submitting Form..",
            style: TextStyle(color: Colors.purpleAccent, fontSize: 15),
            ),
          backgroundColor: Colors.blue[100],
          ));
  }

  Future getImage() async {
    /*We can choose ImageSource as camera or gallery whatever is required.*/ 
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Row breadCrumb(UserProvider userProvider) {
    if(null != userProvider && null != userProvider.findById(1) 
                            && null != userProvider.findById(1).address.getStateRastram
                            && null != userProvider.findById(1).address.getStateRastram.stateName) {
            
            Address address = userProvider.findById(1).address;
            String stateName = "";
            String districtName = "";
            String mandalName = "";
            String villageName = "";
            //stateName = address.getStateRastram.stateName;
            return Row (
              children: [
                /*if(null != stateName && "" != stateName) 
                  buildBreadCrumbValue(stateName),*/
                if(null != address.getDistrict && "" != address.getDistrict.districtName && "" != address.getDistrict.districtName)
                  buildBreadCrumbValue(address.getDistrict.districtName, true),
                if(null != address.getMandal && "" != address.getMandal.mandalName && "" != address.getMandal.mandalName)
                  buildBreadCrumbValue(address.getMandal.mandalName, true),
                if(null != address.getVillage && "" != address.getVillage.villageName && "" != address.getVillage.villageName)
                  buildBreadCrumbValue(address.getVillage.villageName, false),
            ]);
        }
  }

  RichText buildBreadCrumbValue(String name, bool attachIcon) {
    return RichText(
            text: new TextSpan(
              children: [
                TextSpan(
                  text: name, 
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54,
                    backgroundColor: Colors.blue[100]
                  )
                ),
                if(attachIcon)
                  WidgetSpan(
                    child: new Icon(Icons.arrow_forward, color: Colors.black45),
                  ),
              ]),
          );
  }

  @override
  Widget build (BuildContext context) {
    //final stateRastarmProvider = Provider.of<StatesProvider>(context);
    final _userProvider = Provider.of<UserProvider>(context);
    _serviceRequest = Provider.of<ServiceRequest>(context);
    _handleServicesAndRoles(_userProvider);

    String stateName = "";
    if(null != _userProvider && null != _userProvider.findById(1)
                             && null != _userProvider.findById(1).address
                             && null != _userProvider.findById(1).address.getStateRastram) {
      stateName = _userProvider.findById(1).address.getStateRastram.stateName;
    }
    
    return _isLoading
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Scaffold(
       appBar: AppBar(
         title: Text('Service Request'),
         actions: <Widget>[
           MaterialButton(
             onPressed: () => {
               _saveForm(),
             },
             child: Text(
               'Send',
               style: TextStyle(
                 fontSize: AppConstants.smallFontSize,
                 color: Colors.white,
               ),
             ),
             textColor: Colors.white,
           ),
         ],
       ),
      drawer: MainDrawer(),
      body: Padding (
        padding: const EdgeInsets.all(16.0),
        child: Form (
          child: ListView (
            children: <Widget>[
              if(null != stateName && "" != stateName)
                Container(
                  padding: EdgeInsets.only(),
                  child: breadCrumb(_userProvider),
                ),
              SizedBox(
                height: 12.0,
              ),
                  Container (
                    constraints: BoxConstraints(maxHeight: 370.00),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        //image: AssetImage('assets/images/background_morning.png'),
                        //image: AssetImage('assets/images/background.png'),
                        image: AssetImage('assets/images/background2.png'),
                        fit: BoxFit.cover,
                      )
                    ),
                    child: Column (

                      children: <Widget> [
                      /* Row(
                      children: <Widget>[*/
                        ServiceCategoriesPie(seriesCategoriesData: _serviceCategoryData),

                    ]),

                //  ]),

              ),
              SizedBox(
                height: 12.0,
              ),
              TextFormField(
                  //initialValue: _initValues['description'],
                  controller: TextEditingController(text: _serviceRequest.serviceRequestDescription),
                  //controller: _serviceDescriptionController,
                  decoration: InputDecoration(
                     // icon: Icon(Icons.description),
                      labelText: 'Write Description Here..',
                    contentPadding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 7.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.vertical(bottom: Radius.zero, top: Radius.zero)),
                  ),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                //  focusNode: _descriptionFocusNode,
                  onChanged: (textVal) {
                    _serviceRequest.serviceRequestDescription = textVal;
                   },
                  /*onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_phoneFocusNode);
                },*/
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a description.';
                    }
                    if (value.length < 10) {
                      return 'Should be at least 10 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // _editedProduct = Product(
                    //   title: _editedProduct.title,
                    //   price: _editedProduct.price,
                    //   description: value,
                    //   imageUrl: _editedProduct.imageUrl,
                    //   id: _editedProduct.id,
                    //   isFavorite: _editedProduct.isFavorite,
                    // );
                  }
              ),
              //Populate DropDowns.
             // RegionDropDowns(),
              SizedBox(
                height: 20.0,
              ),
              Row(
                //heightFactor: 5,
                children:<Widget> [
                  FloatingActionButton(
                    onPressed: getImage,
                    tooltip: 'Pick Image',
                    child: Icon(Icons.add_a_photo),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                  ),
                  _image == null ? Text(
                  'Photo Attachment',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ) : Image.file(_image),

             ] ),
              SizedBox(
                height: 20.0,
              ),

              new Center(
                //padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                heightFactor: 2,
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blueGrey),
                  ),
                  color: Colors.blueGrey,
                  splashColor: Colors.purple,
                  child: const Text('Send'),
                  onPressed: _saveForm,
                )
              ),
              // IconButton(
              //   icon: Icon(Icons.save),
              //   onPressed: _saveForm,
              // ),

            ],
          ),
        
        ),
      ),
    );

  }

  void _handleServicesAndRoles(UserProvider userProvider) {
    String addressSwitch;
    if(null != userProvider && null != userProvider.findById(1)
      && null != userProvider.findById(1).address.getStateRastram
      && null != userProvider.findById(1).address.getStateRastram.stateName) {

      Address address = userProvider
          .findById(1)
          .address;

      if (null != address.getVillage && "" != address.getVillage.villageName &&
          "" != address.getVillage.villageName) {
        addressSwitch = "Village";
      }
    }


    setState(() {

      switch (addressSwitch) {
        case "State":
          print("case 0");
          break;
        case "District":
          print("case 1");
          break;
        case "Mandal":
          print("case 2");
          break;
        case "Village":
          print("case 3");
          callPerDivision(1);
          break;
        default:
          print("Nothing selected");
          break;
      }
    });
  }

  callPerDivision(int divisionId) {
    /*rolesByDivisionList =
        Provider.of<RoleProvider>(context).findRolesByDivisionId(divisionId);
    servicesByDivisionList =
        Provider.of<ServiceProvider>(context).findServicesByDivisionId(divisionId);*/
    serviceCategoriesList =
        Provider.of<ServiceCategoryProvider>(context).serviceCategoryList;
    //bool isSelected = false;
    if(null != _serviceCategoryData && _serviceCategoryData.length == 0 ) {
      _serviceCategoryData.add(
          charts.Series<ServiceCategory, String>(
            id: 'category',
            data: serviceCategoriesList,
            domainFn: (ServiceCategory serviceCategory, _) => serviceCategory.serviceCategoryName,
            //measureFn: (ServiceCategory serviceCategory, _) => serviceCategory.serviceCategoryId,
            measureFn: (ServiceCategory serviceCategory, _) => 5,
            labelAccessorFn: (ServiceCategory serviceCategory, _) => '${serviceCategory.serviceCategoryName}',
            colorFn: (ServiceCategory serviceCategory, _) => serviceCategory.categoryColor
      /*      colorFn: (ServiceCategory serviceCategory, _) =>
            isSelected ? charts.MaterialPalette.green.shadeDefault : charts.MaterialPalette.blue.shadeDefault*/
          )
      );
    }
  }
}

