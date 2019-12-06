import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/mandal.dart';
import 'package:flutter/services.dart';

import '../providers/states_provider.dart';
import '../providers/districts_provider.dart';
import '../providers/mandals_provider.dart';
import '../providers/users_provider.dart';

import '../providers/state.dart';
import '../models/district.dart';
import '../models/mandal.dart';

import '../widgets/districts_dropdown_widget.dart';
import '../widgets/mandals_dropdown_widget.dart';



class RegionDropDowns extends StatefulWidget {
  // List<Mandal> mandals = [];
  // RegionDropDowns(this.mandals);

  @override
  _RegionDropDownsState createState() => _RegionDropDownsState();
}

class _RegionDropDownsState extends State<RegionDropDowns> {

  StateRastram _stateRastram; // Value is reflecting only if declared here (class level) 
  District _district;
  List<District> districts = [];
  Mandal _mandal;
 
  @override
  Widget build(BuildContext context) {

/*When listen set to:
1) if stareRastram to false, mandal to true, when we navigate to another screen and come back all teh dropdowns are showing (no selected value)
2) if both ststeRastram and mandals set to true, then we see mandals is disappearing when we come back to the screen.
3) If both set to false, then we are not seeing mandals dropdown
  */
    final stateRastarmProvider = Provider.of<StatesProvider>(context);
    List<StateRastram> stateRastrams = stateRastarmProvider.stateRastramList;
    
    print('inside Drop Drown widget Begin..');
    
    final userProvider = Provider.of<UserProvider>(context);
    final _districtList = Provider.of<DistrictsProvider>(context);
    
    String stateRastramDropDownHintVal = "Select State";
    if(null != userProvider && null != userProvider.findById(1) 
                && null != userProvider.findById(1).getAddress
                && null != userProvider.findById(1).getAddress.getStateRastram) {
      stateRastramDropDownHintVal = userProvider.findById(1).getAddress.getStateRastram.stateName;
    }

    return Column (
      crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Consumer<StateRastram> ( // StateRastram
                    builder: (ctx, stateRastram, _) =>
                     FormField(
                      builder: (FormFieldState state) {

                        return SingleChildScrollView(
                          child: Container(
                          // decoration: InputDecoration(
                          //   icon: const Icon(Icons.color_lens),
                          //   labelText: 'State',
                          // ),
                          //*** Need to fix the size between 2 dropdowns
                          //padding: const EdgeInsets.all(), 
                          child:  new DropdownButtonHideUnderline(
                            child: DropdownButton<StateRastram> (
                              hint: new Text(stateRastramDropDownHintVal),
                              items: stateRastrams.length != 0 ? stateRastrams.map((StateRastram value) {
                                 return new DropdownMenuItem <StateRastram>(
                                   value: value,
                                   child: new Text(value.stateName),
                                 );
                               }).toList() : [],

                              value: _stateRastram,
                              //value: stateRastramVal,
                              isDense: true,
                              onChanged: (StateRastram newValue) {
                                //_stateRastram = newValue;
                                //stateRastarmProvider.setStateRastram(newValue);
                                if(null != userProvider && null != userProvider.findById(1) 
                                                        && null != userProvider.findById(1).getAddress) {
                                  userProvider.findById(1).getAddress.setStateRastram(newValue);
                                }
                                //isStateSelected = true; 
                                //newTemp = newValue;
                                
                                setState(() =>
                                  _stateRastram = newValue
                                );
                                  
                                districts = _districtList.findDistrictsByStateId(_stateRastram.stateId);
                                /*
                                Set district value to NUll before rendering distric value in Districts widget.
                                To fix the below Issue:
                                'package:flutter/src/material/dropdown.dart': Failed assertion: line 620 pos 15:
                                  'items == null || items.isEmpty || value == null || 
                                  items.where((DropdownMenuItem<T> item) => item.value == value).length == 1': is not true.
                                */
                                _districtList.setDistrict(null);
                                _districtList.setDistrictsForState(districts);
                                //_updateDistricts(districtList);
                                print("After saving districts...");
                                // state.d idChange(newValue);
                                
                              }

                            ),
                          ),
                        )
                        );
                      }

                    ),
                  ),
                  //_stateRastram != null ? DistrictsDropDown(): Container(),
                  Container(
                    padding: const EdgeInsets.only(left: 35),
                    child: DistrictsDropDown(),
                  ),

                 // _districtsDropDown(),
                  // Consumer<District> ( // Districts
                  //   builder: (ctx, district, _) => 

                //  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    
                  )
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Populate in a new row
                  
                   // Consumer<Mandal> ( // StateRastram
                  //    builder: (ctx3, mandal, _) =>
                    Container(
                      child: callMandalWidget(userProvider)
                        
                    /*  child:
                      (mandalProvider.mandalsForDistricts != null && mandalProvider.mandalsForDistricts.length != 0) 
                        ? MandalsDropDown(mandals: mandalProvider.mandalsForDistricts) :Container()*/
                    )
                 //   ),
                  /*Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only (
                      top: 8,
                      right:10,
                    ),
                  )*/
                ],
                
              ),
            ],
      
    );
  }

   Widget callMandalWidget(UserProvider userProvider) {
    final mandalsProvider = Provider.of<MandalsProvider>(context);
     if(null != userProvider && null != userProvider.findById(1) 
                                                           && null != userProvider.findById(1).getAddress) {
        return MandalsDropDown(mandals: mandalsProvider.mandalsForDistricts);                                                             
      } else {
        return (mandalsProvider.mandalsForDistricts != null && mandalsProvider.mandalsForDistricts.length != 0) 
                        ? MandalsDropDown(mandals: mandalsProvider.mandalsForDistricts) :Container();
      }
    }
     
    /*if(stateRastram != null) {
      MandalsDropDown(mandals: mandalProvider.mandalsForDistricts);
    } else {
      return Row(children: <Widget>[],);
      //return Container();
    }
  }*/
}