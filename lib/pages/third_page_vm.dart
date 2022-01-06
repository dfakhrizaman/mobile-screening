import 'package:flutter/material.dart';
import 'package:suitmedia_test/services/webservice.dart';

class ThirdPageViewModel with ChangeNotifier {
  List _userList = [];
  bool _isAllLoaded = false;

  bool get isAllLoaded => _isAllLoaded;

  List get userList => _userList;

  int get getLength => _userList.length;

  void setAllLoaded() {
    _isAllLoaded = true;
  }

  String getEmail(int index) {
    return _userList[index].email;
  }

  String getFirstName(int index) {
    return _userList[index].firstName;
  }

  String getLastName(int index) {
    return _userList[index].lastName;
  }

  String getFullName(int index) {
    return '${getFirstName(index)} ${getLastName(index)}';
  }

  String getAvatarUrl(int index) {
    return _userList[index].avatarUrl;
  }

  void populateList() async {
    _userList = await WebService().getUserList();
    notifyListeners();
  }

  void appendList() async {
    List temp = await WebService().getPage2();

    _userList.addAll(temp);

    _isAllLoaded = true;
    notifyListeners();
  }
}
