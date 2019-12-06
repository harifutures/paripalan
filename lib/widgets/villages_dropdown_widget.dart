import 'package:flutter/material.dart';
import 'package:paripalan/models/role.dart';
import 'package:provider/provider.dart';

import '../models/village.dart';
import '../models/district.dart';
import '../models/role.dart';
import '../providers/villages_provider.dart';
import '../providers/users_provider.dart';
import '../providers/role_provider.dart';

class VillagesDropDown extends StatefulWidget {
    
    @override
    _VillagesDropDownState createState() => _VillagesDropDownState();
}


class _VillagesDropDownState extends State<VillagesDropDown> {

  Village _village;
  List<Village> villages;
  

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
    final _userProvider = Provider.of<UserProvider>(context);
    String  villageDropDownHintVal = "Select Mandal";
    if(null != _userProvider && null != _userProvider.findById(1) 
                && null != _userProvider.findById(1).getAddress
                && null != _userProvider.findById(1).getAddress.getDistrict) {
      villages = villagesList.findVillagesByMandalId(_userProvider.findById(1).getAddress.getMandal.mandalId);
      villageDropDownHintVal = _userProvider.findById(1).getAddress.getVillage.villageName;
    } else { // When user login for the first time, there will not be any user's information.
      villages = villagesList.villagesForMandal;
    }
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
                              hint: new Text(villageDropDownHintVal),
                            //  items: districtList.findDistrictsByStateId(newTemp.stateId).map((District value) {
                              
                                items: villages != null ? villages.map((Village value) {
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
                                  if(null != _userProvider && null != _userProvider.findById(1)
                                                && null != _userProvider.findById(1).getAddress) {
                                    _userProvider.findById(1).getAddress.setVillage(newValue),
                                  },
                                  _village = newValue,
                                  print("Village dropdown, setstate..")
                                //  state.didChange(newValue)
                                }
                                );
                              /*  final rolesList = Provider.of<RoleProvider>(context);
                                List<Role> _villages = rolesList.find(_mandal.mandalId);
                                villagesList.setVillagesForMandal(_villages);
                                villagesList.setVillage(null);*/
                              },

                            ),
                          ),
                        //  ),
                 //         ),
                        );
  }

}
