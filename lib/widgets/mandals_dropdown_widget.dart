import 'package:flutter/material.dart';
import 'package:paripalan/widgets/villages_dropdown_widget%20copy.dart';
import '../models/mandal.dart';
import '../models/village.dart';
import '../providers/mandals_provider.dart';
import 'package:paripalan/models/village.dart';
import '../providers/villages_provider.dart';
import 'package:provider/provider.dart';


class MandalsDropDown extends StatefulWidget {
    List<Mandal> mandals = [];
    MandalsDropDown({Key key, this.mandals}) : super(key: key);

    @override
    _MandalsDropDownState createState() => _MandalsDropDownState();
}


class _MandalsDropDownState extends State<MandalsDropDown> {

  Mandal _mandal;
  List<Mandal> mandals = [];
  List<Village> villages = [];
  
  @override
  Widget build(BuildContext context) {
    print("inside Mandals widget..");
    final mandalsList = Provider.of<MandalsProvider>(context);
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
                        hint: new Text("Select Mandal"),
                        items: (mandalsList.mandalsForDistricts != null && mandalsList.mandalsForDistricts.length != 0) 
                        ? mandalsList.mandalsForDistricts.map((Mandal value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: new Text(value.mandalName),
                            );
                          }).toList() : Container(),
                        value: mandalsList.getMandal,
                        isDense: true,
                        onChanged: (Mandal newValue) {
                          mandalsList.setMandal(newValue);
                          setState(() =>          
                            _mandal = newValue
                          );

                          final villagesList = Provider.of<VillagesProvider>(context);
                          villages = villagesList.findVillagesByMandalId(_mandal.mandalId);
                          villagesList.setVillagesForMandal(villages);
                          villagesList.setVillage(null); // This set village value to null on load
                          
                        }

                      ),
                    ),
                  )
              ),
              VillagesDropDown(),
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
