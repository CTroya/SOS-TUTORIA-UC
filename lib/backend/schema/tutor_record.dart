import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TutorRecord extends FirestoreRecord {
  TutorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "materias" field.
  List<String>? _materias;
  List<String> get materias => _materias ?? const [];
  bool hasMaterias() => _materias != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  void _initializeFields() {
    _idUser = snapshotData['id_user'] as DocumentReference?;
    _materias = getDataList(snapshotData['materias']);
    _userName = snapshotData['user_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tutor');

  static Stream<TutorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TutorRecord.fromSnapshot(s));

  static Future<TutorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TutorRecord.fromSnapshot(s));

  static TutorRecord fromSnapshot(DocumentSnapshot snapshot) => TutorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TutorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TutorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TutorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TutorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTutorRecordData({
  DocumentReference? idUser,
  String? userName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_user': idUser,
      'user_name': userName,
    }.withoutNulls,
  );

  return firestoreData;
}

class TutorRecordDocumentEquality implements Equality<TutorRecord> {
  const TutorRecordDocumentEquality();

  @override
  bool equals(TutorRecord? e1, TutorRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idUser == e2?.idUser &&
        listEquality.equals(e1?.materias, e2?.materias) &&
        e1?.userName == e2?.userName;
  }

  @override
  int hash(TutorRecord? e) =>
      const ListEquality().hash([e?.idUser, e?.materias, e?.userName]);

  @override
  bool isValidKey(Object? o) => o is TutorRecord;
}
