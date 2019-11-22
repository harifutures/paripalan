import 'package:flutter/material.dart';

import '../models/Users.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {

User user = User(
      userId: 1,
      firstName: "Hari Prasad",
      lastName: "Bandaru",
      bio: "Working as sr engineer",
      email: "hariprasad@gmail.com",
      city: "Guntur",
      phoneNumber: 111-222-3333,
      isHost: true
    );
/*
  static List<User> _users = [
     User(
      userId: 1,
      firstName: "Hari Prasad",
      lastName: "Bandaru",
      bio: "Working as sr engineer",
      email: "hariprasad@gmail.com",
      city: "Guntur",
      phoneNumber: 111-222-3333,
      isHost: true
    ),

    User(
      userId: 2,
      firstName: "Siva Annapurna",
      lastName: "Bandaru",
      bio: "House maker",
      email: "sannapurna@gmail.com",
      city: "krishna",
      phoneNumber: 444-555-6666,
      isHost: false
    )
  ];

  List<User> get usersList {
    return [..._users];
  }

  User findById(int userId) {
    return _users.firstWhere((usr) => usr.userId == userId);
  }    
  
  void saveUserProfile(List<User> user) {
    _users.insert(
      0,
      User(
        userId: user.
      )
    );

  */

  User findById(int userId) {
    if(user.userId == userId) {
      return user;
    } else {
      return null;
    }
  }

  saveUserProfile(User user) {
    print("inside save:"+user.firstName);
    this.user = user;
    notifyListeners();
  }

}
