import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sin_profesores_model.dart';
export 'sin_profesores_model.dart';

class SinProfesoresWidget extends StatefulWidget {
  const SinProfesoresWidget({Key? key}) : super(key: key);

  @override
  _SinProfesoresWidgetState createState() => _SinProfesoresWidgetState();
}

class _SinProfesoresWidgetState extends State<SinProfesoresWidget> {
  late SinProfesoresModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinProfesoresModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.payments_sharp,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 90.0,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pimero debes crear los perfiles de Profesores!',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      fontSize: 15.0,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
