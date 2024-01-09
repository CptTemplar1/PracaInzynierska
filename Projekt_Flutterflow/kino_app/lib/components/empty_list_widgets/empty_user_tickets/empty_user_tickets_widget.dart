import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_user_tickets_model.dart';
export 'empty_user_tickets_model.dart';

class EmptyUserTicketsWidget extends StatefulWidget {
  const EmptyUserTicketsWidget({Key? key}) : super(key: key);

  @override
  _EmptyUserTicketsWidgetState createState() => _EmptyUserTicketsWidgetState();
}

class _EmptyUserTicketsWidgetState extends State<EmptyUserTicketsWidget> {
  late EmptyUserTicketsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyUserTicketsModel());
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
          'Wygląda na to, że nie posiadasz jeszcze żadnych biletów. Proponujemy zajrzeć do zakładki \"Filmy\", aby przejrzeć bierzący repertuar.',
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
