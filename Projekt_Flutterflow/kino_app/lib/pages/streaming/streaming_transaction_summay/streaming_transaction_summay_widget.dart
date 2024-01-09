import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'streaming_transaction_summay_model.dart';
export 'streaming_transaction_summay_model.dart';

class StreamingTransactionSummayWidget extends StatefulWidget {
  const StreamingTransactionSummayWidget({
    Key? key,
    this.selectedMovie,
  }) : super(key: key);

  final MoviesRecord? selectedMovie;

  @override
  _StreamingTransactionSummayWidgetState createState() =>
      _StreamingTransactionSummayWidgetState();
}

class _StreamingTransactionSummayWidgetState
    extends State<StreamingTransactionSummayWidget> {
  late StreamingTransactionSummayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreamingTransactionSummayModel());
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
              'Podsumowanie',
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      width: 300.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF808080),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Kupno Streamingu',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          widget.selectedMovie!.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Tytuł: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  widget.selectedMovie!.title,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Gatunek: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  widget.selectedMovie!.genre,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Cena za bilet: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      widget.selectedMovie?.streamingPrice,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                      currency: 'PLN ',
                                    ),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            if (widget.selectedMovie!.streamingPrice <=
                                valueOrDefault(
                                    currentUserDocument?.balance, 0.0)) {
                              var userStreamingsRecordReference =
                                  UserStreamingsRecord.collection.doc();
                              await userStreamingsRecordReference
                                  .set(createUserStreamingsRecordData(
                                user: currentUserReference,
                                streaming: widget.selectedMovie?.reference,
                                movieTitle: widget.selectedMovie?.title,
                                movieGenre: widget.selectedMovie?.genre,
                              ));
                              _model.createdStreaming =
                                  UserStreamingsRecord.getDocumentFromData(
                                      createUserStreamingsRecordData(
                                        user: currentUserReference,
                                        streaming:
                                            widget.selectedMovie?.reference,
                                        movieTitle: widget.selectedMovie?.title,
                                        movieGenre: widget.selectedMovie?.genre,
                                      ),
                                      userStreamingsRecordReference);
                              _shouldSetState = true;

                              await TransactionsRecord.collection
                                  .doc()
                                  .set(createTransactionsRecordData(
                                    user: currentUserReference,
                                    type: FFAppState().transactionTypeStreaming,
                                    movieTitle: widget.selectedMovie?.title,
                                    date: getCurrentTimestamp,
                                    value: widget.selectedMovie?.streamingPrice,
                                    status: 'Transakcja powiodła się',
                                    balanceBefore: valueOrDefault(
                                        currentUserDocument?.balance, 0.0),
                                    balanceAfter: functions.substractTwoNumbers(
                                        valueOrDefault(
                                            currentUserDocument?.balance, 0.0),
                                        widget.selectedMovie!.streamingPrice),
                                  ));

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'balance': FieldValue.increment(-(widget
                                        .selectedMovie!.streamingPrice)),
                                  },
                                ),
                              });
                              FFAppState().newStreaming =
                                  _model.createdStreaming?.reference;
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                      child: AlertDialog(
                                    title: Text('UDAŁO SIĘ'),
                                    content: Text(
                                        'Operacja przebiegła pomyślnie. Teraz możesz obejrzeć zakupiony film poprzez wybranie go z listy zakupionych streamingów.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ));
                                },
                              );

                              context.pushNamed('ShoppingTransactionPage');

                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                      child: AlertDialog(
                                    title: Text('BRAK ŚRODKÓW'),
                                    content: Text(
                                        'Niestety, ale nie posiadasz wystarczającej ilości środków na koncie, aby przeprowadzić daną operację zakupu. Dołąduj konto i wróć tutaj ponownie.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Rozumiem'),
                                      ),
                                    ],
                                  ));
                                },
                              );

                              await TransactionsRecord.collection
                                  .doc()
                                  .set(createTransactionsRecordData(
                                    user: currentUserReference,
                                    type: FFAppState().transactionTypeStreaming,
                                    movieTitle: widget.selectedMovie?.title,
                                    date: getCurrentTimestamp,
                                    value: widget.selectedMovie?.streamingPrice,
                                    status:
                                        'Transakcja nie powiodła się - brak środków na koncie',
                                  ));

                              context.goNamed('DiscountPage');

                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: 'ZAPŁAĆ',
                          options: FFButtonOptions(
                            width: 220.0,
                            height: 45.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF27325A),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Color(0xEF000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
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
