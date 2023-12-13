import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TutoriasDetalleRecord extends FirestoreRecord {
  TutoriasDetalleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "pathfile" field.
  String? _pathfile;
  String get pathfile => _pathfile ?? '';
  bool hasPathfile() => _pathfile != null;

  // "id_tutor" field.
  DocumentReference? _idTutor;
  DocumentReference? get idTutor => _idTutor;
  bool hasIdTutor() => _idTutor != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _estado = snapshotData['estado'] as String?;
    _color = getSchemaColor(snapshotData['color']);
    _pathfile = snapshotData['pathfile'] as String?;
    _idTutor = snapshotData['id_tutor'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tutorias_detalle')
          : FirebaseFirestore.instance.collectionGroup('tutorias_detalle');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tutorias_detalle').doc();

  static Stream<TutoriasDetalleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TutoriasDetalleRecord.fromSnapshot(s));

  static Future<TutoriasDetalleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TutoriasDetalleRecord.fromSnapshot(s));

  static TutoriasDetalleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TutoriasDetalleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TutoriasDetalleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TutoriasDetalleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TutoriasDetalleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TutoriasDetalleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTutoriasDetalleRecordData({
  String? estado,
  Color? color,
  String? pathfile,
  DocumentReference? idTutor,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'estado': estado,
      'color': color,
      'pathfile': pathfile,
      'id_tutor': idTutor,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class TutoriasDetalleRecordDocumentEquality
    implements Equality<TutoriasDetalleRecord> {
  const TutoriasDetalleRecordDocumentEquality();

  @override
  bool equals(TutoriasDetalleRecord? e1, TutoriasDetalleRecord? e2) {
    return e1?.estado == e2?.estado &&
        e1?.color == e2?.color &&
        e1?.pathfile == e2?.pathfile &&
        e1?.idTutor == e2?.idTutor &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(TutoriasDetalleRecord? e) => const ListEquality()
      .hash([e?.estado, e?.color, e?.pathfile, e?.idTutor, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is TutoriasDetalleRecord;
}
