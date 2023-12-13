import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'elegir_fecha_model.dart';
export 'elegir_fecha_model.dart';

class ElegirFechaWidget extends StatefulWidget {
  const ElegirFechaWidget({Key? key}) : super(key: key);

  @override
  _ElegirFechaWidgetState createState() => _ElegirFechaWidgetState();
}

class _ElegirFechaWidgetState extends State<ElegirFechaWidget> {
  late ElegirFechaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ElegirFechaModel());

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
      children: [
        FlutterFlowCalendar(
          color: FlutterFlowTheme.of(context).primary,
          iconColor: FlutterFlowTheme.of(context).textColor,
          weekFormat: false,
          weekStartsMonday: false,
          rowHeight: 64.0,
          onChange: (DateTimeRange? newSelectedDate) {
            setState(() => _model.calendarSelectedDay = newSelectedDate);
          },
          titleStyle: FlutterFlowTheme.of(context).headlineSmall,
          dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
          dateStyle: FlutterFlowTheme.of(context).bodyMedium,
          selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
          inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
          locale: FFLocalizations.of(context).languageCode,
        ),
      ],
    );
  }
}
