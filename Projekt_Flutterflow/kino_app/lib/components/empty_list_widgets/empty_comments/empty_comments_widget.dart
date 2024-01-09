import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_comments_model.dart';
export 'empty_comments_model.dart';

class EmptyCommentsWidget extends StatefulWidget {
  const EmptyCommentsWidget({Key? key}) : super(key: key);

  @override
  _EmptyCommentsWidgetState createState() => _EmptyCommentsWidgetState();
}

class _EmptyCommentsWidgetState extends State<EmptyCommentsWidget> {
  late EmptyCommentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCommentsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(0.0, -0.5),
          child: Text(
            'Wygląda na to, że dla tego filmiku nie zostały dodane jeszcze żadne komentarze. Bądź pierwszy i daj znać innym co myślisz o tym filmiku.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 22.0,
                  fontStyle: FontStyle.italic,
                ),
          ),
        ),
      ),
    );
  }
}
