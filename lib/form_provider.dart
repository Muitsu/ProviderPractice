import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  List<UserProfile> listOfUser = [];
  //getter
  List<UserProfile>? get getListOfUser => listOfUser;
  //setter
  saveUser({required String name, required int age}) {
    listOfUser.add(UserProfile(name: name, age: age));
    notifyListeners();
  }

  deleteUser({required UserProfile value}) {
    int index = listOfUser.indexOf(value);
    listOfUser.removeAt(index);
    notifyListeners();
  }
}

class UserProfile {
  final String name;
  final int age;

  UserProfile({required this.name, required this.age});
}
