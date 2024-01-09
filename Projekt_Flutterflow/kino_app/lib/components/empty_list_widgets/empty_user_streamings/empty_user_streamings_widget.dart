import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_user_streamings_model.dart';
export 'empty_user_streamings_model.dart';

class EmptyUserStreamingsWidget extends StatefulWidget {
  const EmptyUserStreamingsWidget({Key? key}) : super(key: key);

  @override
  _EmptyUserStreamingsWidgetState createState() =>
      _EmptyUserStreamingsWidgetState();
}

class _EmptyUserStreamingsWidgetState extends State<EmptyUserStreamingsWidget> {
  late EmptyUserStreamingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyUserStreamingsModel());
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
          'Wygląda na to, że nie posiadasz jeszcze dostępu do żadnych filmów w postaci Streamingu. Proponujemy zajrzeć do zakładki \"Filmy\", aby przejrzeć dostępne produkcje.',
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
