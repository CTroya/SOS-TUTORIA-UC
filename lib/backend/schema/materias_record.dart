import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MateriasRecord extends FirestoreRecord {
  MateriasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombreMateria" field.
  String? _nombreMateria;
  String get nombreMateria => _nombreMateria ?? '';
  bool hasNombreMateria() => _nombreMateria != null;

  // "carreras" field.
  DocumentReference? _carreras;
  DocumentReference? get carreras => _carreras;
  bool hasCarreras() => _carreras != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  void _initializeFields() {
    _nombreMateria = snapshotData['nombreMateria'] as String?;
    _carreras = snapshotData['carreras'] as DocumentReference?;
    _foto = snapshotData['foto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('materias');

  static Stream<MateriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MateriasRecord.fromSnapshot(s));

  static Future<MateriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MateriasRecord.fromSnapshot(s));

  static MateriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MateriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MateriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MateriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MateriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MateriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMateriasRecordData({
  String? nombreMateria,
  DocumentReference? carreras,
  String? foto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreMateria': nombreMateria,
      'carreras': carreras,
      'foto': foto,
    }.withoutNulls,
  );

  return firestoreData;
}

class MateriasRecordDocumentEquality implements Equality<MateriasRecord> {
  const MateriasRecordDocumentEquality();

  @override
  bool equals(MateriasRecord? e1, MateriasRecord? e2) {
    return e1?.nombreMateria == e2?.nombreMateria &&
        e1?.carreras == e2?.carreras &&
        e1?.foto == e2?.foto;
  }

  @override
  int hash(MateriasRecord? e) =>
      const ListEquality().hash([e?.nombreMateria, e?.carreras, e?.foto]);

  @override
  bool isValidKey(Object? o) => o is MateriasRecord;
}
