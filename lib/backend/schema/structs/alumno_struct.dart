// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlumnoStruct extends FFFirebaseStruct {
  AlumnoStruct({
    String? nombre,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;
  bool hasNombre() => _nombre != null;

  static AlumnoStruct fromMap(Map<String, dynamic> data) => AlumnoStruct(
        nombre: data['nombre'] as String?,
      );

  static AlumnoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AlumnoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
      }.withoutNulls;

  static AlumnoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlumnoStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AlumnoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlumnoStruct && nombre == other.nombre;
  }

  @override
  int get hashCode => const ListEquality().hash([nombre]);
}

AlumnoStruct createAlumnoStruct({
  String? nombre,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AlumnoStruct(
      nombre: nombre,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AlumnoStruct? updateAlumnoStruct(
  AlumnoStruct? alumno, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    alumno
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAlumnoStructData(
  Map<String, dynamic> firestoreData,
  AlumnoStruct? alumno,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (alumno == null) {
    return;
  }
  if (alumno.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && alumno.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final alumnoData = getAlumnoFirestoreData(alumno, forFieldValue);
  final nestedData = alumnoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = alumno.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAlumnoFirestoreData(
  AlumnoStruct? alumno, [
  bool forFieldValue = false,
]) {
  if (alumno == null) {
    return {};
  }
  final firestoreData = mapToFirestore(alumno.toMap());

  // Add any Firestore field values
  alumno.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAlumnoListFirestoreData(
  List<AlumnoStruct>? alumnos,
) =>
    alumnos?.map((e) => getAlumnoFirestoreData(e, true)).toList() ?? [];
