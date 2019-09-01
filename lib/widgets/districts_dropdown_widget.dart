import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dropdowns_widget.dart';

import '../models/district.dart';
import '../models/mandal.dart';
import '../providers/mandals_provider.dart';
import 'mandals_dropdown_widget.dart';



class DistrictsDropDown extends StatefulWidget {
    List<District> districts = [];
    DistrictsDropDown({Key key, this.districts}) : super(key: key);

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
    print("inside districts widget..");
    return SingleChildScrollView(
                          child: Container(
                          // decoration: InputDecoration(
                          //   icon: const Icon(Icons.color_lens),
                          //   labelText: 'State',
                          // ),
                           //child : InputDecorator(
                             //isEmpty: _district == '',
                             
                            child: 
                            Consumer<District> ( // StateRastram
                    builder: (ctx2, stateRastram, _) =>
                            new DropdownButtonHideUnderline(
                              
                            child: DropdownButton<District> (
                              hint: new Text("Select District"),
                            //  items: districtList.findDistrictsByStateId(newTemp.stateId).map((District value) {
                              
                                items: (widget.districts != null && widget.districts.length != 0) 
                                ? widget.districts.map((District value) {
                                 return new DropdownMenuItem<District>(
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
                                    }
                                  );
                                  final mandalsList = Provider.of<MandalsProvider>(context);
                                  mandals = mandalsList.findDistrictsByStateId(_district.districtId);
                                  mandalsList.setMandlasForDistrict(mandals);
                                  // if(_district != null) {
                                  //    RegionDropDowns(mandals); 
                                  // }
                                print("District dropdown, end onchange..");
                              },

                            ),
                          ),
                            ),
                          ),
                          
                 //         ),
                        );
                        
  }

}
