import 'dart:io';
/*import 'package:airbnb/Models/Conversations.dart';
import 'package:airbnb/Models/OnDeviceDatabaseFunctions.dart';
import 'package:airbnb/Models/Postings.dart';
import 'package:airbnb/Models/Reviews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';*/
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../providers/state.dart';
import './district.dart';
import './mandal.dart';
import './village.dart';

class Address with ChangeNotifier {

  int userId; 
  StateRastram stateRastram;
  District district;
  Mandal mandal;
  Village village;
  int zipCode;
  
  Address({
    this.userId,
    this.stateRastram, 
    this.district, 
    this.mandal, 
    this.village, 
    this.zipCode
  }); 

  StateRastram setStateRastram(StateRastram stateRastram) {
    this.stateRastram = stateRastram;
  }

  District setDistrict(District district) {
    this.district = district;
  }

  Mandal setMandal(Mandal mandal) {
    this.mandal = mandal;
  }

  Village setVillage(Village village) {
    this.village = village;
  }

  StateRastram get getStateRastram => this.stateRastram;

  District get getDistrict => this.district;

  Mandal get getMandal => this.mandal;

  Village get getVillage => this.village;

  
}

