import 'package:flutter/material.dart';
import 'package:paripalan/models/user.dart';

class InheritedSuperUsers extends InheritedWidget {
final List<User> superUsersData;
InheritedSuperUsers({
  Widget child,
  this.superUsersData,
}) : super(child: child);

List<User> getSuperUsers() {
  if(null != superUsersData) {
    return superUsersData;
  } else {
    return null;
  }
}
@override
bool updateShouldNotify(InheritedSuperUsers oldWidget) => superUsersData != oldWidget.superUsersData;
static InheritedSuperUsers of(BuildContext context) =>         context.inheritFromWidgetOfExactType(InheritedSuperUsers);
}