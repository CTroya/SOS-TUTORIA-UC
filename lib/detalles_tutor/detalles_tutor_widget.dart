import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sin_tutores_widget.dart';
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
import 'detalles_tutor_model.dart';
export 'detalles_tutor_model.dart';

class DetallesTutorWidget extends StatefulWidget {
  const DetallesTutorWidget({
    Key? key,
    required this.tutoriareference,
    required this.materia,
    required this.fecha,
    required this.modalidad,
  }) : super(key: key);

  final DocumentReference? tutoriareference;
  final String? materia;
  final DateTime? fecha;
  final String? modalidad;

  @override
  _DetallesTutorWidgetState createState() => _DetallesTutorWidgetState();
}

class _DetallesTutorWidgetState extends State<DetallesTutorWidget> {
  late DetallesTutorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetallesTutorModel());

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
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).tertiary400,
                              ),
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
                                                fontSize: 18.0,
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
                                                fontSize: 18.0,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: StreamBuilder<List<TutoriasDetalleRecord>>(
                            stream: queryTutoriasDetalleRecord(
                              parent: widget.tutoriareference,
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
                              List<TutoriasDetalleRecord>
                                  listViewTutoriasDetalleRecordList =
                                  snapshot.data!;
                              if (listViewTutoriasDetalleRecordList.isEmpty) {
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  child: SinTutoresWidget(),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewTutoriasDetalleRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewTutoriasDetalleRecord =
                                      listViewTutoriasDetalleRecordList[
                                          listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 0.0),
                                    child: StreamBuilder<List<TutorRecord>>(
                                      stream: queryTutorRecord(
                                        queryBuilder: (tutorRecord) =>
                                            tutorRecord.where(
                                          'id_user',
                                          isEqualTo:
                                              listViewTutoriasDetalleRecord
                                                  .idTutor,
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
                                        List<TutorRecord>
                                            containerTutorRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerTutorRecord =
                                            containerTutorRecordList.isNotEmpty
                                                ? containerTutorRecordList.first
                                                : null;
                                        return Container(
                                          width: double.infinity,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x320E151B),
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 8.0, 2.0, 8.0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  containerTutorRecord!
                                                      .idUser!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: SpinKitCircle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final rowUsersRecord =
                                                    snapshot.data!;
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color: Color(0xFF4E39F9),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    2.0,
                                                                    2.0,
                                                                    2.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'profeprofile',
                                                              queryParameters: {
                                                                'user':
                                                                    serializeParam(
                                                                  containerTutorRecord
                                                                      ?.idUser,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              rowUsersRecord
                                                                  .photoUrl,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          rowUsersRecord
                                                              .displayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF15161E),
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (listViewTutoriasDetalleRecord
                                                                    .estado ==
                                                                'ACTIVA')
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons.sms,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor1,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  _model.tutor =
                                                                      await UsersRecord.getDocumentOnce(
                                                                          containerTutorRecord!
                                                                              .idUser!);

                                                                  context
                                                                      .pushNamed(
                                                                    'ChatPage',
                                                                    queryParameters:
                                                                        {
                                                                      'tutoriaDetalle':
                                                                          serializeParam(
                                                                        listViewTutoriasDetalleRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                      'chatUser':
                                                                          serializeParam(
                                                                        _model
                                                                            .tutor,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'tutoriaDetalle':
                                                                          listViewTutoriasDetalleRecord,
                                                                      'chatUser':
                                                                          _model
                                                                              .tutor,
                                                                    },
                                                                  );

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            if (listViewTutoriasDetalleRecord
                                                                    .estado ==
                                                                'CONFIRMADA')
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .check_box,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await listViewTutoriasDetalleRecord
                                                                      .reference
                                                                      .update(
                                                                          createTutoriasDetalleRecordData(
                                                                    estado:
                                                                        'ACTIVA',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    uid: widget
                                                                        .tutoriareference
                                                                        ?.id,
                                                                  ));
                                                                },
                                                              ),
                                                            if (listViewTutoriasDetalleRecord
                                                                    .estado ==
                                                                'CONFIRMADA')
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  await listViewTutoriasDetalleRecord
                                                                      .reference
                                                                      .update(
                                                                          createTutoriasDetalleRecordData(
                                                                    estado:
                                                                        'RECHAZADA',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                  ));
                                                                },
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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
