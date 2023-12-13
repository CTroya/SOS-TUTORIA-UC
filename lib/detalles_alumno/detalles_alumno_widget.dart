import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/reviewprofe_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detalles_alumno_model.dart';
export 'detalles_alumno_model.dart';

class DetallesAlumnoWidget extends StatefulWidget {
  const DetallesAlumnoWidget({
    Key? key,
    required this.tutoriareference,
    required this.materia,
    required this.fecha,
    required this.modalidad,
    required this.alumno,
    required this.estado,
    required this.existeDetalleActivo,
    required this.existeDetalle,
    required this.existeDetalleTerminado,
  }) : super(key: key);

  final DocumentReference? tutoriareference;
  final String? materia;
  final DateTime? fecha;
  final String? modalidad;
  final DocumentReference? alumno;
  final String? estado;
  final bool? existeDetalleActivo;
  final bool? existeDetalle;
  final bool? existeDetalleTerminado;

  @override
  _DetallesAlumnoWidgetState createState() => _DetallesAlumnoWidgetState();
}

class _DetallesAlumnoWidgetState extends State<DetallesAlumnoWidget> {
  late DetallesAlumnoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallesAlumnoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              RefreshIndicator(
                onRefresh: () async {},
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Detalles de Solicitud',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 16.0, 12.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.materia,
                                            'materia',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF15161E),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'Materia',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          widget.modalidad!,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF15161E),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'Modaliadd',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          dateTimeFormat(
                                            'MEd',
                                            widget.fecha,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF15161E),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'fecha',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF606A85),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 16.0),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(widget.alumno!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitCircle(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            final containerUsersRecord = snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'profeprofile',
                                  queryParameters: {
                                    'user': serializeParam(
                                      widget.alumno,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x320E151B),
                                      offset: Offset(0.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 8.0, 8.0),
                                  child: StreamBuilder<List<AlumnoRecord>>(
                                    stream: queryAlumnoRecord(
                                      queryBuilder: (alumnoRecord) =>
                                          alumnoRecord.where(
                                        'id_user',
                                        isEqualTo: widget.alumno,
                                      ),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 40.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<AlumnoRecord> rowAlumnoRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final rowAlumnoRecord =
                                          rowAlumnoRecordList.isNotEmpty
                                              ? rowAlumnoRecordList.first
                                              : null;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFF4E39F9),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 2.0, 2.0, 2.0),
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  containerUsersRecord.photoUrl,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  containerUsersRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                ),
                                                StreamBuilder<CarrerasRecord>(
                                                  stream: CarrerasRecord
                                                      .getDocument(
                                                          rowAlumnoRecord!
                                                              .carrera!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          child: SpinKitCircle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 40.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final textCarrerasRecord =
                                                        snapshot.data!;
                                                    return Text(
                                                      textCarrerasRecord
                                                          .nombreCarrera,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (widget.existeDetalleTerminado == true)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 90.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tutoría completada!',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      if (widget.existeDetalle == false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 16.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 570.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Aceptar Solicitud',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.check_box,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        await TutoriasDetalleRecord.createDoc(
                                                widget.tutoriareference!)
                                            .set(
                                                createTutoriasDetalleRecordData(
                                          estado: 'CONFIRMADA',
                                          color: Color(0x00000000),
                                          idTutor: currentUserReference,
                                        ));
                                        context.safePop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Solicitud Confirmada',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      StreamBuilder<List<TutoriasDetalleRecord>>(
                        stream: queryTutoriasDetalleRecord(
                          parent: widget.tutoriareference,
                          queryBuilder: (tutoriasDetalleRecord) =>
                              tutoriasDetalleRecord
                                  .where(
                                    'estado',
                                    isEqualTo: valueOrDefault<String>(
                                      'ACTIVA',
                                      'ACTIVA',
                                    ),
                                  )
                                  .where(
                                    'id_tutor',
                                    isEqualTo: currentUserReference,
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: SpinKitCircle(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 40.0,
                                ),
                              ),
                            );
                          }
                          List<TutoriasDetalleRecord>
                              columnTutoriasDetalleRecordList = snapshot.data!;
                          final columnTutoriasDetalleRecord =
                              columnTutoriasDetalleRecordList.isNotEmpty
                                  ? columnTutoriasDetalleRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.existeDetalleActivo == true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      constraints: BoxConstraints(
                                        maxWidth: 570.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 16.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Terminar Tutoria',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.logout_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor3,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                await columnTutoriasDetalleRecord!
                                                    .reference
                                                    .update(
                                                        createTutoriasDetalleRecordData(
                                                  estado: 'TERMINADA',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ));

                                                var notificacionesRecordReference =
                                                    NotificacionesRecord
                                                        .collection
                                                        .doc();
                                                await notificacionesRecordReference
                                                    .set({
                                                  ...createNotificacionesRecordData(
                                                    idTutoriaDetalle:
                                                        columnTutoriasDetalleRecord
                                                            ?.reference,
                                                    estado: 'NO VISTO',
                                                    idUser: widget.alumno,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'fechaNotificacion':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                _model.notif =
                                                    NotificacionesRecord
                                                        .getDocumentFromData({
                                                  ...createNotificacionesRecordData(
                                                    idTutoriaDetalle:
                                                        columnTutoriasDetalleRecord
                                                            ?.reference,
                                                    estado: 'NO VISTO',
                                                    idUser: widget.alumno,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'fechaNotificacion':
                                                          DateTime.now(),
                                                    },
                                                  ),
                                                }, notificacionesRecordReference);
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            ReviewprofeCopyWidget(
                                                          tutoriareference:
                                                              columnTutoriasDetalleRecord!
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                context.safePop();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'La tutoria ha sido terminada',
                                                      style: TextStyle(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 7450),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );

                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      if ((widget.existeDetalleActivo == false) &&
                          (widget.existeDetalle == true) &&
                          (widget.existeDetalleTerminado == false))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 90.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Solicitud enviada!',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .textColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Existe detalle activo:${widget.existeDetalleActivo?.toString()}',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Existe detalle:${widget.existeDetalle?.toString()}',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.0,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Existe detalle terminado:${widget.existeDetalleTerminado?.toString()}',
                    style: FlutterFlowTheme.of(context).headlineMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
