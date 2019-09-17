import 'package:flutter/material.dart';
import 'package:paripalan/models/village.dart';
import '../providers/villages_provider.dart';
import '../models/district.dart';
import 'package:provider/provider.dart';


class VillagesDropDown extends StatefulWidget {
    
    @override
    _VillagesDropDownState createState() => _VillagesDropDownState();
}


class _VillagesDropDownState extends State<VillagesDropDown> {

  Village _village;
  

  bool isListEmpty(List<District> list) {
    if (null == list || list.length == 0) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    print("inside Villages widget..");
    final villagesList = Provider.of<VillagesProvider>(context);
    return SingleChildScrollView(
                          child: Container(
                          // decoration: InputDecoration(
                          //   icon: const Icon(Icons.color_lens),
                          //   labelText: 'State',
                          // ),
                           //child : InputDecorator(
                             //isEmpty: _district == '',
                            // child: 
                           // new DropdownButtonHideUnderline(
                              
                            child: DropdownButton<Village> (
                              hint: new Text("Select Village"),
                            //  items: districtList.findDistrictsByStateId(newTemp.stateId).map((District value) {
                              
                                items: villagesList.villagesForMandal != null ? villagesList.villagesForMandal.map((Village value) {
                                 return new DropdownMenuItem<Village>(
                                   value: value,
                                   child: new Text(value.villageName),
                                 );
                               }).toList() : [],
                              
                              value: villagesList.getVillage,
                              isDense: true,
                              onChanged: (Village newValue) {
                                print("Village dropdown, begin onchange..");
                                villagesList.setVillage(newValue);
                                _village = newValue;
                                // setState(() =>                                   
                                //   _district = newValue
                                //  // state.didChange(newValue);
                                // );
                                setState(() => {                                   
                                  _village = newValue,
                                  print("Village dropdown, setstate..")
                                //  state.didChange(newValue)
                                }
                                );
                                print("Village dropdown, end onchange..");
                              },

                            ),
                          ),
                        //  ),
                 //         ),
                        );
  }

}
