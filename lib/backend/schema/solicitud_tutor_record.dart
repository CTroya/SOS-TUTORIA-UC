import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SolicitudTutorRecord extends FirestoreRecord {
  SolicitudTutorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "materia" field.
  String? _materia;
  String get materia => _materia ?? '';
  bool hasMateria() => _materia != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  void _initializeFields() {
    _materia = snapshotData['materia'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('solicitudTutor');

  static Stream<SolicitudTutorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SolicitudTutorRecord.fromSnapshot(s));

  static Future<SolicitudTutorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SolicitudTutorRecord.fromSnapshot(s));

  static SolicitudTutorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SolicitudTutorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SolicitudTutorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SolicitudTutorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SolicitudTutorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SolicitudTutorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSolicitudTutorRecordData({
  String? materia,
  String? descripcion,
  DocumentReference? idUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'materia': materia,
      'descripcion': descripcion,
      'id_user': idUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class SolicitudTutorRecordDocumentEquality
    implements Equality<SolicitudTutorRecord> {
  const SolicitudTutorRecordDocumentEquality();

  @override
  bool equals(SolicitudTutorRecord? e1, SolicitudTutorRecord? e2) {
    return e1?.materia == e2?.materia &&
        e1?.descripcion == e2?.descripcion &&
        e1?.idUser == e2?.idUser;
  }

  @override
  int hash(SolicitudTutorRecord? e) =>
      const ListEquality().hash([e?.materia, e?.descripcion, e?.idUser]);

  @override
  bool isValidKey(Object? o) => o is SolicitudTutorRecord;
}
