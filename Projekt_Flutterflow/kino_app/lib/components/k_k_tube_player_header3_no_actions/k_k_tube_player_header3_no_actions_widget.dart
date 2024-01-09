import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'k_k_tube_player_header3_no_actions_model.dart';
export 'k_k_tube_player_header3_no_actions_model.dart';

class KKTubePlayerHeader3NoActionsWidget extends StatefulWidget {
  const KKTubePlayerHeader3NoActionsWidget({Key? key}) : super(key: key);

  @override
  _KKTubePlayerHeader3NoActionsWidgetState createState() =>
      _KKTubePlayerHeader3NoActionsWidgetState();
}

class _KKTubePlayerHeader3NoActionsWidgetState
    extends State<KKTubePlayerHeader3NoActionsWidget> {
  late KKTubePlayerHeader3NoActionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KKTubePlayerHeader3NoActionsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: 100.0,
            height: 100.0,
            constraints: BoxConstraints(
              maxWidth: 130.0,
              maxHeight: 40.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF27325A),
              border: Border.all(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'LOSOWO',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: Color(0x67FFFFFF),
                      fontSize: 16.0,
                    ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 100.0,
            height: 100.0,
            constraints: BoxConstraints(
              maxWidth: 130.0,
              maxHeight: 40.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF27325A),
              border: Border.all(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'SUBSKRYBOWANE',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
