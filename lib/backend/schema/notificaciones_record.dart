import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacionesRecord extends FirestoreRecord {
  NotificacionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_tutoria_detalle" field.
  DocumentReference? _idTutoriaDetalle;
  DocumentReference? get idTutoriaDetalle => _idTutoriaDetalle;
  bool hasIdTutoriaDetalle() => _idTutoriaDetalle != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "fechaNotificacion" field.
  DateTime? _fechaNotificacion;
  DateTime? get fechaNotificacion => _fechaNotificacion;
  bool hasFechaNotificacion() => _fechaNotificacion != null;

  void _initializeFields() {
    _idTutoriaDetalle =
        snapshotData['id_tutoria_detalle'] as DocumentReference?;
    _estado = snapshotData['estado'] as String?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
    _fechaNotificacion = snapshotData['fechaNotificacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificaciones');

  static Stream<NotificacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacionesRecord.fromSnapshot(s));

  static Future<NotificacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacionesRecord.fromSnapshot(s));

  static NotificacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacionesRecordData({
  DocumentReference? idTutoriaDetalle,
  String? estado,
  DocumentReference? idUser,
  DateTime? fechaNotificacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_tutoria_detalle': idTutoriaDetalle,
      'estado': estado,
      'id_user': idUser,
      'fechaNotificacion': fechaNotificacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacionesRecordDocumentEquality
    implements Equality<NotificacionesRecord> {
  const NotificacionesRecordDocumentEquality();

  @override
  bool equals(NotificacionesRecord? e1, NotificacionesRecord? e2) {
    return e1?.idTutoriaDetalle == e2?.idTutoriaDetalle &&
        e1?.estado == e2?.estado &&
        e1?.idUser == e2?.idUser &&
        e1?.fechaNotificacion == e2?.fechaNotificacion;
  }

  @override
  int hash(NotificacionesRecord? e) => const ListEquality()
      .hash([e?.idTutoriaDetalle, e?.estado, e?.idUser, e?.fechaNotificacion]);

  @override
  bool isValidKey(Object? o) => o is NotificacionesRecord;
}
