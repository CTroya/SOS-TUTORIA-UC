import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/reviewprofe_widget.dart';
import '/components/sin_notificaciones_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notificaciones_model.dart';
export 'notificaciones_model.dart';

class NotificacionesWidget extends StatefulWidget {
  const NotificacionesWidget({Key? key}) : super(key: key);

  @override
  _NotificacionesWidgetState createState() => _NotificacionesWidgetState();
}

class _NotificacionesWidgetState extends State<NotificacionesWidget> {
  late NotificacionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacionesModel());

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
        backgroundColor: FlutterFlowTheme.of(context).lineColor,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).background,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).customColor4,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Notificaciones',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).textColor,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: StreamBuilder<List<NotificacionesRecord>>(
          stream: queryNotificacionesRecord(
            queryBuilder: (notificacionesRecord) => notificacionesRecord.where(
              'id_user',
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
            List<NotificacionesRecord> listViewNotificacionesRecordList =
                snapshot.data!;
            if (listViewNotificacionesRecordList.isEmpty) {
              return SinNotificacionesWidget();
            }
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(
                0,
                4.0,
                0,
                44.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: listViewNotificacionesRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 8.0),
              itemBuilder: (context, listViewIndex) {
                final listViewNotificacionesRecord =
                    listViewNotificacionesRecordList[listViewIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: StreamBuilder<TutoriasDetalleRecord>(
                    stream: TutoriasDetalleRecord.getDocument(
                        listViewNotificacionesRecord.idTutoriaDetalle!),
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
                      final containerTutoriasDetalleRecord = snapshot.data!;
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFFE5E7EB),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 32.0,
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: Color(0x4D9489F5),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFF6F61EF),
                                    width: 2.0,
                                  ),
                                ),
                                child: Icon(
                                  Icons.notifications_sharp,
                                  color: Color(0xFF15161E),
                                  size: 16.0,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 4.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tutorias!',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF15161E),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              containerTutoriasDetalleRecord
                                                  .idTutor!),
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
                                            final textUsersRecord =
                                                snapshot.data!;
                                            return Text(
                                              'Tu tutoria con el tutor ${textUsersRecord.displayName} ha terminado, por favor da una review!!!!',
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF15161E),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                1.00, 0.00),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.stars_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
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
                                                            ReviewprofeWidget(
                                                          tutoriareference:
                                                              containerTutoriasDetalleRecord
                                                                  .reference,
                                                          notificacion:
                                                              listViewNotificacionesRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Review',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.00, 1.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 4.0),
                                          child: Text(
                                            dateTimeFormat(
                                              'relative',
                                              listViewNotificacionesRecord
                                                  .fechaNotificacion!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF606A85),
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
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
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
