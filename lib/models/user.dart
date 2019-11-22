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
import '../models/Users.dart';

class User with ChangeNotifier {

  int userId;
  String firstName;
  String lastName;
  int phoneNumber;

  String email;
  String password;
  String bio;
  String city;
  String location;
  bool isHost;
  bool isCurrentlyHosting;
  String imagePath;
  MemoryImage displayImage;

  User({
    this.userId, 
    this.firstName, 
    this.lastName, 
    this.phoneNumber, 
    this.email,
    this.bio,
    this.location,
    this.isCurrentlyHosting,
    this.imagePath,
    this.city,
    this.isHost 
  });


 /* super(firstName:firstName, lastName:lastName, phoneNumber: phoneNumber, imagePath: imagePath)  {
    this.isHost = false;
    this.isCurrentlyHosting;
  }*/
    
}
