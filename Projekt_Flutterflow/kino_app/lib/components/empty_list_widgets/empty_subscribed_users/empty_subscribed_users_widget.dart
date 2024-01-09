import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_subscribed_users_model.dart';
export 'empty_subscribed_users_model.dart';

class EmptySubscribedUsersWidget extends StatefulWidget {
  const EmptySubscribedUsersWidget({Key? key}) : super(key: key);

  @override
  _EmptySubscribedUsersWidgetState createState() =>
      _EmptySubscribedUsersWidgetState();
}

class _EmptySubscribedUsersWidgetState
    extends State<EmptySubscribedUsersWidget> {
  late EmptySubscribedUsersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptySubscribedUsersModel());
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
          'Wygląda na to, że nie zasubskrybowałeś jeszcze żadnego konta użytkownika KKTube. Wejdź w profil użytkownika I naciśnij przycisk subskrybuj lub kliknij ikonkę subskrypcji znajdującą się obok nazwy użytkownika pod każdym filmikiem.',
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
