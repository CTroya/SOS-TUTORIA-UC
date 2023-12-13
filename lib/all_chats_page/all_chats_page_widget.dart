import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_chats_page_model.dart';
export 'all_chats_page_model.dart';

class AllChatsPageWidget extends StatefulWidget {
  const AllChatsPageWidget({Key? key}) : super(key: key);

  @override
  _AllChatsPageWidgetState createState() => _AllChatsPageWidgetState();
}

class _AllChatsPageWidgetState extends State<AllChatsPageWidget> {
  late AllChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsPageModel());

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

    return StreamBuilder<List<TutoriasRecord>>(
      stream: queryTutoriasRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
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
        List<TutoriasRecord> allChatsPageTutoriasRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).backgroundComponents,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Text(
                    'Tutorias',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            elevation: 4.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                  child: StreamBuilder<List<TutoriasDetalleRecord>>(
                    stream: queryTutoriasDetalleRecord(
                      queryBuilder: (tutoriasDetalleRecord) =>
                          tutoriasDetalleRecord
                              .where(
                                'estado',
                                isEqualTo: 'ACTIVA',
                              )
                              .where(
                                'id_tutor',
                                isNotEqualTo: currentUserReference,
                              )
                              .whereIn(
                                  'uid',
                                  allChatsPageTutoriasRecordList
                                      .map((e) => e.reference.id)
                                      .toList()),
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
                          listViewTutoriasDetalleRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTutoriasDetalleRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTutoriasDetalleRecord =
                              listViewTutoriasDetalleRecordList[listViewIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.tutor = await UsersRecord.getDocumentOnce(
                                  listViewTutoriasDetalleRecord.idTutor!);

                              context.pushNamed(
                                'ChatPage',
                                queryParameters: {
                                  'tutoriaDetalle': serializeParam(
                                    listViewTutoriasDetalleRecord,
                                    ParamType.Document,
                                  ),
                                  'chatUser': serializeParam(
                                    _model.tutor,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'tutoriaDetalle':
                                      listViewTutoriasDetalleRecord,
                                  'chatUser': _model.tutor,
                                },
                              );

                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewTutoriasDetalleRecord.idTutor!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final menuItemUsersRecord = snapshot.data!;
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x411D2429),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: StreamBuilder<TutoriasRecord>(
                                        stream: TutoriasRecord.getDocument(
                                            listViewTutoriasDetalleRecord
                                                .parentReference),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child: SpinKitCircle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final rowTutoriasRecord =
                                              snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 1.0, 1.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    menuItemUsersRecord
                                                        .photoUrl,
                                                    width: 70.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 4.0, 0.0),
                                                  child: Column(
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
                                                        'Tutor: ${menuItemUsersRecord.displayName}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            rowTutoriasRecord
                                                                .materia
                                                                .maybeHandleOverflow(
                                                              maxChars: 70,
                                                              replacement: '…',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Opacity(
                                                    opacity: 0.0,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<ChatsRecord>>(
                                                        stream:
                                                            queryChatsRecord(
                                                          queryBuilder:
                                                              (chatsRecord) =>
                                                                  chatsRecord
                                                                      .where(
                                                            'tutoriaDetalle',
                                                            isEqualTo:
                                                                listViewTutoriasDetalleRecord
                                                                    .reference,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  size: 40.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ChatsRecord>
                                                              iconChatsRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final iconChatsRecord =
                                                              iconChatsRecordList
                                                                      .isNotEmpty
                                                                  ? iconChatsRecordList
                                                                      .first
                                                                  : null;
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'ChatPage',
                                                                queryParameters:
                                                                    {
                                                                  'tutoriaDetalle':
                                                                      serializeParam(
                                                                    listViewTutoriasDetalleRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'chatRef':
                                                                      serializeParam(
                                                                    iconChatsRecord
                                                                        ?.reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'tutoriaDetalle':
                                                                      listViewTutoriasDetalleRecord,
                                                                },
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color: Color(
                                                                  0xFF57636C),
                                                              size: 24.0,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Opacity(
                                                    opacity: 0.0,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  8.0),
                                                      child: StreamBuilder<
                                                          List<ChatsRecord>>(
                                                        stream:
                                                            queryChatsRecord(
                                                          queryBuilder:
                                                              (chatsRecord) =>
                                                                  chatsRecord
                                                                      .where(
                                                            'tutoriaDetalle',
                                                            isEqualTo:
                                                                listViewTutoriasDetalleRecord
                                                                    .reference,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  size: 40.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ChatsRecord>
                                                              textChatsRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final textChatsRecord =
                                                              textChatsRecordList
                                                                      .isNotEmpty
                                                                  ? textChatsRecordList
                                                                      .first
                                                                  : null;
                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              rowTutoriasRecord
                                                                  .estado,
                                                              'null',
                                                            ),
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF153B5C),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                // UID DE TUTORIA DETALLE ES EL ID DE LA TUTORIA A LA QUE PERTENECE, MEREZCO UNA PATADA EN LA BOCA LRTPM
                if (valueOrDefault<bool>(currentUserDocument?.tutor, false))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) =>
                          StreamBuilder<List<TutoriasDetalleRecord>>(
                        stream: queryTutoriasDetalleRecord(
                          queryBuilder: (tutoriasDetalleRecord) =>
                              tutoriasDetalleRecord
                                  .where(
                                    'estado',
                                    isEqualTo: 'ACTIVA',
                                  )
                                  .where(
                                    'id_tutor',
                                    isEqualTo: currentUserReference,
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
                          List<TutoriasDetalleRecord>
                              listViewTutoriasDetalleRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewTutoriasDetalleRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewTutoriasDetalleRecord =
                                  listViewTutoriasDetalleRecordList[
                                      listViewIndex];
                              return StreamBuilder<TutoriasRecord>(
                                stream: TutoriasRecord.getDocument(
                                    listViewTutoriasDetalleRecord
                                        .parentReference),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final containerTutoriasRecord =
                                      snapshot.data!;
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.tutor1 =
                                          await TutoriasRecord.getDocumentOnce(
                                              listViewTutoriasDetalleRecord
                                                  .parentReference);
                                      _model.alumnocreo =
                                          await UsersRecord.getDocumentOnce(
                                              _model.tutor1!.idUser!);

                                      context.pushNamed(
                                        'ChatPage',
                                        queryParameters: {
                                          'chatUser': serializeParam(
                                            _model.alumnocreo,
                                            ParamType.Document,
                                          ),
                                          'tutoriaDetalle': serializeParam(
                                            listViewTutoriasDetalleRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'chatUser': _model.alumnocreo,
                                          'tutoriaDetalle':
                                              listViewTutoriasDetalleRecord,
                                        },
                                      );

                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF153B5C),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0xFF153B5C),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: StreamBuilder<TutoriasRecord>(
                                            stream: TutoriasRecord.getDocument(
                                                listViewTutoriasDetalleRecord
                                                    .parentReference),
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
                                              final rowTutoriasRecord =
                                                  snapshot.data!;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 1.0,
                                                                1.0, 1.0),
                                                    child: StreamBuilder<
                                                        UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              rowTutoriasRecord
                                                                  .idUser!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 40.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final imageUsersRecord =
                                                            snapshot.data!;
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            imageUsersRecord
                                                                .photoUrl,
                                                            width: 70.0,
                                                            height: 100.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          StreamBuilder<
                                                              UsersRecord>(
                                                            stream: UsersRecord
                                                                .getDocument(
                                                                    rowTutoriasRecord
                                                                        .idUser!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    child:
                                                                        SpinKitCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final textUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Text(
                                                                'Alumno: ${textUsersRecord.displayName}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                              );
                                                            },
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                rowTutoriasRecord
                                                                    .materia
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 70,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Opacity(
                                                        opacity: 0.0,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .chevron_right_rounded,
                                                            color: Color(
                                                                0xFF57636C),
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Opacity(
                                                        opacity: 0.0,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      8.0),
                                                          child: Text(
                                                            listViewTutoriasDetalleRecord
                                                                .estado,
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0x828B97A2),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
        );
      },
    );
  }
}
