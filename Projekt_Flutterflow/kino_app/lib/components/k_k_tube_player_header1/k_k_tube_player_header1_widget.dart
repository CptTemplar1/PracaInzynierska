import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'k_k_tube_player_header1_model.dart';
export 'k_k_tube_player_header1_model.dart';

class KKTubePlayerHeader1Widget extends StatefulWidget {
  const KKTubePlayerHeader1Widget({
    Key? key,
    required this.documentList,
  }) : super(key: key);

  final List<DocumentReference>? documentList;

  @override
  _KKTubePlayerHeader1WidgetState createState() =>
      _KKTubePlayerHeader1WidgetState();
}

class _KKTubePlayerHeader1WidgetState extends State<KKTubePlayerHeader1Widget> {
  late KKTubePlayerHeader1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KKTubePlayerHeader1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.updatePage(() {
        FFAppState().RandomizedKKTubeVideos = functions
            .randomKKTubeVideoRef(
                widget.documentList!.toList(), widget.documentList!.length)
            .toList()
            .cast<DocumentReference>();
      });
    });
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
                      color: Colors.white,
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
                      color: Color(0x67FFFFFF),
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
