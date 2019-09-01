import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

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

class Complaints extends StatefulWidget {
  
  
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  final _descriptionFocusNode = FocusNode();

  final _phoneFocusNode = FocusNode();

  final _imageUrlController = TextEditingController();

  final _imageUrlFocusNode = FocusNode();

  final _form = GlobalKey<FormState>();

  var _isInit = true;

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
        .showSnackBar(new SnackBar(content: new Text("Submitting Form..")));
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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Complaints Form')
      // ),

      body: Padding (
        padding: const EdgeInsets.all(16.0),
        child: Form (
          child: ListView (
            children: <Widget>[
              //Populate DropDowns.
              RegionDropDowns(),
              TextFormField (
                initialValue: _initValues['title'],
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter Your Last Name and FirstName',
                  labelText: 'Title'
                  ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  // _editedProduct = Product(
                  //     title: value,
                  //     price: _editedProduct.price,
                  //     description: _editedProduct.description,
                  //     imageUrl: _editedProduct.imageUrl,
                  //     id: _editedProduct.id,
                  //     isFavorite: _editedProduct.isFavorite);
                }
              ),

              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_phoneFocusNode);
                },
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

              TextFormField(
                  initialValue: _initValues['Phone'],
                  decoration: InputDecoration(labelText: 'Phone'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone number.';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number.';
                    }
                    if (double.parse(value) < 10) {
                      return 'Phone number should be 10 digits.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // _editedProduct = Product(
                    //     title: _editedProduct.title,
                    //     price: double.parse(value),
                    //     description: _editedProduct.description,
                    //     imageUrl: _editedProduct.imageUrl,
                    //     id: _editedProduct.id,
                    //     isFavorite: _editedProduct.isFavorite);
                  },
              ),
              Row(
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

              new Container(
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: new RaisedButton(
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