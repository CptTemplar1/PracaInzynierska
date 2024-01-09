import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shopping_help_subpage_model.dart';
export 'shopping_help_subpage_model.dart';

class ShoppingHelpSubpageWidget extends StatefulWidget {
  const ShoppingHelpSubpageWidget({Key? key}) : super(key: key);

  @override
  _ShoppingHelpSubpageWidgetState createState() =>
      _ShoppingHelpSubpageWidgetState();
}

class _ShoppingHelpSubpageWidgetState extends State<ShoppingHelpSubpageWidget> {
  late ShoppingHelpSubpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShoppingHelpSubpageModel());
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
              'Zakupy/Transakcje Help',
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Strona ta pozwala Ci monitorować wszystkie operacje płatnicze przeprowadzane na twoim koncie użytkownika. Składa się ona z trzech podstron:',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAD000000),
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            ' *lista kupionych biletów (BILETY)\n *lista kupionych streamingów (FILMY)\n *lista wszystkich transakcji płatniczych, w tym także doładowań (TRANSAKCJE)',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAD000000),
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/zakupy_zakadki.png',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xB3000000),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Pierwsza podstrona zawiera listę wszystkich zakupionych przez Ciebie biletów na seanse kinowe. Bilety są sortowane od najnowszych do najstarszych. Każda pozycja z listy zawiera jedynie najważniejsze informacje o bilecie, a w celu wyświetlenia szczegółów na temat danego biletu, należy kliknąć wybrany wiersz. Zostanie wtedy wyświetlony następny ekran ze wszystkimi informacjami na temat biletu - tytuł, data, godzina, wybrane miejsca, itd. Kluczowym elementem znajdującym się na tej stronie jest kod QR biletu, gdyż dopiero po jego okazaniu przysługuje Ci wejście na salę kinową.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAD000000),
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 50.0, 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/images/bilety.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xB3000000),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Druga podstrona wyświetla zakupione przez Ciebie filmy w postaci dostępu strumieniowego. Po wybraniu interesującej Cię pozycji, zostaniesz przeniesiony na nową stronę zawierającą player wideo odtwarzający twój film.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAD000000),
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 50.0, 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/images/filmy.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xB3000000),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Ostatnia podstrona jest niejako połączeniem dwóch poprzednich, gdyż zawiera listę wszystkich operacji zakupu przeprowadzonych na koncie.  Oznacza to, że użytkownik znajdzie tu zarówno transakcje zakupu biletów jak i streamingów. Na tą listę trafią także podsumowania wszystkich operacji doładowań salda konta. Jeśli któraś z twoich transakcji nie powiedzie się z jakiegoś powodu, aplikacja również stworzy odpowiedni dokument z informacjami podsumowującymi.\nPodobnie jak w przypadku biletów, masz możliwość wyświetlenia szczegółowych informacji na temat danej transakcji. Aby to zrobić wystarczy, że wybierzesz konkretny wiersz, a aplikacja przekieruje Cię dalej.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAD000000),
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 50.0, 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          'assets/images/transakcje.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0xB3000000),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Warto zauważyć, że zaraz po pomyślnym zaksięgowaniu transakcji kupna biletu na seans lub dostępu strumieniowego zostaniesz przekierowany na odpowiednią stronę - BILETY lub FILMY, gdzie na niebiesko zostanie podświetlona jedna z pozycji. Będzie ona dotyczyć świeżo dokonanej operacji. Pamiętaj, że podświetlenie jest jednorazowe i występuje tylko jako następstwo pomyślnego zakończenia transakcji zakupu. Po ponownym przejściu na tą stronę, żadna pozycja nie będzie wyróżniona.',
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xAD000000),
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ],
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
