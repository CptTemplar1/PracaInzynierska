import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ticket_poster_page_model.dart';
export 'ticket_poster_page_model.dart';

class TicketPosterPageWidget extends StatefulWidget {
  const TicketPosterPageWidget({
    Key? key,
    this.selectedMovie,
    this.selectedRepertory,
    this.selectedHour,
  }) : super(key: key);

  final MoviesRecord? selectedMovie;
  final RepertoryRecord? selectedRepertory;
  final String? selectedHour;

  @override
  _TicketPosterPageWidgetState createState() => _TicketPosterPageWidgetState();
}

class _TicketPosterPageWidgetState extends State<TicketPosterPageWidget> {
  late TicketPosterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketPosterPageModel());
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

    return StreamBuilder<List<RepertoryDetailsRecord>>(
      stream: queryRepertoryDetailsRecord(
        queryBuilder: (repertoryDetailsRecord) => repertoryDetailsRecord.where(
          'time',
          isEqualTo: widget.selectedHour,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<RepertoryDetailsRecord>
            ticketPosterPageRepertoryDetailsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final ticketPosterPageRepertoryDetailsRecord =
            ticketPosterPageRepertoryDetailsRecordList.isNotEmpty
                ? ticketPosterPageRepertoryDetailsRecordList.first
                : null;
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
                    context.pushNamed('MainPage');
                  },
                ),
                title: Text(
                  'Plakat',
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
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Czy chcesz zamówić poniższy plakat wraz z biletem?',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    widget.selectedMovie!.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 40.0, 10.0, 0.0),
                          child: Text(
                            'Zamówienie powyższego plakatu w formie papierowej wraz z biletem wiąże się z dodatkową opłatą w wysokości +15 PLN.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 40.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowRadioButton(
                                options: ['TAK', 'NIE'].toList(),
                                onChanged: (val) => setState(() {}),
                                controller:
                                    _model.radioButtonValueController ??=
                                        FormFieldController<String>(null),
                                optionHeight: 25.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.horizontal,
                                radioButtonColor: Colors.blue,
                                inactiveRadioButtonColor: Color(0x8A000000),
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.center,
                                verticalAlignment: WrapCrossAlignment.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 50.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.radioButtonValue == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Proszę wybrać którąś z powyższych opcji',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    return;
                                  }
                                  FFAppState().update(() {
                                    FFAppState().seat00 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat00;
                                    FFAppState().selectedSeats = [];
                                    FFAppState().seat01 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat01;
                                    FFAppState().seat02 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat02;
                                    FFAppState().seat03 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat03;
                                    FFAppState().seat04 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat04;
                                    FFAppState().seat05 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat05;
                                    FFAppState().seat06 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat06;
                                    FFAppState().seat10 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat10;
                                    FFAppState().seat11 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat11;
                                    FFAppState().seat12 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat12;
                                    FFAppState().seat13 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat13;
                                    FFAppState().seat14 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat14;
                                    FFAppState().seat15 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat15;
                                    FFAppState().seat16 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat16;
                                    FFAppState().seat20 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat20;
                                    FFAppState().seat21 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat21;
                                    FFAppState().seat22 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat22;
                                    FFAppState().seat23 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat23;
                                    FFAppState().seat24 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat24;
                                    FFAppState().seat25 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat25;
                                    FFAppState().seat26 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat26;
                                    FFAppState().seat30 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat30;
                                    FFAppState().seat31 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat31;
                                    FFAppState().seat32 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat32;
                                    FFAppState().seat33 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat33;
                                    FFAppState().seat34 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat34;
                                    FFAppState().seat35 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat35;
                                    FFAppState().seat36 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat36;
                                    FFAppState().seat40 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat40;
                                    FFAppState().seat41 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat41;
                                    FFAppState().seat42 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat42;
                                    FFAppState().seat43 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat43;
                                    FFAppState().seat44 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat44;
                                    FFAppState().seat45 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat45;
                                    FFAppState().seat46 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat46;
                                    FFAppState().seat50 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat50;
                                    FFAppState().seat51 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat51;
                                    FFAppState().seat52 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat52;
                                    FFAppState().seat53 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat53;
                                    FFAppState().seat54 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat54;
                                    FFAppState().seat55 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat55;
                                    FFAppState().seat56 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat56;
                                    FFAppState().seat07 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat07;
                                    FFAppState().seat08 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat08;
                                    FFAppState().seat09 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat09;
                                    FFAppState().seat17 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat17;
                                    FFAppState().seat18 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat18;
                                    FFAppState().seat19 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat19;
                                    FFAppState().seat27 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat27;
                                    FFAppState().seat28 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat28;
                                    FFAppState().seat29 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat29;
                                    FFAppState().seat37 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat37;
                                    FFAppState().seat38 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat38;
                                    FFAppState().seat39 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat39;
                                    FFAppState().seat47 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat47;
                                    FFAppState().seat48 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat48;
                                    FFAppState().seat49 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat49;
                                    FFAppState().seat57 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat57;
                                    FFAppState().seat58 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat58;
                                    FFAppState().seat59 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat59;
                                    FFAppState().seat60 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat60;
                                    FFAppState().seat61 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat61;
                                    FFAppState().seat62 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat62;
                                    FFAppState().seat63 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat63;
                                    FFAppState().seat64 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat64;
                                    FFAppState().seat65 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat65;
                                    FFAppState().seat66 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat66;
                                    FFAppState().seat67 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat67;
                                    FFAppState().seat68 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat68;
                                    FFAppState().seat69 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat69;
                                    FFAppState().seat70 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat70;
                                    FFAppState().seat71 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat71;
                                    FFAppState().seat72 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat72;
                                    FFAppState().seat73 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat73;
                                    FFAppState().seat74 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat74;
                                    FFAppState().seat75 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat75;
                                    FFAppState().seat76 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat76;
                                    FFAppState().seat77 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat77;
                                    FFAppState().seat78 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat78;
                                    FFAppState().seat79 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat79;
                                    FFAppState().seat80 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat80;
                                    FFAppState().seat81 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat81;
                                    FFAppState().seat82 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat82;
                                    FFAppState().seat83 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat83;
                                    FFAppState().seat84 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat84;
                                    FFAppState().seat85 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat85;
                                    FFAppState().seat86 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat86;
                                    FFAppState().seat87 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat87;
                                    FFAppState().seat88 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat88;
                                    FFAppState().seat89 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat89;
                                    FFAppState().seat90 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat90;
                                    FFAppState().seat91 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat91;
                                    FFAppState().seat92 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat92;
                                    FFAppState().seat93 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat93;
                                    FFAppState().seat94 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat94;
                                    FFAppState().seat95 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat95;
                                    FFAppState().seat96 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat96;
                                    FFAppState().seat97 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat97;
                                    FFAppState().seat98 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat98;
                                    FFAppState().seat99 =
                                        ticketPosterPageRepertoryDetailsRecord!
                                            .seat99;
                                  });

                                  context.pushNamed(
                                    'SeatSelectionPage',
                                    queryParameters: {
                                      'selectedMovie': serializeParam(
                                        widget.selectedMovie,
                                        ParamType.Document,
                                      ),
                                      'selectedRepertory': serializeParam(
                                        widget.selectedRepertory,
                                        ParamType.Document,
                                      ),
                                      'selectedRepertoryDetails':
                                          serializeParam(
                                        ticketPosterPageRepertoryDetailsRecord,
                                        ParamType.Document,
                                      ),
                                      'posterChoice': serializeParam(
                                        _model.radioButtonValue,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'selectedMovie': widget.selectedMovie,
                                      'selectedRepertory':
                                          widget.selectedRepertory,
                                      'selectedRepertoryDetails':
                                          ticketPosterPageRepertoryDetailsRecord,
                                    },
                                  );
                                },
                                text: 'DALEJ',
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
      },
    );
  }
}
