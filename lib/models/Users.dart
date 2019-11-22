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
import '../models/user.dart';

class Contact with ChangeNotifier {

  String id;
  String firstName;
  String lastName;
  String fullName;
  String city;
  String imagePath;
  int phoneNumber;
  bool isHost;
  MemoryImage displayImage;


  Contact({this.id, this.firstName, this.lastName, this.fullName, 
           this.phoneNumber, this.imagePath, this.displayImage}) {
    this.imagePath = imagePath;

    if (fullName.isEmpty) { return; }
    List<String> names = fullName.split(" ");
    this.firstName = names[0];
    this.lastName = names[1];
  }

  
  User createUserFromContact() {
    User user = User();
    //user.id = this.id;
    user.firstName = this.firstName;
    user.lastName = this.lastName;
  //  user.fullName = this.fullName;
    user.imagePath = this.imagePath;
    user.displayImage = this.displayImage;
    user.city = this.city;
    user.isHost = this.isHost;
    return user;
  }

}

