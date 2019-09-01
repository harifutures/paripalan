import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/mandal.dart';
import 'package:flutter/services.dart';

import '../providers/states_provider.dart';
import '../providers/districts_provider.dart';
import '../providers/mandals_provider.dart';

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
    final statesRastram = stateRastarmProvider.stateRastramList;
    
    final mandalProvider = Provider.of<MandalsProvider>(context);
    print('inside Drop Drown widget Begin..');

    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
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
                          child:  new DropdownButtonHideUnderline(
                            child: DropdownButton<StateRastram> (
                              hint: new Text("Select State"),
                              items: statesRastram.length != 0 ? statesRastram.map((StateRastram value) {
                                 return new DropdownMenuItem <StateRastram>(
                                   value: value,
                                   child: new Text(value.stateName),
                                 );
                               }).toList() : [],

                              value: _stateRastram,
                              isDense: true,
                              onChanged: (StateRastram newValue) {
                                _stateRastram = newValue;
                                //isStateSelected = true; 
                                //newTemp = newValue;
                                
                                
                                setState(() =>                                   //newContact.favoriteColor = newValue;
                                  _stateRastram = newValue
                                );

                                  final districtList = Provider.of<DistrictsProvider>(ctx);
                                  districts = districtList.findDistrictsByStateId(_stateRastram.stateId);
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
                  _stateRastram != null ? DistrictsDropDown(districts: districts,): Container(),

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
                  Consumer<Mandal> ( // StateRastram
                    builder: (ctx3, mandal, _) =>
                  
                  Container(
                     //child: callMandalWidget(_stateRastram, mandalProvider)
                     child:
                     (mandalProvider.mandalsForDistrcit != null && mandalProvider.mandalsForDistrcit.length != 0) 
                      ? MandalsDropDown(mandals: mandalProvider.mandalsForDistrcit) :Container()
                  )
                  ),
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

   Widget callMandalWidget(StateRastram stateRastram, MandalsProvider mandalProvider) {
    if(stateRastram != null) {
      MandalsDropDown(mandals: mandalProvider.mandalsForDistrcit);
    } else {
      return Row(children: <Widget>[],);
      //return Container();
    }
                    
  }
}