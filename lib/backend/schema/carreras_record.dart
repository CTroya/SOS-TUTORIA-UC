import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrerasRecord extends FirestoreRecord {
  CarrerasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "carrera_id" field.
  int? _carreraId;
  int get carreraId => _carreraId ?? 0;
  bool hasCarreraId() => _carreraId != null;

  // "nombre_carrera" field.
  String? _nombreCarrera;
  String get nombreCarrera => _nombreCarrera ?? '';
  bool hasNombreCarrera() => _nombreCarrera != null;

  void _initializeFields() {
    _carreraId = castToType<int>(snapshotData['carrera_id']);
    _nombreCarrera = snapshotData['nombre_carrera'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carreras');

  static Stream<CarrerasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarrerasRecord.fromSnapshot(s));

  static Future<CarrerasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarrerasRecord.fromSnapshot(s));

  static CarrerasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarrerasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarrerasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarrerasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarrerasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarrerasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarrerasRecordData({
  int? carreraId,
  String? nombreCarrera,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'carrera_id': carreraId,
      'nombre_carrera': nombreCarrera,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarrerasRecordDocumentEquality implements Equality<CarrerasRecord> {
  const CarrerasRecordDocumentEquality();

  @override
  bool equals(CarrerasRecord? e1, CarrerasRecord? e2) {
    return e1?.carreraId == e2?.carreraId &&
        e1?.nombreCarrera == e2?.nombreCarrera;
  }

  @override
  int hash(CarrerasRecord? e) =>
      const ListEquality().hash([e?.carreraId, e?.nombreCarrera]);

  @override
  bool isValidKey(Object? o) => o is CarrerasRecord;
}
