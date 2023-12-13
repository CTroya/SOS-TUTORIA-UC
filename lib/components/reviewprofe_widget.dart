import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sin_solicitudes_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reviewprofe_model.dart';
export 'reviewprofe_model.dart';

class ReviewprofeWidget extends StatefulWidget {
  const ReviewprofeWidget({
    Key? key,
    required this.tutoriareference,
    required this.notificacion,
  }) : super(key: key);

  final DocumentReference? tutoriareference;
  final DocumentReference? notificacion;

  @override
  _ReviewprofeWidgetState createState() => _ReviewprofeWidgetState();
}

class _ReviewprofeWidgetState extends State<ReviewprofeWidget> {
  late ReviewprofeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewprofeModel());

    _model.shortBioController ??= TextEditingController();
    _model.shortBioFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.05, 0.15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<TutoriasDetalleRecord>(
                  stream: TutoriasDetalleRecord.getDocument(
                      widget.tutoriareference!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return SinSolicitudesWidget();
                    }
                    final columnTutoriasDetalleRecord = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.chevron_left_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 32.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 5.0, 0.0, 0.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      columnTutoriasDetalleRecord.idTutor!),
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
                                    final textUsersRecord = snapshot.data!;
                                    return Text(
                                      textUsersRecord.displayName,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF4E73BC),
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 5.0, 0.0, 0.0),
                            child: Text(
                              'Comentario',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF4E73BC),
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Dejanos tus comentarios para mejorar!',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.10, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 0.0, 0.0),
                              child: RatingBar.builder(
                                onRatingUpdate: (newValue) => setState(
                                    () => _model.ratingBarValue = newValue),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                                direction: Axis.horizontal,
                                initialRating: _model.ratingBarValue ??= 0.0,
                                unratedColor:
                                    FlutterFlowTheme.of(context).accent2,
                                itemCount: 5,
                                itemSize: 40.0,
                                glowColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowCheckboxGroup(
                              options: [
                                'Sabe de la materia',
                                'Responde mis dudas',
                                'Se dio la tutoria'
                              ],
                              onChanged: (val) => setState(
                                  () => _model.checkboxGroupValues = val),
                              controller:
                                  _model.checkboxGroupValueController ??=
                                      FormFieldController<List<String>>(
                                [],
                              ),
                              activeColor: Color(0xFF4E73BC),
                              checkColor: Colors.white,
                              checkboxBorderColor:
                                  FlutterFlowTheme.of(context).accent2,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              initialized: _model.checkboxGroupValues != null,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model.shortBioController,
                              focusNode: _model.shortBioFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText:
                                    'Ingrese otro comentario sobre la clase o profe aquí...',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 32.0, 20.0, 12.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              textAlign: TextAlign.start,
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
                              validator: _model.shortBioControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 44.0),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  columnTutoriasDetalleRecord.idTutor!),
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
                                final buttonUsersRecord = snapshot.data!;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;

                                    var reviewRecordReference =
                                        ReviewRecord.collection.doc();
                                    await reviewRecordReference.set({
                                      ...createReviewRecordData(
                                        idTutoriaDetalle:
                                            widget.tutoriareference,
                                        puntaje: _model.ratingBarValue,
                                        comentario:
                                            _model.shortBioController.text,
                                        reviewer: currentUserReference,
                                        reviewed:
                                            columnTutoriasDetalleRecord.idTutor,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'comentario_list':
                                              _model.checkboxGroupValues,
                                        },
                                      ),
                                    });
                                    _model.review =
                                        ReviewRecord.getDocumentFromData({
                                      ...createReviewRecordData(
                                        idTutoriaDetalle:
                                            widget.tutoriareference,
                                        puntaje: _model.ratingBarValue,
                                        comentario:
                                            _model.shortBioController.text,
                                        reviewer: currentUserReference,
                                        reviewed:
                                            columnTutoriasDetalleRecord.idTutor,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'comentario_list':
                                              _model.checkboxGroupValues,
                                        },
                                      ),
                                    }, reviewRecordReference);
                                    _shouldSetState = true;
                                    if (_model.review != null) {
                                      await widget.notificacion!.delete();

                                      context.pushNamed('home');

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Problemas al crear review',
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
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'Terminar Tutoria',
                                  options: FFButtonOptions(
                                    width: 270.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF4E73BC),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                );
                              },
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
