import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TutoriasRecord extends FirestoreRecord {
  TutoriasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "materia" field.
  String? _materia;
  String get materia => _materia ?? '';
  bool hasMateria() => _materia != null;

  // "fecha_solicitud" field.
  DateTime? _fechaSolicitud;
  DateTime? get fechaSolicitud => _fechaSolicitud;
  bool hasFechaSolicitud() => _fechaSolicitud != null;

  // "modalidad" field.
  String? _modalidad;
  String get modalidad => _modalidad ?? '';
  bool hasModalidad() => _modalidad != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  void _initializeFields() {
    _idUser = snapshotData['id_user'] as DocumentReference?;
    _materia = snapshotData['materia'] as String?;
    _fechaSolicitud = snapshotData['fecha_solicitud'] as DateTime?;
    _modalidad = snapshotData['modalidad'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _estado = snapshotData['estado'] as String?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tutorias');

  static Stream<TutoriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TutoriasRecord.fromSnapshot(s));

  static Future<TutoriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TutoriasRecord.fromSnapshot(s));

  static TutoriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TutoriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TutoriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TutoriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TutoriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TutoriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTutoriasRecordData({
  DocumentReference? idUser,
  String? materia,
  DateTime? fechaSolicitud,
  String? modalidad,
  String? descripcion,
  String? estado,
  DateTime? fechaCreacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_user': idUser,
      'materia': materia,
      'fecha_solicitud': fechaSolicitud,
      'modalidad': modalidad,
      'descripcion': descripcion,
      'estado': estado,
      'fecha_creacion': fechaCreacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class TutoriasRecordDocumentEquality implements Equality<TutoriasRecord> {
  const TutoriasRecordDocumentEquality();

  @override
  bool equals(TutoriasRecord? e1, TutoriasRecord? e2) {
    return e1?.idUser == e2?.idUser &&
        e1?.materia == e2?.materia &&
        e1?.fechaSolicitud == e2?.fechaSolicitud &&
        e1?.modalidad == e2?.modalidad &&
        e1?.descripcion == e2?.descripcion &&
        e1?.estado == e2?.estado &&
        e1?.fechaCreacion == e2?.fechaCreacion;
  }

  @override
  int hash(TutoriasRecord? e) => const ListEquality().hash([
        e?.idUser,
        e?.materia,
        e?.fechaSolicitud,
        e?.modalidad,
        e?.descripcion,
        e?.estado,
        e?.fechaCreacion
      ]);

  @override
  bool isValidKey(Object? o) => o is TutoriasRecord;
}
