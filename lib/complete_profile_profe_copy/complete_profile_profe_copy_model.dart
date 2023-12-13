import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'complete_profile_profe_copy_widget.dart'
    show CompleteProfileProfeCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompleteProfileProfeCopyModel
    extends FlutterFlowModel<CompleteProfileProfeCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoController;
  String? Function(BuildContext, String?)? correoControllerValidator;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  // State field(s) for nrocelular widget.
  FocusNode? nrocelularFocusNode;
  TextEditingController? nrocelularController;
  String? Function(BuildContext, String?)? nrocelularControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionController;
  String? Function(BuildContext, String?)? descripcionControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    correoFocusNode?.dispose();
    correoController?.dispose();

    nombreFocusNode?.dispose();
    nombreController?.dispose();

    nrocelularFocusNode?.dispose();
    nrocelularController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
