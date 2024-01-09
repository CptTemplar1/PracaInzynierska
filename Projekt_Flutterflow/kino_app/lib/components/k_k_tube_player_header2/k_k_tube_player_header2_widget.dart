import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'k_k_tube_player_header2_model.dart';
export 'k_k_tube_player_header2_model.dart';

class KKTubePlayerHeader2Widget extends StatefulWidget {
  const KKTubePlayerHeader2Widget({
    Key? key,
    required this.documentList,
  }) : super(key: key);

  final List<DocumentReference>? documentList;

  @override
  _KKTubePlayerHeader2WidgetState createState() =>
      _KKTubePlayerHeader2WidgetState();
}

class _KKTubePlayerHeader2WidgetState extends State<KKTubePlayerHeader2Widget> {
  late KKTubePlayerHeader2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KKTubePlayerHeader2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.updatePage(() {
        FFAppState().RandomizedSubscribedKKTubeVideos =
            widget.documentList!.toList().cast<DocumentReference>();
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
