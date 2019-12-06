// Suggestions list widget displayed in the search page.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/users_provider.dart';
import '../models/user.dart';

class PhoneNumberSuggestions extends StatelessWidget {
  const PhoneNumberSuggestions({this.query, this.onSelected});
  final String query;
  final ValueChanged<User> onSelected;

  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    User phoneSuggestion = _userProvider.findUsersByPhone(query);
    final textTheme = Theme.of(context).textTheme.subhead;
    return Column (
      children: <Widget>[
        ListTile(
          title: RichText(
            text: TextSpan(
              text: phoneSuggestion.phoneNumber.toString().substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: phoneSuggestion.phoneNumber.toString().substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(phoneSuggestion);
           // Navigator.pop(context, phoneSuggestion.phoneNumber.toString());
          //  Navigator.pop(context);
          },
        ),
      ]);
      
  }
}