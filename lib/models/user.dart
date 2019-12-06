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
import '../models/role.dart';
import '../models/address.dart';

class User with ChangeNotifier {

  int userId;
  String firstName;
  String lastName;
  int phoneNumber;

  String email;
  String password;
  String bio;
  String city;
  Address address;
  bool isCurrentlyHosting;
  String imagePath;
  MemoryImage displayImage;
  Role role;

  User({
    this.userId, 
    this.firstName, 
    this.lastName, 
    this.phoneNumber, 
    this.email,
    this.bio,
    this.address,
    this.isCurrentlyHosting,
    this.imagePath,
    this.city,
    this.role
  });

  Address get getAddress => this.address;

  Role get getRole => this.role;

  int get getUserId => this.userId;

 /* super(firstName:firstName, lastName:lastName, phoneNumber: phoneNumber, imagePath: imagePath)  {
    this.isHost = false;
    this.isCurrentlyHosting;
  }*/
    
}
