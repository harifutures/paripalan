import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/role.dart';
import '../models/user.dart';
import '../models/roleLane.dart';
import '../providers/role_provider.dart';
import '../providers/users_provider.dart';
import '../providers/roleLane_provider.dart';
import '../widgets/inhertited_changeRole_stream_widget.dart';

class ChangeRoleForm extends StatefulWidget {
  @override
  _ChangeRoleFormState createState() {
    return new _ChangeRoleFormState();
  }
}

enum DivisionEnum {
    State,
    District,
    Mandal,
    Village
}

class _ChangeRoleFormState extends State<ChangeRoleForm> {
  
  List<Role> rolesByDivisionList;
  Role _roleToApply;
  List<User> superUsers;
  User changeRoleUser;
  static final String STATE_RADIO_NAME = "State";
  static final String DISTRICT_RADIO_NAME = "District";
  static final String MANDAL_RADIO_NAME = "Mandal";
  static final String VILLAGE_RADIO_NAME = "Village";
  
  var _radioValue = VILLAGE_RADIO_NAME;

  @override
  void initState() {
    setState(() {
      _radioValue = VILLAGE_RADIO_NAME;
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    changeRoleUser = InheritedChangeRole.of(context).changeUserRoledata;
  
   return //buildRadioButton();
     Container (
       margin: EdgeInsets.all(3.0),
       constraints: BoxConstraints(maxWidth: 350.0, maxHeight: 195.0),
       padding: EdgeInsets.all(5.0),
       decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            shape: BoxShape.rectangle
          ),
      //width: double.infinity,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child:buildRadioButton(STATE_RADIO_NAME,DISTRICT_RADIO_NAME)
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child:buildRadioButton(MANDAL_RADIO_NAME, VILLAGE_RADIO_NAME),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            //padding: const EdgeInsets.only(left: 0.0),
            child:populateRoles(_radioValue),
          ),
        ],
      )); 

   /* child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
          padding: const EdgeInsets.all(25.0),
          child:buildRadioButton(),
          )
        ],
      )*/

      
    //);
         
        
  }

_saveForm() {

}
Widget populateRoles(String radioValue) {
  
  /*
  In case if we default to Village/any divison, then we need to make a call explicitlty to pull roles per divison.
  _handleRadioValueChange() make a call to pull roles per division.
  */
  if(null == rolesByDivisionList) { 
    _handleRadioValueChange(radioValue); 
  }
  if(null != rolesByDivisionList) {
    return Row(
             children:<Widget>[
                        Container(
                           decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey),
                              shape: BoxShape.rectangle
                            ),
                          //*** Need to fix the size between 2 dropdowns
                          //padding: const EdgeInsets.all(), 
                          child:  new DropdownButtonHideUnderline(
                            child: DropdownButton<Role> (
                              hint: new Text("Select Role To Apply.."),
                              items: rolesByDivisionList.length != 0 ? rolesByDivisionList.map((Role value) {
                                 return new DropdownMenuItem <Role>(
                                   value: value,
                                   child: new Text(value.roleName),
                                 );
                               }).toList() : [],

                              value: _roleToApply,
                              //value: stateRastramVal,
                              isDense: true,
                              onChanged: (Role newValue) {
                                //_stateRastram = newValue;
                                //stateRastarmProvider.setStateRastram(newValue);
                                /*if(null != userProvider && null != userProvider.findById(1) 
                                                        && null != userProvider.findById(1).getAddress) {
                                  userProvider.findById(1).getAddress.setStateRastram(newValue);
                                }*/
                                //isStateSelected = true; 
                                //newTemp = newValue;
                                
                                setState(() =>
                                  _roleToApply = newValue
                                );
                                  
                                  /*TODO: If the user is not super user, display only super users of that divisons
                                    Else if
                                      User is Super user and want to promote him self, then show the same verticle superUsers to approve.
                                  */
                               /*   RoleLaneProvider roleLaneProvider = RoleLaneProvider();
                                  RoleLane nextAvailableRoleLaneInDivision = roleLaneProvider.findNextRoleLaneByRoleLaneAndDivision(_roleToApply.roleLaneId, _roleToApply.divisionId);
                                  //RoleLane nextAvailableRoleLaneInDivision = Provider.of<RoleLaneProvider>(context).findNextRoleLaneByRoleLaneAndDivision(_roleToApply.roleLaneId, _roleToApply.divisionId);
                                  
                                  
                                  if(null != nextAvailableRoleLaneInDivision) { // Next roleLane exists in this division
                                    superUsers = Provider.of<UserProvider>(context).findAllUsersOfSameRoleLaneTemp(changeRoleUser, _roleToApply);
                                  } else {
                                    
                                  }*/
                                
                              }

                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),  
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blueGrey),
                            ),
                            color: null != _roleToApply ? Colors.blueGrey : Colors.grey,
                            splashColor: null != _roleToApply ? Colors.purple: Colors.grey,
                            child: Text('SUBMIT', style: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    color: null != _roleToApply ? Colors.white : Colors.black
                                    ),),
                            //focusColor: Colors.blue,
                            //highlightColor: Colors.purple,
                            //hoverColor: Colors.purpleAccent,
                            //color: Colors.purpleAccent,
                            onPressed: () => {
                              if(null != _roleToApply) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.blue[100],
                                  content: Text(
                                    'Requesting..',
                                    style: TextStyle(color: Colors.purpleAccent, fontSize: 15),
                                    ),
                                  /*
                                  //In case if want to add some action to SnackBar
                                  action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),*/
                                ),
                                ),

                              _saveForm(),
                              }
                        },
                      ),
                    ),

                        ]
                        );
                    //  } 
                    //);

        }
}

Widget buildRadioButton(String radioName1, String radioName2) {
  /*onChanged field is commented below to disable selection, 
  by default we keep village seleted for now */ 
  return Row (
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
      radioName1,
      style: TextStyle(fontSize: 16.0),
      ),
      Radio(
        value: radioName1,
        groupValue: _radioValue,
        onChanged: _handleRadioValueChange,
      ),
      Padding(
        padding: EdgeInsets.only(left: 30.0),
        child: Text(
         radioName2,
         style: TextStyle(fontSize: 16.0),
      ),
      ),
      
      Radio(
        value: radioName2,
        groupValue: _radioValue,
        onChanged: _handleRadioValueChange,
      ),
    ],);
}

  void _handleRadioValueChange(String value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case "State":
         print("case 0");
          break;
        case "District":
          print("case 1");
          break;
        case "Mandal":
          print("case 2");
          break;
        case "Village":
          print("case 3");
          callRolesPerDivision(1);
          break;
        default:
          print("Nothing selected");
          break;

      }
    });
  }

  callRolesPerDivision(int divisionId) {
    rolesByDivisionList = Provider.of<RoleProvider>(context).findRolesByDivisionId(divisionId);
  } 

}

