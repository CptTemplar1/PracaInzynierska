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
import 'ticket_transaction_summay_model.dart';
export 'ticket_transaction_summay_model.dart';

class TicketTransactionSummayWidget extends StatefulWidget {
  const TicketTransactionSummayWidget({
    Key? key,
    this.selectedMovie,
    this.selectedRepertory,
    this.selectedRepertoryDetails,
    this.posterChoice,
    this.priceSum,
  }) : super(key: key);

  final MoviesRecord? selectedMovie;
  final RepertoryRecord? selectedRepertory;
  final RepertoryDetailsRecord? selectedRepertoryDetails;
  final String? posterChoice;
  final double? priceSum;

  @override
  _TicketTransactionSummayWidgetState createState() =>
      _TicketTransactionSummayWidgetState();
}

class _TicketTransactionSummayWidgetState
    extends State<TicketTransactionSummayWidget> {
  late TicketTransactionSummayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketTransactionSummayModel());
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
                            'Kupno biletu',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 45.0, 0.0, 0.0),
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
                                    'Data: ',
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
                                    dateTimeFormat('d/M/y',
                                        widget.selectedRepertory!.date!),
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
                                    'Godzina: ',
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
                                    widget.selectedRepertoryDetails!.time,
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
                                    'Wybrane miejsca: ',
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
                                    functions.returnListAsString(
                                        FFAppState().selectedSeats.toList()),
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
                                        widget
                                            .selectedRepertory?.pricePerTicket,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: 'PLN ',
                                      ),
                                      'NIE DOTYCZY',
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Plakat: ',
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
                                      widget.posterChoice,
                                      'BŁĄD',
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Suma: ',
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
                                    formatNumber(
                                      widget.priceSum,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.commaDecimal,
                                      currency: 'PLN ',
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              if (widget.priceSum! <=
                                  valueOrDefault(
                                      currentUserDocument?.balance, 0.0)) {
                                await widget.selectedRepertoryDetails!.reference
                                    .update(createRepertoryDetailsRecordData(
                                  seat00: FFAppState().seat00 == 1
                                      ? 2
                                      : FFAppState().seat00,
                                  seat01: FFAppState().seat01 == 1
                                      ? 2
                                      : FFAppState().seat01,
                                  seat02: FFAppState().seat02 == 1
                                      ? 2
                                      : FFAppState().seat02,
                                  seat03: FFAppState().seat03 == 1
                                      ? 2
                                      : FFAppState().seat03,
                                  seat04: FFAppState().seat04 == 1
                                      ? 2
                                      : FFAppState().seat04,
                                  seat05: FFAppState().seat05 == 1
                                      ? 2
                                      : FFAppState().seat05,
                                  seat06: FFAppState().seat06 == 1
                                      ? 2
                                      : FFAppState().seat06,
                                  seat10: FFAppState().seat10 == 1
                                      ? 2
                                      : FFAppState().seat10,
                                  seat11: FFAppState().seat11 == 1
                                      ? 2
                                      : FFAppState().seat11,
                                  seat12: FFAppState().seat12 == 1
                                      ? 2
                                      : FFAppState().seat12,
                                  seat13: FFAppState().seat13 == 1
                                      ? 2
                                      : FFAppState().seat13,
                                  seat14: FFAppState().seat14 == 1
                                      ? 2
                                      : FFAppState().seat14,
                                  seat15: FFAppState().seat15 == 1
                                      ? 2
                                      : FFAppState().seat15,
                                  seat16: FFAppState().seat16 == 1
                                      ? 2
                                      : FFAppState().seat16,
                                  seat20: FFAppState().seat20 == 1
                                      ? 2
                                      : FFAppState().seat20,
                                  seat21: FFAppState().seat21 == 1
                                      ? 2
                                      : FFAppState().seat21,
                                  seat22: FFAppState().seat22 == 1
                                      ? 2
                                      : FFAppState().seat22,
                                  seat23: FFAppState().seat23 == 1
                                      ? 2
                                      : FFAppState().seat23,
                                  seat24: FFAppState().seat24 == 1
                                      ? 2
                                      : FFAppState().seat24,
                                  seat25: FFAppState().seat25 == 1
                                      ? 2
                                      : FFAppState().seat25,
                                  seat26: FFAppState().seat26 == 1
                                      ? 2
                                      : FFAppState().seat26,
                                  seat30: FFAppState().seat30 == 1
                                      ? 2
                                      : FFAppState().seat30,
                                  seat31: FFAppState().seat31 == 1
                                      ? 2
                                      : FFAppState().seat31,
                                  seat32: FFAppState().seat32 == 1
                                      ? 2
                                      : FFAppState().seat32,
                                  seat33: FFAppState().seat33 == 1
                                      ? 2
                                      : FFAppState().seat33,
                                  seat34: FFAppState().seat34 == 1
                                      ? 2
                                      : FFAppState().seat34,
                                  seat35: FFAppState().seat35 == 1
                                      ? 2
                                      : FFAppState().seat35,
                                  seat36: FFAppState().seat36 == 1
                                      ? 2
                                      : FFAppState().seat36,
                                  seat40: FFAppState().seat40 == 1
                                      ? 2
                                      : FFAppState().seat40,
                                  seat41: FFAppState().seat41 == 1
                                      ? 2
                                      : FFAppState().seat41,
                                  seat42: FFAppState().seat42 == 1
                                      ? 2
                                      : FFAppState().seat42,
                                  seat43: FFAppState().seat43 == 1
                                      ? 2
                                      : FFAppState().seat43,
                                  seat44: FFAppState().seat44 == 1
                                      ? 2
                                      : FFAppState().seat44,
                                  seat45: FFAppState().seat45 == 1
                                      ? 2
                                      : FFAppState().seat45,
                                  seat46: FFAppState().seat46 == 1
                                      ? 2
                                      : FFAppState().seat46,
                                  seat50: FFAppState().seat50 == 1
                                      ? 2
                                      : FFAppState().seat50,
                                  seat51: FFAppState().seat51 == 1
                                      ? 2
                                      : FFAppState().seat51,
                                  seat52: FFAppState().seat52 == 1
                                      ? 2
                                      : FFAppState().seat52,
                                  seat53: FFAppState().seat53 == 1
                                      ? 2
                                      : FFAppState().seat53,
                                  seat54: FFAppState().seat54 == 1
                                      ? 2
                                      : FFAppState().seat54,
                                  seat55: FFAppState().seat55 == 1
                                      ? 2
                                      : FFAppState().seat55,
                                  seat56: FFAppState().seat56 == 1
                                      ? 2
                                      : FFAppState().seat56,
                                  seat07: FFAppState().seat07 == 1
                                      ? 2
                                      : FFAppState().seat07,
                                  seat08: FFAppState().seat08 == 1
                                      ? 2
                                      : FFAppState().seat08,
                                  seat09: FFAppState().seat09 == 1
                                      ? 2
                                      : FFAppState().seat09,
                                  seat17: FFAppState().seat17 == 1
                                      ? 2
                                      : FFAppState().seat17,
                                  seat18: FFAppState().seat18 == 1
                                      ? 2
                                      : FFAppState().seat18,
                                  seat19: FFAppState().seat19 == 1
                                      ? 2
                                      : FFAppState().seat19,
                                  seat27: FFAppState().seat27 == 1
                                      ? 2
                                      : FFAppState().seat27,
                                  seat28: FFAppState().seat28 == 1
                                      ? 2
                                      : FFAppState().seat28,
                                  seat29: FFAppState().seat29 == 1
                                      ? 2
                                      : FFAppState().seat29,
                                  seat37: FFAppState().seat37 == 1
                                      ? 2
                                      : FFAppState().seat37,
                                  seat38: FFAppState().seat38 == 1
                                      ? 2
                                      : FFAppState().seat38,
                                  seat39: FFAppState().seat39 == 1
                                      ? 2
                                      : FFAppState().seat39,
                                  seat47: FFAppState().seat47 == 1
                                      ? 2
                                      : FFAppState().seat47,
                                  seat48: FFAppState().seat48 == 1
                                      ? 2
                                      : FFAppState().seat48,
                                  seat49: FFAppState().seat49 == 1
                                      ? 2
                                      : FFAppState().seat49,
                                  seat57: FFAppState().seat57 == 1
                                      ? 2
                                      : FFAppState().seat57,
                                  seat58: FFAppState().seat58 == 1
                                      ? 2
                                      : FFAppState().seat58,
                                  seat59: FFAppState().seat59 == 1
                                      ? 2
                                      : FFAppState().seat59,
                                  seat60: FFAppState().seat60 == 1
                                      ? 2
                                      : FFAppState().seat60,
                                  seat61: FFAppState().seat61 == 1
                                      ? 2
                                      : FFAppState().seat61,
                                  seat62: FFAppState().seat62 == 1
                                      ? 2
                                      : FFAppState().seat62,
                                  seat63: FFAppState().seat63 == 1
                                      ? 2
                                      : FFAppState().seat63,
                                  seat64: FFAppState().seat64 == 1
                                      ? 2
                                      : FFAppState().seat64,
                                  seat65: FFAppState().seat65 == 1
                                      ? 2
                                      : FFAppState().seat65,
                                  seat66: FFAppState().seat66 == 1
                                      ? 2
                                      : FFAppState().seat66,
                                  seat67: FFAppState().seat67 == 1
                                      ? 2
                                      : FFAppState().seat67,
                                  seat68: FFAppState().seat68 == 1
                                      ? 2
                                      : FFAppState().seat68,
                                  seat69: FFAppState().seat69 == 1
                                      ? 2
                                      : FFAppState().seat69,
                                  seat70: FFAppState().seat70 == 1
                                      ? 2
                                      : FFAppState().seat70,
                                  seat71: FFAppState().seat71 == 1
                                      ? 2
                                      : FFAppState().seat71,
                                  seat72: FFAppState().seat72 == 1
                                      ? 2
                                      : FFAppState().seat72,
                                  seat73: FFAppState().seat73 == 1
                                      ? 2
                                      : FFAppState().seat73,
                                  seat74: FFAppState().seat74 == 1
                                      ? 2
                                      : FFAppState().seat74,
                                  seat75: FFAppState().seat75 == 1
                                      ? 2
                                      : FFAppState().seat75,
                                  seat76: FFAppState().seat76 == 1
                                      ? 2
                                      : FFAppState().seat76,
                                  seat77: FFAppState().seat77 == 1
                                      ? 2
                                      : FFAppState().seat77,
                                  seat78: FFAppState().seat78 == 1
                                      ? 2
                                      : FFAppState().seat78,
                                  seat79: FFAppState().seat79 == 1
                                      ? 2
                                      : FFAppState().seat79,
                                  seat80: FFAppState().seat80 == 1
                                      ? 2
                                      : FFAppState().seat80,
                                  seat81: FFAppState().seat81 == 1
                                      ? 2
                                      : FFAppState().seat81,
                                  seat82: FFAppState().seat82 == 1
                                      ? 2
                                      : FFAppState().seat82,
                                  seat83: FFAppState().seat83 == 1
                                      ? 2
                                      : FFAppState().seat83,
                                  seat84: FFAppState().seat84 == 1
                                      ? 2
                                      : FFAppState().seat84,
                                  seat85: FFAppState().seat85 == 1
                                      ? 2
                                      : FFAppState().seat85,
                                  seat86: FFAppState().seat86 == 1
                                      ? 2
                                      : FFAppState().seat86,
                                  seat87: FFAppState().seat87 == 1
                                      ? 2
                                      : FFAppState().seat87,
                                  seat88: FFAppState().seat88 == 1
                                      ? 2
                                      : FFAppState().seat88,
                                  seat89: FFAppState().seat89 == 1
                                      ? 2
                                      : FFAppState().seat89,
                                  seat90: FFAppState().seat90 == 1
                                      ? 2
                                      : FFAppState().seat90,
                                  seat91: FFAppState().seat91 == 1
                                      ? 2
                                      : FFAppState().seat91,
                                  seat92: FFAppState().seat92 == 1
                                      ? 2
                                      : FFAppState().seat92,
                                  seat93: FFAppState().seat93 == 1
                                      ? 2
                                      : FFAppState().seat93,
                                  seat94: FFAppState().seat94 == 1
                                      ? 2
                                      : FFAppState().seat94,
                                  seat95: FFAppState().seat95 == 1
                                      ? 2
                                      : FFAppState().seat95,
                                  seat96: FFAppState().seat96 == 1
                                      ? 2
                                      : FFAppState().seat96,
                                  seat97: FFAppState().seat97 == 1
                                      ? 2
                                      : FFAppState().seat97,
                                  seat98: FFAppState().seat98 == 1
                                      ? 2
                                      : FFAppState().seat98,
                                  seat99: FFAppState().seat99 == 1
                                      ? 2
                                      : FFAppState().seat99,
                                ));

                                var userTicketsRecordReference =
                                    UserTicketsRecord.collection.doc();
                                await userTicketsRecordReference.set({
                                  ...createUserTicketsRecordData(
                                    user: currentUserReference,
                                    title: widget.selectedMovie?.title,
                                    date: widget.selectedRepertory?.date,
                                    time: widget.selectedRepertoryDetails?.time,
                                    pricPerTicket: widget
                                        .selectedRepertory?.pricePerTicket,
                                    priceSum: widget.priceSum,
                                    poster: widget.posterChoice,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'selectedSeats':
                                          FFAppState().selectedSeats,
                                    },
                                  ),
                                });
                                _model.createdTicket =
                                    UserTicketsRecord.getDocumentFromData({
                                  ...createUserTicketsRecordData(
                                    user: currentUserReference,
                                    title: widget.selectedMovie?.title,
                                    date: widget.selectedRepertory?.date,
                                    time: widget.selectedRepertoryDetails?.time,
                                    pricPerTicket: widget
                                        .selectedRepertory?.pricePerTicket,
                                    priceSum: widget.priceSum,
                                    poster: widget.posterChoice,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'selectedSeats':
                                          FFAppState().selectedSeats,
                                    },
                                  ),
                                }, userTicketsRecordReference);
                                _shouldSetState = true;

                                await TransactionsRecord.collection
                                    .doc()
                                    .set(createTransactionsRecordData(
                                      user: currentUserReference,
                                      type: FFAppState().transactionTypeTicket,
                                      movieTitle: widget.selectedMovie?.title,
                                      date: getCurrentTimestamp,
                                      value: widget.priceSum,
                                      status: 'Transakcja powiodła się',
                                      ticketRef:
                                          _model.createdTicket?.reference,
                                      balanceBefore: valueOrDefault(
                                          currentUserDocument?.balance, 0.0),
                                      balanceAfter:
                                          functions.substractTwoNumbers(
                                              valueOrDefault(
                                                  currentUserDocument?.balance,
                                                  0.0),
                                              widget.priceSum!),
                                    ));

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'balance': FieldValue.increment(
                                          -(widget.priceSum!)),
                                    },
                                  ),
                                });
                                FFAppState().newTicket =
                                    _model.createdTicket?.reference;
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                        child: AlertDialog(
                                      title: Text('UDAŁO SIĘ'),
                                      content: Text(
                                          'Operacja przebiegła pomyślnie. Zapraszamy na seans.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Do zobaczenia'),
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
                                      type: FFAppState().transactionTypeTicket,
                                      movieTitle: widget.selectedMovie?.title,
                                      date: getCurrentTimestamp,
                                      value: widget.priceSum,
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
                              borderRadius: BorderRadius.circular(15.0),
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
      ),
    );
  }
}
