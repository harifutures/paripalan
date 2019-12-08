import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/villages_dropdown_widget.dart';
import '../models/mandal.dart';
import '../models/village.dart';
import '../providers/mandals_provider.dart';
import 'package:paripalan/models/village.dart';
import '../providers/villages_provider.dart';
import '../providers/users_provider.dart';



class MandalsDropDown extends StatefulWidget {
    List<Mandal> mandals = [];
    MandalsDropDown({Key key, this.mandals}) : super(key: key);

    @override
    _MandalsDropDownState createState() => _MandalsDropDownState();
}


class _MandalsDropDownState extends State<MandalsDropDown> {

  Mandal _mandal;
  List<Mandal> mandals = [];
  
  @override
  Widget build(BuildContext context) {
    print("inside Mandals widget..");
    final mandalsList = Provider.of<MandalsProvider>(context);
    final _userProvider = Provider.of<UserProvider>(context);
    String  mandalDropDownHintVal = "Select Mandal";
    if(null != _userProvider && null != _userProvider.findById(1) 
                && null != _userProvider.findById(1).getAddress
                && null != _userProvider.findById(1).getAddress.getDistrict) {
      mandals = mandalsList.findMandalsByDistrictId(_userProvider.findById(1).getAddress.getDistrict.districtId);
      mandalDropDownHintVal = _userProvider.findById(1).getAddress.getMandal.mandalName;
    } else { // When user login for the first time, there will not be any user's information (TODO: revisit/modify this logic after login screen implementation done).
      mandals = mandalsList.mandalsForDistricts;
    }

    return Row (
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SingleChildScrollView (
                child: Container (
            //  Consumer<Mandal> ( // Mandals
            //    builder: (ctx2, mandal, _) => 
            // FormField(
            //       builder: (FormFieldState state) {
            //         return Container(
                    child:  new DropdownButtonHideUnderline(
                      child: DropdownButton<Mandal> (
                        hint: new Text(mandalDropDownHintVal),
                        items: (mandals != null && mandals.length != 0) 
                        ? mandals.map((Mandal value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: new Text(value.mandalName),
                            );
                          }).toList() : Container(),
                        value: mandalsList.getMandal,
                        isDense: true,
                        onChanged: (Mandal newValue) {
                          mandalsList.setMandal(newValue);
                          setState(() => {       
                            if(null != _userProvider && null != _userProvider.findById(1)
                                                && null != _userProvider.findById(1).getAddress) {
                              _userProvider.findById(1).getAddress.setMandal(newValue),
                            },
                            _mandal = newValue
                          });
                          final villagesList = Provider.of<VillagesProvider>(context);
                          List<Village> _villages = villagesList.findVillagesByMandalId(_mandal.mandalId);
                          villagesList.setVillagesForMandal(_villages);
                          villagesList.setVillage(null); // This set village value to null on load
                          
                        }

                      ),
                    ),
                  )
              ),
              Container(
                padding: const EdgeInsets.only(left: 35),
                child: VillagesDropDown(),  // Need to add validation to hide if mandals not selected.
              ),
            ],
    );

                //  ),
             /*     Consumer<Village> ( // Villages
                    builder: (ctx3, village, _) => FormField(
                      builder: (FormFieldState state) {
                        return Container(
                          // decoration: InputDecoration(
                          //   icon: const Icon(Icons.color_lens),
                          //   labelText: 'State',
                          // ),
                          child:  new DropdownButtonHideUnderline(
                            child: DropdownButton<Village> (
                              hint: new Text("Select Village"),
                              items: villages.map((Village value) {
                                 return new DropdownMenuItem(
                                   value: value,
                                   child: new Text(value.villageName),
                                 );
                               }).toList(),

                              value: _village,
                              isDense: true,
                              onChanged: (Village newValue) {
                                _village = newValue;
                                setState(() =>                                   //newContact.favoriteColor = newValue;
                                  _village = newValue
                                 // state.didChange(newValue);
                                );
                              }

                            ),
                          ),
                        );
                      }

                    ),

                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    
                  )
                ]
             // )

                          ),
                        //  ),
                 //         ),
    ); */
  }

}
