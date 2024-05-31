import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _weeklyvlaue = prefs.getDouble('ff_weeklyvlaue') ?? _weeklyvlaue;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  AudioStruct _vmA = AudioStruct.fromSerializableMap(jsonDecode('{}'));
  AudioStruct get vmA => _vmA;
  set vmA(AudioStruct value) {
    _vmA = value;
  }

  void updateVmAStruct(Function(AudioStruct) updateFn) {
    updateFn(_vmA);
  }

  bool _istrue = false;
  bool get istrue => _istrue;
  set istrue(bool value) {
    _istrue = value;
  }

  double _progressvalue = 0.0;
  double get progressvalue => _progressvalue;
  set progressvalue(double value) {
    _progressvalue = value;
  }

  double _weeklyvlaue = 0.0;
  double get weeklyvlaue => _weeklyvlaue;
  set weeklyvlaue(double value) {
    _weeklyvlaue = value;
    prefs.setDouble('ff_weeklyvlaue', value);
  }

  bool _usersearch = false;
  bool get usersearch => _usersearch;
  set usersearch(bool value) {
    _usersearch = value;
  }

  int _atomnumber = 0;
  int get atomnumber => _atomnumber;
  set atomnumber(int value) {
    _atomnumber = value;
  }

  double _atomicnumberDouble = 0.0;
  double get atomicnumberDouble => _atomicnumberDouble;
  set atomicnumberDouble(double value) {
    _atomicnumberDouble = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
