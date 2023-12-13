import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tutoria_chat_model.dart';
export 'tutoria_chat_model.dart';

class TutoriaChatWidget extends StatefulWidget {
  const TutoriaChatWidget({Key? key}) : super(key: key);

  @override
  _TutoriaChatWidgetState createState() => _TutoriaChatWidgetState();
}

class _TutoriaChatWidgetState extends State<TutoriaChatWidget> {
  late TutoriaChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TutoriaChatModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
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
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                  width: 70.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 4.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
                        child: AutoSizeText(
                          'A wonderfully delicious 2 patty melt that melts into your...',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFF57636C),
                    size: 24.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 8.0),
                  child: Text(
                    '\$11.00',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF153B5C),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
