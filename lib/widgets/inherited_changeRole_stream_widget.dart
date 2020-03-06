import 'package:flutter/material.dart';
import 'package:paripalan/models/user.dart';

class InheritedChangeRole extends InheritedWidget {
final User changeUserRoledata;
InheritedChangeRole({
  Widget child,
  this.changeUserRoledata,
}) : super(child: child);
@override
bool updateShouldNotify(InheritedChangeRole oldWidget) => changeUserRoledata != oldWidget.changeUserRoledata;
//static InheritedChangeRole of(BuildContext context) =>         context.inheritFromWidgetOfExactType(InheritedChangeRole);
static InheritedChangeRole of(BuildContext context) =>         context.dependOnInheritedWidgetOfExactType<InheritedChangeRole>();
}