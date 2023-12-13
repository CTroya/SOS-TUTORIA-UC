import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewRecord extends FirestoreRecord {
  ReviewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Id_tutoria_detalle" field.
  DocumentReference? _idTutoriaDetalle;
  DocumentReference? get idTutoriaDetalle => _idTutoriaDetalle;
  bool hasIdTutoriaDetalle() => _idTutoriaDetalle != null;

  // "puntaje" field.
  double? _puntaje;
  double get puntaje => _puntaje ?? 0.0;
  bool hasPuntaje() => _puntaje != null;

  // "comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "comentario_list" field.
  List<String>? _comentarioList;
  List<String> get comentarioList => _comentarioList ?? const [];
  bool hasComentarioList() => _comentarioList != null;

  // "reviewer" field.
  DocumentReference? _reviewer;
  DocumentReference? get reviewer => _reviewer;
  bool hasReviewer() => _reviewer != null;

  // "reviewed" field.
  DocumentReference? _reviewed;
  DocumentReference? get reviewed => _reviewed;
  bool hasReviewed() => _reviewed != null;

  // "esTutor" field.
  bool? _esTutor;
  bool get esTutor => _esTutor ?? false;
  bool hasEsTutor() => _esTutor != null;

  void _initializeFields() {
    _idTutoriaDetalle =
        snapshotData['Id_tutoria_detalle'] as DocumentReference?;
    _puntaje = castToType<double>(snapshotData['puntaje']);
    _comentario = snapshotData['comentario'] as String?;
    _comentarioList = getDataList(snapshotData['comentario_list']);
    _reviewer = snapshotData['reviewer'] as DocumentReference?;
    _reviewed = snapshotData['reviewed'] as DocumentReference?;
    _esTutor = snapshotData['esTutor'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('review');

  static Stream<ReviewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewRecord.fromSnapshot(s));

  static Future<ReviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewRecord.fromSnapshot(s));

  static ReviewRecord fromSnapshot(DocumentSnapshot snapshot) => ReviewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewRecordData({
  DocumentReference? idTutoriaDetalle,
  double? puntaje,
  String? comentario,
  DocumentReference? reviewer,
  DocumentReference? reviewed,
  bool? esTutor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Id_tutoria_detalle': idTutoriaDetalle,
      'puntaje': puntaje,
      'comentario': comentario,
      'reviewer': reviewer,
      'reviewed': reviewed,
      'esTutor': esTutor,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewRecordDocumentEquality implements Equality<ReviewRecord> {
  const ReviewRecordDocumentEquality();

  @override
  bool equals(ReviewRecord? e1, ReviewRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idTutoriaDetalle == e2?.idTutoriaDetalle &&
        e1?.puntaje == e2?.puntaje &&
        e1?.comentario == e2?.comentario &&
        listEquality.equals(e1?.comentarioList, e2?.comentarioList) &&
        e1?.reviewer == e2?.reviewer &&
        e1?.reviewed == e2?.reviewed &&
        e1?.esTutor == e2?.esTutor;
  }

  @override
  int hash(ReviewRecord? e) => const ListEquality().hash([
        e?.idTutoriaDetalle,
        e?.puntaje,
        e?.comentario,
        e?.comentarioList,
        e?.reviewer,
        e?.reviewed,
        e?.esTutor
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewRecord;
}
