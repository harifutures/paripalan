import 'package:flutter/material.dart';
import './state.dart';

class StatesProvider with  ChangeNotifier {
  List<StateRastram> _stateRastramList = [
    StateRastram (
      stateId: 1,
      stateName: 'Andhra Pradesh',
      roleId: 1
    ),
    StateRastram (
      stateId: 2,
      stateName: 'Telangana',
      roleId: 1
    )
  ];

  List<StateRastram> get stateRastramList {
    return [..._stateRastramList];
  }

  StateRastram findById(int stateId) {
    return _stateRastramList.firstWhere((st) => st.stateId == stateId);
  }
}