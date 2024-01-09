import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_user_transactions_model.dart';
export 'empty_user_transactions_model.dart';

class EmptyUserTransactionsWidget extends StatefulWidget {
  const EmptyUserTransactionsWidget({Key? key}) : super(key: key);

  @override
  _EmptyUserTransactionsWidgetState createState() =>
      _EmptyUserTransactionsWidgetState();
}

class _EmptyUserTransactionsWidgetState
    extends State<EmptyUserTransactionsWidget> {
  late EmptyUserTransactionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyUserTransactionsModel());
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
          'Wygląda na to, że nie dokonałeś jeszcze żadnych transakcji finansowych na tym koncie. Wszystkie przyszłe operacje zakupu oraz wpłat zostaną udokumentowane w tym miejscu.',
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
