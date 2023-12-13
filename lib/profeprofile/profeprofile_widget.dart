import '/backend/backend.dart';
import '/components/sin_datos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profeprofile_model.dart';
export 'profeprofile_model.dart';

class ProfeprofileWidget extends StatefulWidget {
  const ProfeprofileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final DocumentReference? user;

  @override
  _ProfeprofileWidgetState createState() => _ProfeprofileWidgetState();
}

class _ProfeprofileWidgetState extends State<ProfeprofileWidget>
    with TickerProviderStateMixin {
  late ProfeprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfeprofileModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.user!),
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
        final profeprofileUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional(0.0, -1.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Image.network(
                    profeprofileUsersRecord.photoUrl,
                    width: double.infinity,
                    height: 340.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, -0.87),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x520E151B),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).info,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).info,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).textColor,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x520E151B),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).info,
                            icon: Icon(
                              Icons.ios_share,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 20.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 200.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 800.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF153B5C),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x320E151B),
                                    offset: Offset(0.0, -2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                profeprofileUsersRecord
                                                    .displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textColor,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  profeprofileUsersRecord
                                                      .userName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textColor,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium,
                                                unselectedLabelStyle:
                                                    TextStyle(),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                tabs: [
                                                  Tab(
                                                    text: 'Materias',
                                                  ),
                                                  Tab(
                                                    text: 'Descripción',
                                                  ),
                                                  Tab(
                                                    text: 'Reviews',
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                children: [
                                                  StreamBuilder<
                                                      List<TutorRecord>>(
                                                    stream: queryTutorRecord(
                                                      queryBuilder:
                                                          (tutorRecord) =>
                                                              tutorRecord.where(
                                                        'id_user',
                                                        isEqualTo: widget.user,
                                                      ),
                                                      singleRecord: true,
                                                    ),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final containerTutorRecord =
                                                          containerTutorRecordList
                                                                  .isNotEmpty
                                                              ? containerTutorRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                MateriasRecord>>(
                                                          stream:
                                                              queryMateriasRecord(
                                                            queryBuilder: (materiasRecord) =>
                                                                materiasRecord.whereIn(
                                                                    'nombreMateria',
                                                                    containerTutorRecord
                                                                        ?.materias),
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
                                                            List<MateriasRecord>
                                                                listViewMateriasRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewMateriasRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewMateriasRecord =
                                                                    listViewMateriasRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary600,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          offset: Offset(
                                                                              0.0,
                                                                              1.0),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        width:
                                                                            0.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                listViewMateriasRecord.foto,
                                                                                'https://firebasestorage.googleapis.com/v0/b/uc-tutoria-troya-g8gbiu.appspot.com/o/fotos%2F2702154.png?alt=media&token=abc01cb7-799b-4ee1-a0de-b35c9db798a5',
                                                                              ),
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    listViewMateriasRecord.nombreMateria,
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'containerOnPageLoadAnimation']!),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
                                                    child: ListView(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      4.0,
                                                                      4.0,
                                                                      4.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                child: Container(
                                                                                  width: 44.0,
                                                                                  height: 44.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFF153B5C),
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                    shape: BoxShape.rectangle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).textColor,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                      child: Image.network(
                                                                                        profeprofileUsersRecord.photoUrl,
                                                                                        width: 70.0,
                                                                                        height: 70.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      profeprofileUsersRecord.displayName,
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).grayLight,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        profeprofileUsersRecord.email,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            ),
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                AutoSizeText(
                                                                              profeprofileUsersRecord.bio,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF153B5C),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<ReviewRecord>>(
                                                        stream:
                                                            queryReviewRecord(
                                                          queryBuilder:
                                                              (reviewRecord) =>
                                                                  reviewRecord
                                                                      .where(
                                                            'reviewed',
                                                            isEqualTo:
                                                                widget.user,
                                                          ),
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
                                                          List<ReviewRecord>
                                                              listViewReviewRecordList =
                                                              snapshot.data!;
                                                          if (listViewReviewRecordList
                                                              .isEmpty) {
                                                            return SinDatosWidget();
                                                          }
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewReviewRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewReviewRecord =
                                                                  listViewReviewRecordList[
                                                                      listViewIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: StreamBuilder<
                                                                    UsersRecord>(
                                                                  stream: UsersRecord
                                                                      .getDocument(
                                                                          listViewReviewRecord
                                                                              .reviewer!),
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
                                                                    final card10RatingUsersRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'profeprofile',
                                                                          queryParameters:
                                                                              {
                                                                            'user':
                                                                                serializeParam(
                                                                              card10RatingUsersRecord.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              4.0,
                                                                              4.0,
                                                                              4.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                          child: Container(
                                                                                            width: 44.0,
                                                                                            height: 44.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                              shape: BoxShape.rectangle,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                child: Image.network(
                                                                                                  card10RatingUsersRecord.photoUrl,
                                                                                                  width: 70.0,
                                                                                                  height: 70.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                card10RatingUsersRecord.displayName.maybeHandleOverflow(maxChars: 20),
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  card10RatingUsersRecord.email.maybeHandleOverflow(maxChars: 20),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Rating',
                                                                                          style: FlutterFlowTheme.of(context).labelSmall,
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                              child: Text(
                                                                                                listViewReviewRecord.puntaje.toString(),
                                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                      fontFamily: 'Outfit',
                                                                                                      color: Color(0xFF153B5C),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Icon(
                                                                                              Icons.star_rounded,
                                                                                              color: Color(0xFF153B5C),
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: AutoSizeText(
                                                                                        listViewReviewRecord.comentario,
                                                                                        style: FlutterFlowTheme.of(context).labelMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
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
                                          ],
                                        ),
                                      ),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
