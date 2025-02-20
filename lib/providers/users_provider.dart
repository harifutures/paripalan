import 'package:flutter/material.dart';
import 'package:paripalan/models/role.dart';
import 'package:paripalan/providers/role_provider.dart';

import '../models/district.dart';
import '../models/mandal.dart';
import '../models/village.dart';
import '../providers/state.dart';

import '../models/user.dart';
import '../models/address.dart';

class UserProvider with ChangeNotifier {

RoleProvider roleProvider;
List<User> _superUsers;
static User user = User(
      userId: 1,
      firstName: "Hari Prasad",
      lastName: "Bandaru",
      address: new Address (
        userId: 1,
        stateRastram: new StateRastram(
          stateId: 1,
          stateName: "Andhra Pradesh",
        ),
        district: new District(
          districtId: 1,
          districtName: "Guntur"
        ),
        mandal: new Mandal(
          mandalId: 1,
          mandalName: "Mangalagiri"
        ),
        village: new Village(
          villageId: 1,
          villageName: "Kaza"
        ),
        zipCode: 522503
        ),
      bio: "Working as sr engineer",
      email: "hariprasad@gmail.com",
      city: "Guntur",
      phoneNumber: 1112223333,
      //role: roleProvider.fidnById(roleId)
    );

    static User superUser1 = User(
      userId: 2,
      firstName: "Basava Sankar",
      lastName: "Bandaru",
      address: new Address (
        userId: 2,
        stateRastram: new StateRastram(
          stateId: 1,
          stateName: "Andhra Pradesh",
        ),
        district: new District(
          districtId: 1,
          districtName: "Guntur"
        ),
        mandal: new Mandal(
          mandalId: 1,
          mandalName: "Mangalagiri"
        ),
        village: new Village(
          villageId: 1,
          villageName: "Kaza"
        ),
        zipCode: 522503
        ),
      bio: "Working as sr engineer",
      email: "hariprasad@gmail.com",
      city: "Guntur",
      phoneNumber: 1112223333,
      role: new Role(
        roleId: 5,
        roleName: "Surpanch",
        divisionId: 1,
        roleLayerId: 2,
        isSuperUser: true
      )
      //role: roleProvider.fidnById(roleId)
    );

    static User superUser2 = User(
      userId: 2,
      firstName: "Rama devi",
      lastName: "Bandaru",
      address: new Address (
        userId: 2,
        stateRastram: new StateRastram(
          stateId: 1,
          stateName: "Andhra Pradesh",
        ),
        district: new District(
          districtId: 1,
          districtName: "Guntur"
        ),
        mandal: new Mandal(
          mandalId: 1,
          mandalName: "Mangalagiri"
        ),
        village: new Village(
          villageId: 1,
          villageName: "Kaza"
        ),
        zipCode: 522503
        ),
      bio: "Working as sr engineer",
      email: "hariprasad@gmail.com",
      city: "Guntur",
      phoneNumber: 1112223333,
      role: new Role(
        roleId: 4,
        roleName: "VRO",
        divisionId: 1,
        roleLayerId: 2,
        isSuperUser: true
      )
      //role: roleProvider.fidnById(roleId)
    );

static User superUser3 = User(
    userId: 2,
    firstName: "Janardhana Rao",
    lastName: "Bandaru",
    address: new Address (
        userId: 2,
        stateRastram: new StateRastram(
          stateId: 1,
          stateName: "Andhra Pradesh",
        ),
        district: new District(
            districtId: 1,
            districtName: "Guntur"
        ),
        mandal: new Mandal(
            mandalId: 1,
            mandalName: "Mangalagiri"
        ),
        village: new Village(
            villageId: 1,
            villageName: "Kaza"
        ),
        zipCode: 522503
    ),
    bio: "Working as sr engineer",
    email: "hariprasad@gmail.com",
    city: "Guntur",
    phoneNumber: 1112223333,
    role: new Role(
        roleId: 6,
        roleName: "VRO",
        divisionId: 1,
        roleLayerId: 2,
        isSuperUser: true
    )
  //role: roleProvider.fidnById(roleId)
);

    static User voulanteerUser1 = User(
      userId: 2,
      firstName: "Suresh",
      lastName: "Bandaru",
      address: new Address (
        userId: 2,
        stateRastram: new StateRastram(
          stateId: 1,
          stateName: "Andhra Pradesh",
        ),
        district: new District(
          districtId: 1,
          districtName: "Guntur"
        ),
        mandal: new Mandal(
          mandalId: 1,
          mandalName: "Mangalagiri"
        ),
        village: new Village(
          villageId: 1,
          villageName: "Kaza"
        ),
        zipCode: 522503
        ),
      bio: "Working as sr engineer",
      email: "hariprasad@gmail.com",
      city: "Guntur",
      phoneNumber: 1112223333,
      role: new Role(
        roleId: 3,
        roleName: "Valunteer3",
        divisionId: 1,
        roleLayerId: 1,
        isSuperUser: false
      )
      //role: roleProvider.fidnById(roleId)
    );

     static User voulanteerUser2 = User(
      userId: 2,
      firstName: "Subba Rao",
      lastName: "Bandaru",
      address: new Address (
        userId: 2,
        stateRastram: new StateRastram(
          stateId: 1,
          stateName: "Andhra Pradesh",
        ),
        district: new District(
          districtId: 1,
          districtName: "Guntur"
        ),
        mandal: new Mandal(
          mandalId: 1,
          mandalName: "Mangalagiri"
        ),
        village: new Village(
          villageId: 1,
          villageName: "Kaza"
        ),
        zipCode: 522503
        ),
      bio: "Working as sr engineer",
      email: "hariprasad@gmail.com",
      city: "Guntur",
      phoneNumber: 1112223333,
      role: new Role(
        roleId: 1,
        roleName: "Valunteer1",
        divisionId: 1,
        roleLayerId: 1,
        isSuperUser: false
      )
      //role: roleProvider.fidnById(roleId)
    );

