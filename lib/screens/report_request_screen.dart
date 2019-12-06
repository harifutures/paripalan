import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paripalan/models/address.dart';
import 'package:paripalan/providers/users_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_modern/image_picker_modern.dart';

import '../providers/departments_provider.dart';
import '../providers/states_provider.dart';
import '../providers/districts_provider.dart';
import '../providers/mandals_provider.dart';
import '../providers/villages_provider.dart';
import '../providers/role_provider.dart';

import '../providers/state.dart';
import '../models/district.dart';
import '../models/mandal.dart';
import '../models/village.dart';
import '../models/Role.dart';

import '../widgets/districts_dropdown_widget.dart';
import '../widgets/mandals_dropdown_widget.dart';
import '../widgets/dropdowns_widget.dart';
import '../widgets/main_drawer.dart';

class ReportRequest extends StatefulWidget {
  static const routeName = '/reportRequest';
  
  @override
  _ReportRequestState createState() => _ReportRequestState();
}

class _ReportRequestState extends State<ReportRequest> {
  final _descriptionFocusNode = FocusNode();

  final _phoneFocusNode = FocusNode();

  final _imageUrlController = TextEditingController();

  final _imageUrlFocusNode = FocusNode();

  final _form = GlobalKey<FormState>();

  var _isInit = true;

  File _image;

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _phoneFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
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

  void _saveForm() {
    _showMessage();
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
    /*final departmentsData = Provider.of<Departments>(context);
    final departments = departmentsData.departmentList;
    final stateRastarmList = Provider.of<StatesProvider>(context, listen: false);
    final statesRastram = stateRastarmList.stateRastramList;
   // final districtList = Provider.of<DistrictsProvider>(context);
    //final districts = districtList.districtList;
    
    final mandalList = Provider.of<MandalsProvider>(context, listen: false);
    final mandals = mandalList.mandalList;
    final villageList = Provider.of<VillagesProvider>(context, listen: false);
    final villages = villageList.villageList;
    final roleList = Provider.of<RoleProvider>(context, listen: false);
    final roles = roleList.roleList;
    StateRastram newTemp; */
    final stateRastarmProvider = Provider.of<StatesProvider>(context);
    final _userProvider = Provider.of<UserProvider>(context);
    String stateName = "";
    if(null != _userProvider && null != _userProvider.findById(1)
                             && null != _userProvider.findById(1).address
                             && null != _userProvider.findById(1).address.getStateRastram) {
      stateName = _userProvider.findById(1).address.getStateRastram.stateName;
    }
    
    return Scaffold(
       /*appBar: AppBar(
         title: Text('Complaints Form')
       ),*/
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
              
              //Populate DropDowns.
             // RegionDropDowns(),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
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

              Center(
                heightFactor: 5,
                child: _image == null ? Text(
                  'Photo Attachment',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ) : Image.file(_image),
              ),
              Padding (
              padding: EdgeInsets.only(top:10),
              child: new  FloatingActionButton(
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              )
              ),
  /*            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),

                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                            ? Text('Enter a URL')
                            : FittedBox(
                                child: Image.network(
                                  _imageUrlController.text,
                                  fit: BoxFit.cover,
                                ),
                              ),
                  ),
                  Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter an image URL.';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Please enter a valid URL.';
                          }
                          if (!value.endsWith('.png') &&
                              !value.endsWith('.jpg') &&
                              !value.endsWith('.jpeg')) {
                            return 'Please enter a valid image URL.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // _editedProduct = Product(
                          //   title: _editedProduct.title,
                          //   price: _editedProduct.price,
                          //   description: _editedProduct.description,
                          //   imageUrl: value,
                          //   id: _editedProduct.id,
                          //   isFavorite: _editedProduct.isFavorite,
                          // );
                        },
                      ),
                    ),
                
                    
                ],
              ),
*/
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

 /* Widget _districtsDropDown () {
    print("inside district method");
    //return _stateRastram != null ? FormField(
                      //builder: (FormFieldState state) {
                        return _stateRastram != null ? SingleChildScrollView(
                          child: Container(
                          // decoration: InputDecoration(
                          //   icon: const Icon(Icons.color_lens),
                          //   labelText: 'State',
                          // ),
                          // child : InputDecorator(
                          //   isEmpty: _district == null,
                             child:
                            new DropdownButtonHideUnderline(
                              
                            child: DropdownButton<District> (
                              hint: new Text("Select District"),
                            //  items: districtList.findDistrictsByStateId(newTemp.stateId).map((District value) {
                              
                                items: districts.length != 0 ? districts.map((District value) {
                                 return new DropdownMenuItem(
                                   value: value,
                                   child: new Text(value.districtName),
                                 );
                               }).toList() : [],
                              
                              

                              value: _district,
                              isDense: true,
                              onChanged: (District newValue) {
                                print("District dropdown, begin onchange..");
                                _district = newValue;
                                // setState(() =>                                   
                                //   _district = newValue
                                //  // state.didChange(newValue);
                                // );
                                setState(() => {                                   
                                  _district = newValue,
                                  print("District dropdown, setstate..")
                                //  state.didChange(newValue)
                                }
                                );
                                print("District dropdown, end onchange..");
                              },

                            ),
                          ),
                          ),
                        ):Container();
                      //}

                    //);
  }*/

}