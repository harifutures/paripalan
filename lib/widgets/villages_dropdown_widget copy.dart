import 'package:flutter/material.dart';
import '../models/district.dart';


class DistrictsDropDown extends StatefulWidget {
    List<District> districts = [];
    DistrictsDropDown({Key key, this.districts}) : super(key: key);

    @override
    _DistrictDropDownState createState() => _DistrictDropDownState();
}


class _DistrictDropDownState extends State<DistrictsDropDown> {

  District _district;
  

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
                            // child: 
                           // new DropdownButtonHideUnderline(
                              
                            child: DropdownButton<District> (
                              hint: new Text("Select District"),
                            //  items: districtList.findDistrictsByStateId(newTemp.stateId).map((District value) {
                              
                                items: widget.districts != null ? widget.districts.map((District value) {
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
                                //  state.didChange(newValue)
                                }
                                );
                                print("District dropdown, end onchange..");
                              },

                            ),
                          ),
                        //  ),
                 //         ),
                        );
  }

}
