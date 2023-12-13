import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sin_solicitudes_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        backgroundColor: Color(0xFF153B5C),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 16.0, 6.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.tutor, false) ==
                                true) {
                              context.pushNamed(
                                'profeprofile',
                                queryParameters: {
                                  'user': serializeParam(
                                    currentUserReference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                  ),
                                },
                              );
                            } else {
                              context.pushNamed('perfilNuevo');
                            }
                          },
                          child: Container(
                            width: 53.0,
                            height: 53.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF153B5C),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF153B5C),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 2.0, 2.0, 2.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.tutor,
                                            false) ==
                                        true) {
                                      context.pushNamed(
                                        'profeprofile',
                                        queryParameters: {
                                          'user': serializeParam(
                                            currentUserReference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                          ),
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image.network(
                                      currentUserPhoto,
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            'Bienvenido ${currentUserDisplayName}!',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                          ),
                        ),
                      ),
                      if (valueOrDefault<bool>(
                              currentUserDocument?.admin, false) ==
                          true)
                        Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: AuthUserStreamWidget(
                            builder: (context) => FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.admin_panel_settings_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('adminList');
                              },
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.notifications_none,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.pushNamed('notificaciones');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (FFAppState().viewAlumno)
                  StreamBuilder<List<AlumnoRecord>>(
                    stream: queryAlumnoRecord(
                      queryBuilder: (alumnoRecord) => alumnoRecord.where(
                        'id_user',
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
                      List<AlumnoRecord> alumnoAlumnoRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final alumnoAlumnoRecord =
                          alumnoAlumnoRecordList.isNotEmpty
                              ? alumnoAlumnoRecordList.first
                              : null;
                      return StickyHeader(
                        overlapHeaders: false,
                        header: Visibility(
                          visible: valueOrDefault<bool>(
                                  currentUserDocument?.tutor, false) ==
                              true,
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: double.infinity,
                              height: 74.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF153B5C),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (valueOrDefault<bool>(
                                        currentUserDocument?.tutor, false)) {
                                      setState(() {
                                        FFAppState().viewAlumno = false;
                                      });
                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Estimado Usuario'),
                                            content: Text(
                                                'Para cambiar a la vista de es necesario rellenar y enviar la solictud de tutor'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .darkBGstatic,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 1.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 130.0, 15.0),
                                              child: Text(
                                                'Cambiar a vista de tutor',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius: 10.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.co_present_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.tutor, false) ==
                                false)
                              AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: double.infinity,
                                  height: 74.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF153B5C),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('solicitarSerTutor');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .darkBGstatic,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          170.0, 15.0),
                                                  child: Text(
                                                    'Solicitar ser Tutor',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius: 10.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  Icons.arrow_forward,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Text(
                              'Solicitudes',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 20.0,
                                  ),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: StreamBuilder<List<TutoriasRecord>>(
                                  stream: queryTutoriasRecord(
                                    queryBuilder: (tutoriasRecord) =>
                                        tutoriasRecord
                                            .where(
                                              'id_user',
                                              isEqualTo: currentUserReference,
                                            )
                                            .orderBy('estado'),
                                  ),
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
                                    List<TutoriasRecord>
                                        listViewTutoriasRecordList =
                                        snapshot.data!;
                                    if (listViewTutoriasRecordList.isEmpty) {
                                      return SinSolicitudesWidget();
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewTutoriasRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewTutoriasRecord =
                                            listViewTutoriasRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'detallesTutor',
                                                queryParameters: {
                                                  'tutoriareference':
                                                      serializeParam(
                                                    listViewTutoriasRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'materia': serializeParam(
                                                    listViewTutoriasRecord
                                                        .materia,
                                                    ParamType.String,
                                                  ),
                                                  'fecha': serializeParam(
                                                    listViewTutoriasRecord
                                                        .fechaSolicitud,
                                                    ParamType.DateTime,
                                                  ),
                                                  'modalidad': serializeParam(
                                                    listViewTutoriasRecord
                                                        .modalidad,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF12316C),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x25090F13),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 8.0, 12.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    listViewTutoriasRecord
                                                                        .materia,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          fontSize:
                                                                              15.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Borrar Solicitud'),
                                                                          content:
                                                                              Text('Estas seguro que quieres borrar tu solicitud?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('No'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('SI'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              await listViewTutoriasRecord
                                                                  .reference
                                                                  .update(
                                                                      createTutoriasRecordData(
                                                                estado:
                                                                    'BORRADO',
                                                              ));
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .delete_forever_sharp,
                                                            color: Color(
                                                                0xA5FF0003),
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      height: 24.0,
                                                      thickness: 1.0,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Fecha',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                'Md',
                                                                listViewTutoriasRecord
                                                                    .fechaSolicitud!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (listViewTutoriasRecord
                                                                .estado ==
                                                            'ACTIVA')
                                                          InkWell(
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
                                                              await listViewTutoriasRecord
                                                                  .reference
                                                                  .update(
                                                                      createTutoriasRecordData(
                                                                estado:
                                                                    'CERRADA',
                                                              ));
                                                            },
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 32.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            32.0),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Text(
                                                                'Cerrar Tutoria',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (listViewTutoriasRecord
                                                                .estado ==
                                                            'CERRADA')
                                                          InkWell(
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
                                                              await listViewTutoriasRecord
                                                                  .reference
                                                                  .update(
                                                                      createTutoriasRecordData(
                                                                estado:
                                                                    'ACTIVA',
                                                              ));
                                                            },
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 32.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            32.0),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Text(
                                                                'Abrir Tutoria',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation1']!),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                if (!FFAppState().viewAlumno)
                  StreamBuilder<List<TutorRecord>>(
                    stream: queryTutorRecord(
                      queryBuilder: (tutorRecord) => tutorRecord.where(
                        'id_user',
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
                      List<TutorRecord> tutorTutorRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final tutorTutorRecord = tutorTutorRecordList.isNotEmpty
                          ? tutorTutorRecordList.first
                          : null;
                      return StickyHeader(
                        overlapHeaders: false,
                        header: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().viewAlumno = true;
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF12316C),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          115.0, 15.0),
                                                  child: Text(
                                                    'Cambiar a vista de Alumno',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius: 10.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  Icons
                                                      .location_history_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context
                                            .pushNamed('solicitarSerTutorCopy');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF12316C),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          75.0, 15.0),
                                                  child: Text(
                                                    'Solicitar ser tutor en otra materia',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius: 10.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  Icons.arrow_forward,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Solicitudes',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 20.0,
                                  ),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: StreamBuilder<List<TutoriasRecord>>(
                                  stream: queryTutoriasRecord(
                                    queryBuilder: (tutoriasRecord) =>
                                        tutoriasRecord
                                            .whereIn('materia',
                                                tutorTutorRecord?.materias)
                                            .where(
                                              'estado',
                                              isEqualTo: valueOrDefault<String>(
                                                'ACTIVA',
                                                'ACTIVA',
                                              ),
                                            )
                                            .where(
                                              'id_user',
                                              isNotEqualTo:
                                                  currentUserReference,
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
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<TutoriasRecord>
                                        listViewTutoriasRecordList =
                                        snapshot.data!;
                                    if (listViewTutoriasRecordList.isEmpty) {
                                      return SinSolicitudesWidget();
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewTutoriasRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewTutoriasRecord =
                                            listViewTutoriasRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: StreamBuilder<
                                              List<TutoriasDetalleRecord>>(
                                            stream: queryTutoriasDetalleRecord(
                                              parent: listViewTutoriasRecord
                                                  .reference,
                                              queryBuilder:
                                                  (tutoriasDetalleRecord) =>
                                                      tutoriasDetalleRecord
                                                          .where(
                                                            'id_tutor',
                                                            isEqualTo:
                                                                currentUserReference,
                                                          )
                                                          .where(
                                                            'estado',
                                                            isEqualTo: 'ACTIVA',
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<TutoriasDetalleRecord>
                                                  containerDetalleActivoTutoriasDetalleRecordList =
                                                  snapshot.data!;
                                              final containerDetalleActivoTutoriasDetalleRecord =
                                                  containerDetalleActivoTutoriasDetalleRecordList
                                                          .isNotEmpty
                                                      ? containerDetalleActivoTutoriasDetalleRecordList
                                                          .first
                                                      : null;
                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF12316C),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3.0,
                                                      color: Color(0x25090F13),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: StreamBuilder<
                                                    List<
                                                        TutoriasDetalleRecord>>(
                                                  stream:
                                                      queryTutoriasDetalleRecord(
                                                    parent:
                                                        listViewTutoriasRecord
                                                            .reference,
                                                    queryBuilder:
                                                        (tutoriasDetalleRecord) =>
                                                            tutoriasDetalleRecord
                                                                .where(
                                                                  'id_tutor',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                )
                                                                .where(
                                                                  'estado',
                                                                  isEqualTo:
                                                                      'TERMINADA',
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 40.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<TutoriasDetalleRecord>
                                                        containerDetalleTerminadoTutoriasDetalleRecordList =
                                                        snapshot.data!;
                                                    final containerDetalleTerminadoTutoriasDetalleRecord =
                                                        containerDetalleTerminadoTutoriasDetalleRecordList
                                                                .isNotEmpty
                                                            ? containerDetalleTerminadoTutoriasDetalleRecordList
                                                                .first
                                                            : null;
                                                    return Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: StreamBuilder<
                                                          List<
                                                              TutoriasDetalleRecord>>(
                                                        stream:
                                                            queryTutoriasDetalleRecord(
                                                          parent:
                                                              listViewTutoriasRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (tutoriasDetalleRecord) =>
                                                                  tutoriasDetalleRecord
                                                                      .where(
                                                            'id_tutor',
                                                            isEqualTo:
                                                                currentUserReference,
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
                                                          List<TutoriasDetalleRecord>
                                                              containerTutoriasDetalleRecordList =
                                                              snapshot.data!;
                                                          final containerTutoriasDetalleRecord =
                                                              containerTutoriasDetalleRecordList
                                                                      .isNotEmpty
                                                                  ? containerTutoriasDetalleRecordList
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
                                                                'detallesAlumno',
                                                                queryParameters:
                                                                    {
                                                                  'tutoriareference':
                                                                      serializeParam(
                                                                    listViewTutoriasRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'materia':
                                                                      serializeParam(
                                                                    listViewTutoriasRecord
                                                                        .materia,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'fecha':
                                                                      serializeParam(
                                                                    listViewTutoriasRecord
                                                                        .fechaSolicitud,
                                                                    ParamType
                                                                        .DateTime,
                                                                  ),
                                                                  'modalidad':
                                                                      serializeParam(
                                                                    listViewTutoriasRecord
                                                                        .modalidad,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'alumno':
                                                                      serializeParam(
                                                                    listViewTutoriasRecord
                                                                        .idUser,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'estado':
                                                                      serializeParam(
                                                                    listViewTutoriasRecord
                                                                        .estado,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'existeDetalleActivo':
                                                                      serializeParam(
                                                                    containerDetalleActivoTutoriasDetalleRecord !=
                                                                        null,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'existeDetalle':
                                                                      serializeParam(
                                                                    containerTutoriasDetalleRecord !=
                                                                        null,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'existeDetalleTerminado':
                                                                      serializeParam(
                                                                    containerDetalleTerminadoTutoriasDetalleRecord !=
                                                                        null,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        12.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        TutoriasDetalleRecord>>(
                                                                  stream:
                                                                      queryTutoriasDetalleRecord(
                                                                    parent: listViewTutoriasRecord
                                                                        .reference,
                                                                    queryBuilder:
                                                                        (tutoriasDetalleRecord) =>
                                                                            tutoriasDetalleRecord.where(
                                                                      'id_tutor',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          child:
                                                                              SpinKitCircle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            size:
                                                                                40.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<TutoriasDetalleRecord>
                                                                        columnTutoriasDetalleRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final columnTutoriasDetalleRecord = columnTutoriasDetalleRecordList
                                                                            .isNotEmpty
                                                                        ? columnTutoriasDetalleRecordList
                                                                            .first
                                                                        : null;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.00, 1.00),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                        child: StreamBuilder<UsersRecord>(
                                                                                          stream: UsersRecord.getDocument(listViewTutoriasRecord.idUser!),
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
                                                                                            return ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                              child: Image.network(
                                                                                                imageUsersRecord.photoUrl,
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                      child: StreamBuilder<UsersRecord>(
                                                                                        stream: UsersRecord.getDocument(listViewTutoriasRecord.idUser!),
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
                                                                                          final textUsersRecord = snapshot.data!;
                                                                                          return Text(
                                                                                            textUsersRecord.displayName,
                                                                                            textAlign: TextAlign.justify,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  fontSize: 15.0,
                                                                                                ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Fecha',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  dateTimeFormat(
                                                                                    'd/M',
                                                                                    listViewTutoriasRecord.fechaSolicitud!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Color(0xFF14558C),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: Text(
                                                                                listViewTutoriasRecord.materia,
                                                                                textAlign: TextAlign.justify,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 15.0,
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
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation3']!);
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
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