    static User user2 = User(
      userId: 1,
      firstName: "Satya",
      lastName: "Ponugoti",
      address: new Address (
        userId: 1,
        stateRastram: new StateRastram(
          stateId: 1,
          stateName: "Andhra Pradesh",
        ),
        district: new District(
          districtId: 2,
          districtName: "Krishna"
        ),
        mandal: new Mandal(
          mandalId: 2,
          mandalName: "Repalle"
        ),
        village: new Village(
          villageId: 3,
          villageName: "Bobbarlanka"
        ),
        zipCode: 522533
        ),
      bio: "Working as sr engineer",
      email: "satya@gmail.com",
      city: "Guntur",
      phoneNumber: 4445556666,
    );

    static User user3 = User(
      userId: 1,
      firstName: "Vamsi",
      lastName: "Kothaguntla",
      address: new Address (
        userId: 1,
        stateRastram: new StateRastram(
          stateId: 1,
          stateName: "Andhra Pradesh",
        ),
        district: new District(
          districtId: 2,
          districtName: "Krishna"
        ),
        mandal: new Mandal(
          mandalId: 2,
          mandalName: "Repalle"
        ),
        village: new Village(
          villageId: 3,
          villageName: "Bobbarlanka"
        ),
        zipCode: 522533
        ),
      bio: "Working as sr engineer",
      email: "satya@gmail.com",
      city: "Guntur",
      phoneNumber: 4445556666,
    );


Address address = Address (
  userId: 1,
  stateRastram: new StateRastram(
    stateId: 1
  ),
  district: new District(
    districtId: 1
  ),
  mandal: new Mandal(
    mandalId: 1
  ),
  village: new Village(
    villageId: 1
  ),
  zipCode: 522503
  );

  List<User> _users = [
    user,
    user2,
    user3,
    voulanteerUser1,
    voulanteerUser2,
    superUser1,
    superUser2,
    superUser3
  ];

  List<User> get usersList {
    return [..._users];
  }

  User findUsersById(int userId) {
    return _users.firstWhere((usr) => usr.userId == userId);
  }    

  User findUsersByPhone(String phoneNumber) {
    print("phoneNumber search:"+_users.firstWhere((usr) => usr.phoneNumber == int.parse(phoneNumber)).phoneNumber.toString());
    return _users.firstWhere((usr) => usr.phoneNumber == int.parse(phoneNumber));
  }   

  List<User> findMatchingPhones(String phoneNumber) {
    return _users.where((usr) => usr.phoneNumber == int.parse(phoneNumber));
  }   
  
  /*void saveUserProfile(List<User> user) {
    _users.insert(
      0,
      User(
        userId: 
      )
    );
  }*/


  User findById(int userId) {
    return _users.firstWhere((usr) => usr.userId == userId);
  }


  List<User> findAllUsersOfSameRoleLaneTemp(User changeRoleUser, int roleLayerId, Role requestingRole) {

    Address address = changeRoleUser.getAddress;
    int districtId;
    int mandalId;
    int villageId;

    if(null != address.getDistrict) {
        districtId = address.getDistrict.districtId;
    }
    if(null != address.getMandal) {
        mandalId = address.getMandal.mandalId;
    }
    if(null != address.getVillage) {
        villageId = address.getVillage.villageId;
    }

    /**
     * TODO: Convert  divisions to enum, instead of having constant hard coding values.
     */
    switch (requestingRole.divisionId) {

      case 1:
        return _users.where((user) =>
        null != user.role &&
        null != user.role.getRoleLayerId &&
        user.role.getRoleLayerId == roleLayerId &&
        user.getAddress.stateRastram.stateId == address.stateRastram.stateId &&
        user.getAddress.getDistrict.districtId == districtId &&
        user.getAddress.getMandal.mandalId == mandalId &&
        user.getAddress.getVillage.villageId == villageId        
        ).toList();
      case 2:
        return _users.where((user) => 
        null != user.role &&
        null != user.role.getRoleLayerId &&
        user.role.roleLayerId == roleLayerId &&
        user.getAddress.stateRastram.stateName == address.stateRastram.stateName &&
        user.getAddress.getDistrict.districtId == districtId &&
        user.getAddress.getMandal.mandalId == mandalId
        ).toList();
      case 3:
        return _users.where((user) => 
        null != user.role &&
        null != user.role.getRoleLayerId &&
        user.role.roleLayerId == roleLayerId &&
        user.getAddress.stateRastram.stateName == address.stateRastram.stateName &&
        user.getAddress.getDistrict.districtId == districtId
        ).toList();
      case 4:
        return _users.where((user) => 
        null != user.role &&
        null != user.role.getRoleLayerId &&
        user.role.roleLayerId == roleLayerId &&
        user.getAddress.stateRastram.stateName == address.stateRastram.stateName
        ).toList();  

    }
    
  }

  setSuperUsers(List<User> superUsers) {
    print("set seuperusers"+superUsers.length.toString());
    this._superUsers = superUsers;
  }

  List<User> get getSuperUsers => this._superUsers;

  saveUserProfile(User usertoSave) {
    print("inside save:Before Save: State Name:"+user.address.getStateRastram.stateName);
    print("inside save:Before Save: District Name:"+user.address.getDistrict.districtName);
    user = usertoSave;
    notifyListeners();
  }


}
