import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_current_user_videos_model.dart';
export 'empty_current_user_videos_model.dart';

class EmptyCurrentUserVideosWidget extends StatefulWidget {
  const EmptyCurrentUserVideosWidget({Key? key}) : super(key: key);

  @override
  _EmptyCurrentUserVideosWidgetState createState() =>
      _EmptyCurrentUserVideosWidgetState();
}

class _EmptyCurrentUserVideosWidgetState
    extends State<EmptyCurrentUserVideosWidget> {
  late EmptyCurrentUserVideosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCurrentUserVideosModel());
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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, -0.5),
        child: Text(
          'Wygląda na to, że nie dodałeś jeszcze żadnego filmiku na platformie KKTube. Zmień to przechodząc do zakładki \"Dodaj filmik\" z poziomu ekranu twojego profilu KKTube.',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                fontSize: 22.0,
                fontStyle: FontStyle.italic,
              ),
        ),
      ),
    );
  }
}
