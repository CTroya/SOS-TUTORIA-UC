import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlumnoRecord extends FirestoreRecord {
  AlumnoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "carrera" field.
  DocumentReference? _carrera;
  DocumentReference? get carrera => _carrera;
  bool hasCarrera() => _carrera != null;

  // "carreraId" field.
  String? _carreraId;
  String get carreraId => _carreraId ?? '';
  bool hasCarreraId() => _carreraId != null;

  void _initializeFields() {
    _idUser = snapshotData['id_user'] as DocumentReference?;
    _rating = castToType<double>(snapshotData['rating']);
    _carrera = snapshotData['carrera'] as DocumentReference?;
    _carreraId = snapshotData['carreraId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alumno');

  static Stream<AlumnoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlumnoRecord.fromSnapshot(s));

  static Future<AlumnoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlumnoRecord.fromSnapshot(s));

  static AlumnoRecord fromSnapshot(DocumentSnapshot snapshot) => AlumnoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlumnoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlumnoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlumnoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlumnoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlumnoRecordData({
  DocumentReference? idUser,
  double? rating,
  DocumentReference? carrera,
  String? carreraId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_user': idUser,
      'rating': rating,
      'carrera': carrera,
      'carreraId': carreraId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlumnoRecordDocumentEquality implements Equality<AlumnoRecord> {
  const AlumnoRecordDocumentEquality();

  @override
  bool equals(AlumnoRecord? e1, AlumnoRecord? e2) {
    return e1?.idUser == e2?.idUser &&
        e1?.rating == e2?.rating &&
        e1?.carrera == e2?.carrera &&
        e1?.carreraId == e2?.carreraId;
  }

  @override
  int hash(AlumnoRecord? e) => const ListEquality()
      .hash([e?.idUser, e?.rating, e?.carrera, e?.carreraId]);

  @override
  bool isValidKey(Object? o) => o is AlumnoRecord;
}
