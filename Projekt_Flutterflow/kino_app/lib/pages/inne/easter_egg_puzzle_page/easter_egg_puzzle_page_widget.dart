import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'easter_egg_puzzle_page_model.dart';
export 'easter_egg_puzzle_page_model.dart';

class EasterEggPuzzlePageWidget extends StatefulWidget {
  const EasterEggPuzzlePageWidget({Key? key}) : super(key: key);

  @override
  _EasterEggPuzzlePageWidgetState createState() =>
      _EasterEggPuzzlePageWidgetState();
}

class _EasterEggPuzzlePageWidgetState extends State<EasterEggPuzzlePageWidget> {
  late EasterEggPuzzlePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EasterEggPuzzlePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFF27325A),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'WYZWANIE CZEKA',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 0.0),
                          child: Text(
                            'Czy podejmiesz się tej przygody?',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                    child: Text(
                      '„Świat ma cztery strony, lecz nam zależy na trzech. Zamek do skarbu potrzebuje trzech kluczy. Dążąc do celu, musisz czasem zrobić krok w bok, który otworzy Ci nowe możliwości. Który to bok spytasz. Nie masz ich dużo do sprawdzenia, lecz tylko jeden jest właściwy. Stwórca świata jest jeden, podobnie jest i tu. Trzy ostatnie cyfry wskażą Ci trop.\n\nCoś jak obrazek, lecz to nie fotografia, w wirtualnym świecie przedstawia twoją postać. To graficzna reprezentacja, jak na ekranie aktor, słowo to wskaże Ci pierwszy klucz.\nPodążając za twoim własnym kontem, napotkasz liczne obrazy, lecz tylko dwa są właściwe. Dotyk wiele potrafi, lecz gdy z nim przesadzisz, wszystko szlak trafi.\n\nW sieci bezpieczeństwo, to priorytet ważny, na stronie tej, obrazek błyszczy niczym blask gwiazdy. To on wskaże Ci drugi klucz.\n\nNa stronie tej, gdzie kroczysz ku pożegnaniu, obrazek patrzy, jak podejmujesz ostatnią decyzję znaczącą. To on wskaże Ci trzeci klucz.\n\nNie szukaj klamki, gdyż już ją odwiedziłeś. Czasem niektóre rzeczy mogą robić więcej niż Ci się wydaje. Jeśli dalej nic nie wymyśliłeś, zastanów się nad zmianą swojego szyfru dostępowego, a to rozwiąże twoje problemy.”',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Color(0xAD000000),
                            fontSize: 18.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        'assets/images/gandalf.gif',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          hideHelloPage: true,
                        ));

                        context.goNamed('MainPage');
                      },
                      text: 'WCHODZĘ W TO',
                      options: FFButtonOptions(
                        width: 200.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFFFD700),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
