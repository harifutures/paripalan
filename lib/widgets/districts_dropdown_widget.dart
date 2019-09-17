import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dropdowns_widget.dart';

import '../models/district.dart';
import '../models/mandal.dart';
import '../providers/mandals_provider.dart';
import '../providers/districts_provider.dart';
import 'mandals_dropdown_widget.dart';



class DistrictsDropDown extends StatefulWidget {
    // List<District> districts = [];
   // District district;
    //DistrictsDropDown({this.district});

    @override
    _DistrictDropDownState createState() => _DistrictDropDownState();
}


class _DistrictDropDownState extends State<DistrictsDropDown> {

  District _district;
  List<Mandal> mandals;
  

  bool isListEmpty(List<District> list) {
    if (null == list || list.length == 0) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final districtList = Provider.of<DistrictsProvider>(context);
    print("inside districts widget..");

    return 
                          Container(
                          // decoration: InputDecoration(
                          //   icon: const Icon(Icons.color_lens),
                          //   labelText: 'State',
                          // ),
                           //child : InputDecorator(
                             //isEmpty: _district == '',
                            child:  SingleChildScrollView(
                            child: 
                        //    Consumer<District> ( // Districts
                          //    builder: (context, districtModel, child) =>
                                new DropdownButtonHideUnderline(
                                  child: DropdownButton<District> (
                                    hint: new Text("Select District"),
                                  //  items: districtList.findDistrictsByStateId(newTemp.stateId).map((District value) {
                                    
                                      /*items: (districtList.districtsForState != null && districtList.districtsForState.length != 0) 
                                      ? districtList.districtsForState.map((District value) {*/
                                      items: (districtList.districtsForState != null && districtList.districtsForState.length != 0) 
                                      ? districtList.districtsForState.map((District value) {
                                      return new DropdownMenuItem<District>(
                                        value: value,
                                        child: new Text(value.districtName),
                                      );
                                    }).toList() : [],
                                    
                                    //value: widget.district,
                                    value: districtList.getDistrict,
                                  //  isDense: true,
                                    onChanged: (District newValue) {
                                      print("District dropdown, begin onchange..");
                                      //_distri   ct = newValue;
                                      // setState(() =>                                   
                                      //   _district = newValue
                                      //  // state.didChange(newValue);
                                      // );
                                        setState(() => {                                   
                                          //widget.district = newValue,
                                          //_district = newValue,
                                          districtList.setDistrict(newValue),
                                          _district = newValue,
                                          print("District dropdown, setstate..")
                                          }
                                        );
                                        final mandalsList = Provider.of<MandalsProvider>(context);
                                        mandals = mandalsList.findMandalsByDistrictId(_district.districtId);
                                        mandalsList.setMandlasForDistrict(mandals);
                                        mandalsList.setMandal(null); // This set mandal value to null on load.
                                        // if(_district != null) {
                                        //    RegionDropDowns(mandals); 
                                        // }
                                      print("District dropdown, end onchange..");
                                    },

                                  ),
                              ),
                            ),
                          //),
                          
                 //         ),
                        );
                        
  }

}
