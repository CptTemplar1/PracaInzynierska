import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_chat_list_model.dart';
export 'empty_chat_list_model.dart';

class EmptyChatListWidget extends StatefulWidget {
  const EmptyChatListWidget({Key? key}) : super(key: key);

  @override
  _EmptyChatListWidgetState createState() => _EmptyChatListWidgetState();
}

class _EmptyChatListWidgetState extends State<EmptyChatListWidget> {
  late EmptyChatListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyChatListModel());
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
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          'Wygląda na to, że nie posiadasz żadnych aktywnych czatów. Zacznij czatować z innymi użytkownikami już teraz klikając w jedną z ikon znajdujących się w prawym górnym rogu.',
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
