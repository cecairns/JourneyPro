import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _Firstday = '';
  String get Firstday => _Firstday;
  set Firstday(String value) {
    _Firstday = value;
  }

  String _EndDay = '';
  String get EndDay => _EndDay;
  set EndDay(String value) {
    _EndDay = value;
  }

  List<String> _listusers = [];
  List<String> get listusers => _listusers;
  set listusers(List<String> value) {
    _listusers = value;
  }

  void addToListusers(String value) {
    listusers.add(value);
  }

  void removeFromListusers(String value) {
    listusers.remove(value);
  }

  void removeAtIndexFromListusers(int index) {
    listusers.removeAt(index);
  }

  void updateListusersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listusers[index] = updateFn(_listusers[index]);
  }

  void insertAtIndexInListusers(int index, String value) {
    listusers.insert(index, value);
  }

  String _currency = '';
  String get currency => _currency;
  set currency(String value) {
    _currency = value;
  }

  double _cost = 0.0;
  double get cost => _cost;
  set cost(double value) {
    _cost = value;
  }

  List<String> _expenseUsers = [];
  List<String> get expenseUsers => _expenseUsers;
  set expenseUsers(List<String> value) {
    _expenseUsers = value;
  }

  void addToExpenseUsers(String value) {
    expenseUsers.add(value);
  }

  void removeFromExpenseUsers(String value) {
    expenseUsers.remove(value);
  }

  void removeAtIndexFromExpenseUsers(int index) {
    expenseUsers.removeAt(index);
  }

  void updateExpenseUsersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    expenseUsers[index] = updateFn(_expenseUsers[index]);
  }

  void insertAtIndexInExpenseUsers(int index, String value) {
    expenseUsers.insert(index, value);
  }

  String _defaultGeopoint = '';
  String get defaultGeopoint => _defaultGeopoint;
  set defaultGeopoint(String value) {
    _defaultGeopoint = value;
  }

  String _riTravelInfo = '';
  String get riTravelInfo => _riTravelInfo;
  set riTravelInfo(String value) {
    _riTravelInfo = value;
  }

  List<String> _Adduserstotrip = [];
  List<String> get Adduserstotrip => _Adduserstotrip;
  set Adduserstotrip(List<String> value) {
    _Adduserstotrip = value;
  }

  void addToAdduserstotrip(String value) {
    Adduserstotrip.add(value);
  }

  void removeFromAdduserstotrip(String value) {
    Adduserstotrip.remove(value);
  }

  void removeAtIndexFromAdduserstotrip(int index) {
    Adduserstotrip.removeAt(index);
  }

  void updateAdduserstotripAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Adduserstotrip[index] = updateFn(_Adduserstotrip[index]);
  }

  void insertAtIndexInAdduserstotrip(int index, String value) {
    Adduserstotrip.insert(index, value);
  }

  String _AddUsers = '';
  String get AddUsers => _AddUsers;
  set AddUsers(String value) {
    _AddUsers = value;
  }

  String _TripDate = '';
  String get TripDate => _TripDate;
  set TripDate(String value) {
    _TripDate = value;
  }

  int _npsCount = 0;
  int get npsCount => _npsCount;
  set npsCount(int value) {
    _npsCount = value;
  }
}
