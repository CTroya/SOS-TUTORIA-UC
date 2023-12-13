import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'aceptar_solicitud_tutor_model.dart';
export 'aceptar_solicitud_tutor_model.dart';

class AceptarSolicitudTutorWidget extends StatefulWidget {
  const AceptarSolicitudTutorWidget({
    Key? key,
    required this.solicitudTutor,
  }) : super(key: key);

  final SolicitudTutorRecord? solicitudTutor;

  @override
  _AceptarSolicitudTutorWidgetState createState() =>
      _AceptarSolicitudTutorWidgetState();
}

class _AceptarSolicitudTutorWidgetState
    extends State<AceptarSolicitudTutorWidget> {
  late AceptarSolicitudTutorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AceptarSolicitudTutorModel());

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.solicitudTutor!.idUser!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final aceptarSolicitudTutorUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
            title: Text(
              'Detalles de la Solicitud',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).grayLight,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: FutureBuilder<int>(
            future: queryTutorRecordCount(
              queryBuilder: (tutorRecord) => tutorRecord.where(
                'id_user',
                isEqualTo: widget.solicitudTutor?.idUser,
              ),
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
              int columnMainContentCount = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            widget.solicitudTutor!.idUser!),
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
                          final imageUsersRecord = snapshot.data!;
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
                                    widget.solicitudTutor?.idUser,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                imageUsersRecord.photoUrl,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 230.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                widget.solicitudTutor!.idUser!),
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
                              final titleTextUsersRecord = snapshot.data!;
                              return Text(
                                titleTextUsersRecord.displayName,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                    ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.solicitudTutor?.materia,
                                'null',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF1D4F7F),
                                  ),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.solicitudTutor?.descripcion,
                              'Null',
                            ),
                            style: FlutterFlowTheme.of(context).labelLarge,
                          ),
                        ],
                      ),
                    ),
                    if (columnMainContentCount == 0)
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 24.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await widget.solicitudTutor!.idUser!
                                  .update(createUsersRecordData(
                                tutor: true,
                              ));
                              if (columnMainContentCount == 0) {
                                await TutorRecord.collection.doc().set({
                                  ...createTutorRecordData(
                                    idUser: widget.solicitudTutor?.idUser,
                                    userName: aceptarSolicitudTutorUsersRecord
                                        .displayName,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'materias': [
                                        widget.solicitudTutor?.materia
                                      ],
                                    },
                                  ),
                                });
                              }
                              await widget.solicitudTutor!.reference.delete();
                              context.safePop();
                            },
                            text: 'Aceptar',
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF153B5C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                    if (columnMainContentCount > 0)
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 24.0),
                          child: StreamBuilder<List<TutorRecord>>(
                            stream: queryTutorRecord(
                              queryBuilder: (tutorRecord) => tutorRecord.where(
                                'id_user',
                                isEqualTo:
                                    aceptarSolicitudTutorUsersRecord.reference,
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
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<TutorRecord> buttonPrimaryTutorRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonPrimaryTutorRecord =
                                  buttonPrimaryTutorRecordList.isNotEmpty
                                      ? buttonPrimaryTutorRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  await widget.solicitudTutor!.idUser!
                                      .update(createUsersRecordData(
                                    tutor: true,
                                  ));
                                  if (columnMainContentCount != 0) {
                                    await buttonPrimaryTutorRecord!.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'materias': FieldValue.arrayUnion(
                                              [widget.solicitudTutor?.materia]),
                                        },
                                      ),
                                    });
                                  } else {
                                    await TutorRecord.collection.doc().set({
                                      ...createTutorRecordData(
                                        idUser: widget.solicitudTutor?.idUser,
                                        userName:
                                            aceptarSolicitudTutorUsersRecord
                                                .displayName,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'materias': [
                                            widget.solicitudTutor?.materia
                                          ],
                                        },
                                      ),
                                    });
                                  }

                                  await widget.solicitudTutor!.reference
                                      .delete();
                                  context.safePop();
                                },
                                text: 'Aceptar',
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF153B5C),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 24.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await widget.solicitudTutor!.reference.delete();
                            context.safePop();
                          },
                          text: 'Rechazar',
                          options: FFButtonOptions(
                            width: 300.0,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF882626),
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
