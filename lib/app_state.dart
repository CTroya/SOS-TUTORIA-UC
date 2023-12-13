import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
      _notificacionAdmin1 = prefs
              .getStringList('ff_notificacionAdmin1')
              ?.map((path) => path.ref)
              .toList() ??
          _notificacionAdmin1;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _buscando = false;
  bool get buscando => _buscando;
  set buscando(bool _value) {
    _buscando = _value;
  }

  String _referenciaActividades = '';
  String get referenciaActividades => _referenciaActividades;
  set referenciaActividades(String _value) {
    _referenciaActividades = _value;
  }

  bool _ExisteActividad = false;
  bool get ExisteActividad => _ExisteActividad;
  set ExisteActividad(bool _value) {
    _ExisteActividad = _value;
  }

  String _profesorActual = '';
  String get profesorActual => _profesorActual;
  set profesorActual(String _value) {
    _profesorActual = _value;
  }

  String _ClaseActual = '';
  String get ClaseActual => _ClaseActual;
  set ClaseActual(String _value) {
    _ClaseActual = _value;
  }

  DocumentReference? _notificacionTodos;
  DocumentReference? get notificacionTodos => _notificacionTodos;
  set notificacionTodos(DocumentReference? _value) {
    _notificacionTodos = _value;
  }

  List<DocumentReference> _notificacionAdmin1 = [
    FirebaseFirestore.instance.doc('/users/z1bmL1vzTqRH3PxOhpgecVhWcps2')
  ];
  List<DocumentReference> get notificacionAdmin1 => _notificacionAdmin1;
  set notificacionAdmin1(List<DocumentReference> _value) {
    _notificacionAdmin1 = _value;
    prefs.setStringList(
        'ff_notificacionAdmin1', _value.map((x) => x.path).toList());
  }

  void addToNotificacionAdmin1(DocumentReference _value) {
    _notificacionAdmin1.add(_value);
    prefs.setStringList('ff_notificacionAdmin1',
        _notificacionAdmin1.map((x) => x.path).toList());
  }

  void removeFromNotificacionAdmin1(DocumentReference _value) {
    _notificacionAdmin1.remove(_value);
    prefs.setStringList('ff_notificacionAdmin1',
        _notificacionAdmin1.map((x) => x.path).toList());
  }

  void removeAtIndexFromNotificacionAdmin1(int _index) {
    _notificacionAdmin1.removeAt(_index);
    prefs.setStringList('ff_notificacionAdmin1',
        _notificacionAdmin1.map((x) => x.path).toList());
  }

  void updateNotificacionAdmin1AtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _notificacionAdmin1[_index] = updateFn(_notificacionAdmin1[_index]);
    prefs.setStringList('ff_notificacionAdmin1',
        _notificacionAdmin1.map((x) => x.path).toList());
  }

  void insertAtIndexInNotificacionAdmin1(int _index, DocumentReference _value) {
    _notificacionAdmin1.insert(_index, _value);
    prefs.setStringList('ff_notificacionAdmin1',
        _notificacionAdmin1.map((x) => x.path).toList());
  }

  int _HomeAlumnoTitle = 0;
  int get HomeAlumnoTitle => _HomeAlumnoTitle;
  set HomeAlumnoTitle(int _value) {
    _HomeAlumnoTitle = _value;
  }

  bool _viewAlumno = true;
  bool get viewAlumno => _viewAlumno;
  set viewAlumno(bool _value) {
    _viewAlumno = _value;
  }

  String _tutoriaparameter = 'CONFIRMADA';
  String get tutoriaparameter => _tutoriaparameter;
  set tutoriaparameter(String _value) {
    _tutoriaparameter = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
