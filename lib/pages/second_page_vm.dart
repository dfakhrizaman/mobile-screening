import 'package:flutter/material.dart';

class SecondPageViewModel with ChangeNotifier {
  String _selectedUser = '';

  String get selectedUser => _selectedUser;

  void updateSelectedUser(newValue) {
    if (newValue != '') {
      _selectedUser = newValue;
    }

    notifyListeners();
  }
}
