import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'seat_selection_page_model.dart';
export 'seat_selection_page_model.dart';

class SeatSelectionPageWidget extends StatefulWidget {
  const SeatSelectionPageWidget({
    Key? key,
    this.selectedMovie,
    this.selectedRepertory,
    this.selectedRepertoryDetails,
    this.posterChoice,
  }) : super(key: key);

  final MoviesRecord? selectedMovie;
  final RepertoryRecord? selectedRepertory;
  final RepertoryDetailsRecord? selectedRepertoryDetails;
  final String? posterChoice;

  @override
  _SeatSelectionPageWidgetState createState() =>
      _SeatSelectionPageWidgetState();
}

class _SeatSelectionPageWidgetState extends State<SeatSelectionPageWidget> {
  late SeatSelectionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeatSelectionPageModel());
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
              'Wybór miejsc',
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Text(
                                'Wybierz wolne miejsca siedzące',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 50.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              width: 300.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF808080),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Ekran',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                      color: Color(0x80000000),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat00 != 2) {
                                if (FFAppState().seat00 == 0) {
                                  FFAppState().update(() {
                                    FFAppState().seat00 = 1;
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k0]');
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().seat00 = 0;
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k0]');
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat00 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat00 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat01 != 2) {
                                if (FFAppState().seat01 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k1]');
                                    FFAppState().seat01 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k1]');
                                    FFAppState().seat01 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat01 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat01 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat02 != 2) {
                                if (FFAppState().seat02 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k2]');
                                    FFAppState().seat02 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k2]');
                                    FFAppState().seat02 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat02 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat02 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat03 != 2) {
                                if (FFAppState().seat03 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k3]');
                                    FFAppState().seat03 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k3]');
                                    FFAppState().seat03 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat03 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat03 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat04 != 2) {
                                if (FFAppState().seat04 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k4]');
                                    FFAppState().seat04 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k4]');
                                    FFAppState().seat04 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat04 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat04 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat05 != 2) {
                                if (FFAppState().seat05 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k5]');
                                    FFAppState().seat05 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k5]');
                                    FFAppState().seat05 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat05 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat05 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat06 != 2) {
                                if (FFAppState().seat06 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k6]');
                                    FFAppState().seat06 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k6]');
                                    FFAppState().seat06 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat06 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat06 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat07 != 2) {
                                if (FFAppState().seat07 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k7]');
                                    FFAppState().seat07 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k7]');
                                    FFAppState().seat07 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat07 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat07 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat08 != 2) {
                                if (FFAppState().seat08 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k8]');
                                    FFAppState().seat08 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k8]');
                                    FFAppState().seat08 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat08 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat08 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat09 != 2) {
                                if (FFAppState().seat09 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r0 ; k9]');
                                    FFAppState().seat09 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r0 ; k9]');
                                    FFAppState().seat09 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat09 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat09 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat10 != 2) {
                                if (FFAppState().seat10 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k0]');
                                    FFAppState().seat10 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k0]');
                                    FFAppState().seat10 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat10 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat10 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat11 != 2) {
                                if (FFAppState().seat11 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k1]');
                                    FFAppState().seat11 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k1]');
                                    FFAppState().seat11 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat11 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat11 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat12 != 2) {
                                if (FFAppState().seat12 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k2]');
                                    FFAppState().seat12 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k2]');
                                    FFAppState().seat12 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat12 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat12 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat13 != 2) {
                                if (FFAppState().seat13 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k3]');
                                    FFAppState().seat13 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k3]');
                                    FFAppState().seat13 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat13 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat13 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat14 != 2) {
                                if (FFAppState().seat14 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k4]');
                                    FFAppState().seat14 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k4]');
                                    FFAppState().seat14 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat14 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat14 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat15 != 2) {
                                if (FFAppState().seat15 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k5]');
                                    FFAppState().seat15 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k5]');
                                    FFAppState().seat15 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat15 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat15 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat16 != 2) {
                                if (FFAppState().seat16 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k6]');
                                    FFAppState().seat16 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k6]');
                                    FFAppState().seat16 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat16 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat16 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat17 != 2) {
                                if (FFAppState().seat17 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k7]');
                                    FFAppState().seat17 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k7]');
                                    FFAppState().seat17 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat17 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat17 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat18 != 2) {
                                if (FFAppState().seat18 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k8]');
                                    FFAppState().seat18 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k8]');
                                    FFAppState().seat18 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat18 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat18 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat19 != 2) {
                                if (FFAppState().seat19 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r1 ; k9]');
                                    FFAppState().seat19 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r1 ; k9]');
                                    FFAppState().seat19 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat19 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat19 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat20 != 2) {
                                if (FFAppState().seat20 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k0]');
                                    FFAppState().seat20 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k0]');
                                    FFAppState().seat20 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat20 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat20 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat21 != 2) {
                                if (FFAppState().seat21 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k1]');
                                    FFAppState().seat21 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k1]');
                                    FFAppState().seat21 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat21 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat21 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat22 != 2) {
                                if (FFAppState().seat22 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k2]');
                                    FFAppState().seat22 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k2]');
                                    FFAppState().seat22 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat22 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat22 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat23 != 2) {
                                if (FFAppState().seat23 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k3]');
                                    FFAppState().seat23 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k3]');
                                    FFAppState().seat23 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat23 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat23 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat24 != 2) {
                                if (FFAppState().seat24 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k4]');
                                    FFAppState().seat24 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k4]');
                                    FFAppState().seat24 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat24 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat24 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat25 != 2) {
                                if (FFAppState().seat25 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k5]');
                                    FFAppState().seat25 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k5]');
                                    FFAppState().seat25 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat25 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat25 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat26 != 2) {
                                if (FFAppState().seat26 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k6]');
                                    FFAppState().seat26 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k6]');
                                    FFAppState().seat26 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat26 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat26 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat27 != 2) {
                                if (FFAppState().seat27 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k7]');
                                    FFAppState().seat27 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k7]');
                                    FFAppState().seat27 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat27 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat27 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat28 != 2) {
                                if (FFAppState().seat28 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k8]');
                                    FFAppState().seat28 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k8]');
                                    FFAppState().seat28 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat28 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat28 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat29 != 2) {
                                if (FFAppState().seat29 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r2 ; k9]');
                                    FFAppState().seat29 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r2 ; k9]');
                                    FFAppState().seat29 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat29 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat29 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat30 != 2) {
                                if (FFAppState().seat30 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k0]');
                                    FFAppState().seat30 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k0]');
                                    FFAppState().seat30 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat30 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat30 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat31 != 2) {
                                if (FFAppState().seat31 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k1]');
                                    FFAppState().seat31 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k1]');
                                    FFAppState().seat31 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat31 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat31 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat32 != 2) {
                                if (FFAppState().seat32 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k2]');
                                    FFAppState().seat32 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k2]');
                                    FFAppState().seat32 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat32 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat32 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat33 != 2) {
                                if (FFAppState().seat33 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k3]');
                                    FFAppState().seat33 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k3]');
                                    FFAppState().seat33 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat33 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat33 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat34 != 2) {
                                if (FFAppState().seat34 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k4]');
                                    FFAppState().seat34 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k4]');
                                    FFAppState().seat34 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat34 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat34 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat35 != 2) {
                                if (FFAppState().seat35 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k5]');
                                    FFAppState().seat35 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k5]');
                                    FFAppState().seat35 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat35 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat35 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat36 != 2) {
                                if (FFAppState().seat36 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k6]');
                                    FFAppState().seat36 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k6]');
                                    FFAppState().seat36 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat36 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat36 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat37 != 2) {
                                if (FFAppState().seat37 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k7]');
                                    FFAppState().seat37 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k7]');
                                    FFAppState().seat37 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat37 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat37 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat38 != 2) {
                                if (FFAppState().seat38 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k8]');
                                    FFAppState().seat38 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k8]');
                                    FFAppState().seat38 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat38 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat38 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat39 != 2) {
                                if (FFAppState().seat39 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r3 ; k9]');
                                    FFAppState().seat39 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r3 ; k9]');
                                    FFAppState().seat39 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat39 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat39 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat40 != 2) {
                                if (FFAppState().seat40 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k0]');
                                    FFAppState().seat40 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k0]');
                                    FFAppState().seat40 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat40 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat40 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat41 != 2) {
                                if (FFAppState().seat41 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k1]');
                                    FFAppState().seat41 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k1]');
                                    FFAppState().seat41 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat41 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat41 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat42 != 2) {
                                if (FFAppState().seat42 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k2]');
                                    FFAppState().seat42 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k2]');
                                    FFAppState().seat42 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat42 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat42 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat43 != 2) {
                                if (FFAppState().seat43 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k3]');
                                    FFAppState().seat43 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k3]');
                                    FFAppState().seat43 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat43 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat43 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat44 != 2) {
                                if (FFAppState().seat44 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k4]');
                                    FFAppState().seat44 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k4]');
                                    FFAppState().seat44 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat44 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat44 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat45 != 2) {
                                if (FFAppState().seat45 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k5]');
                                    FFAppState().seat45 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k5]');
                                    FFAppState().seat45 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat45 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat45 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat46 != 2) {
                                if (FFAppState().seat46 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k6]');
                                    FFAppState().seat46 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k6]');
                                    FFAppState().seat46 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat46 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat46 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat47 != 2) {
                                if (FFAppState().seat47 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k7]');
                                    FFAppState().seat47 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k7]');
                                    FFAppState().seat47 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat47 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat47 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat48 != 2) {
                                if (FFAppState().seat48 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k8]');
                                    FFAppState().seat48 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k8]');
                                    FFAppState().seat48 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat48 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat48 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat49 != 2) {
                                if (FFAppState().seat49 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r4 ; k9]');
                                    FFAppState().seat49 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r4 ; k9]');
                                    FFAppState().seat49 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat49 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat49 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat50 != 2) {
                                if (FFAppState().seat50 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k0]');
                                    FFAppState().seat50 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k0]');
                                    FFAppState().seat50 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat50 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat50 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat51 != 2) {
                                if (FFAppState().seat51 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k1]');
                                    FFAppState().seat51 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k1]');
                                    FFAppState().seat51 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat51 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat51 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat52 != 2) {
                                if (FFAppState().seat52 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k2]');
                                    FFAppState().seat52 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k2]');
                                    FFAppState().seat52 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat52 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat52 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat53 != 2) {
                                if (FFAppState().seat53 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k3]');
                                    FFAppState().seat53 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k3]');
                                    FFAppState().seat53 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat53 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat53 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat54 != 2) {
                                if (FFAppState().seat54 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k4]');
                                    FFAppState().seat54 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k4]');
                                    FFAppState().seat54 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat54 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat54 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat55 != 2) {
                                if (FFAppState().seat55 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k5]');
                                    FFAppState().seat55 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k5]');
                                    FFAppState().seat55 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat55 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat55 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat56 != 2) {
                                if (FFAppState().seat56 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k6]');
                                    FFAppState().seat56 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k6]');
                                    FFAppState().seat56 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat56 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat56 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat57 != 2) {
                                if (FFAppState().seat57 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k7]');
                                    FFAppState().seat57 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k7]');
                                    FFAppState().seat57 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat57 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat57 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat58 != 2) {
                                if (FFAppState().seat58 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k8]');
                                    FFAppState().seat58 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k8]');
                                    FFAppState().seat58 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat58 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat58 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat59 != 2) {
                                if (FFAppState().seat59 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r5 ; k9]');
                                    FFAppState().seat59 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r5 ; k9]');
                                    FFAppState().seat59 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat59 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat59 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat60 != 2) {
                                if (FFAppState().seat60 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k0]');
                                    FFAppState().seat60 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k0]');
                                    FFAppState().seat60 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat60 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat60 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat61 != 2) {
                                if (FFAppState().seat61 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k1]');
                                    FFAppState().seat61 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k1]');
                                    FFAppState().seat61 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat61 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat61 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat62 != 2) {
                                if (FFAppState().seat62 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k2]');
                                    FFAppState().seat62 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k2]');
                                    FFAppState().seat62 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat62 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat62 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat63 != 2) {
                                if (FFAppState().seat63 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k3]');
                                    FFAppState().seat63 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k3]');
                                    FFAppState().seat63 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat63 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat63 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat64 != 2) {
                                if (FFAppState().seat64 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k4]');
                                    FFAppState().seat64 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k4]');
                                    FFAppState().seat64 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat64 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat64 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat65 != 2) {
                                if (FFAppState().seat65 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k5]');
                                    FFAppState().seat65 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k5]');
                                    FFAppState().seat65 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat65 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat65 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat66 != 2) {
                                if (FFAppState().seat66 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k6]');
                                    FFAppState().seat66 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k6]');
                                    FFAppState().seat66 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat66 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat66 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat67 != 2) {
                                if (FFAppState().seat67 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k7]');
                                    FFAppState().seat67 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k7]');
                                    FFAppState().seat67 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat67 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat67 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat68 != 2) {
                                if (FFAppState().seat68 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k8]');
                                    FFAppState().seat68 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k8]');
                                    FFAppState().seat68 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat68 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat68 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat69 != 2) {
                                if (FFAppState().seat69 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r6 ; k9]');
                                    FFAppState().seat69 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r6 ; k9]');
                                    FFAppState().seat69 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat69 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat69 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat70 != 2) {
                                if (FFAppState().seat70 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k0]');
                                    FFAppState().seat70 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k0]');
                                    FFAppState().seat70 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat70 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat70 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat71 != 2) {
                                if (FFAppState().seat71 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k1]');
                                    FFAppState().seat71 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k1]');
                                    FFAppState().seat71 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat71 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat71 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat72 != 2) {
                                if (FFAppState().seat72 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k2]');
                                    FFAppState().seat72 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k2]');
                                    FFAppState().seat72 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat72 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat72 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat73 != 2) {
                                if (FFAppState().seat73 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k3]');
                                    FFAppState().seat73 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k3]');
                                    FFAppState().seat73 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat73 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat73 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat74 != 2) {
                                if (FFAppState().seat74 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k4]');
                                    FFAppState().seat74 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k4]');
                                    FFAppState().seat74 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat74 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat74 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat75 != 2) {
                                if (FFAppState().seat75 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k5]');
                                    FFAppState().seat75 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k5]');
                                    FFAppState().seat75 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat75 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat75 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat76 != 2) {
                                if (FFAppState().seat76 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k6]');
                                    FFAppState().seat76 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k6]');
                                    FFAppState().seat76 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat76 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat76 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat77 != 2) {
                                if (FFAppState().seat77 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k7]');
                                    FFAppState().seat77 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k7]');
                                    FFAppState().seat77 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat77 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat77 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat78 != 2) {
                                if (FFAppState().seat78 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k8]');
                                    FFAppState().seat78 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k8]');
                                    FFAppState().seat78 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat78 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat78 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat79 != 2) {
                                if (FFAppState().seat79 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r7 ; k9]');
                                    FFAppState().seat79 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r7 ; k9]');
                                    FFAppState().seat79 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat79 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat79 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat80 != 2) {
                                if (FFAppState().seat80 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k0]');
                                    FFAppState().seat80 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k0]');
                                    FFAppState().seat80 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat80 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat80 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat81 != 2) {
                                if (FFAppState().seat81 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k1]');
                                    FFAppState().seat81 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k1]');
                                    FFAppState().seat81 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat81 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat81 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat82 != 2) {
                                if (FFAppState().seat82 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k2]');
                                    FFAppState().seat82 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k2]');
                                    FFAppState().seat82 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat82 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat82 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat83 != 2) {
                                if (FFAppState().seat83 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k3]');
                                    FFAppState().seat83 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k3]');
                                    FFAppState().seat83 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat83 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat83 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat84 != 2) {
                                if (FFAppState().seat84 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k4]');
                                    FFAppState().seat84 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k4]');
                                    FFAppState().seat84 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat84 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat84 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat85 != 2) {
                                if (FFAppState().seat85 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k5]');
                                    FFAppState().seat85 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k5]');
                                    FFAppState().seat85 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat85 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat85 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat86 != 2) {
                                if (FFAppState().seat86 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k6]');
                                    FFAppState().seat86 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k6]');
                                    FFAppState().seat86 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat86 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat86 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat87 != 2) {
                                if (FFAppState().seat87 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k7]');
                                    FFAppState().seat87 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k7]');
                                    FFAppState().seat87 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat87 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat87 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat88 != 2) {
                                if (FFAppState().seat88 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k8]');
                                    FFAppState().seat88 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k8]');
                                    FFAppState().seat88 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat88 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat88 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat89 != 2) {
                                if (FFAppState().seat89 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r8 ; k9]');
                                    FFAppState().seat89 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r8 ; k9]');
                                    FFAppState().seat89 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat89 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat89 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat90 != 2) {
                                if (FFAppState().seat90 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k0]');
                                    FFAppState().seat90 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k0]');
                                    FFAppState().seat90 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat90 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat90 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat91 != 2) {
                                if (FFAppState().seat91 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k1]');
                                    FFAppState().seat91 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k1]');
                                    FFAppState().seat91 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat91 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat91 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat92 != 2) {
                                if (FFAppState().seat92 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k2]');
                                    FFAppState().seat92 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k2]');
                                    FFAppState().seat92 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat92 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat92 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat93 != 2) {
                                if (FFAppState().seat93 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k3]');
                                    FFAppState().seat93 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k3]');
                                    FFAppState().seat93 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat93 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat93 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat94 != 2) {
                                if (FFAppState().seat94 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k4]');
                                    FFAppState().seat94 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k4]');
                                    FFAppState().seat94 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat94 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat94 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat95 != 2) {
                                if (FFAppState().seat95 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k5]');
                                    FFAppState().seat95 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k5]');
                                    FFAppState().seat95 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat95 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat95 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat96 != 2) {
                                if (FFAppState().seat96 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k6]');
                                    FFAppState().seat96 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k6]');
                                    FFAppState().seat96 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat96 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat96 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat97 != 2) {
                                if (FFAppState().seat97 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k7]');
                                    FFAppState().seat97 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k7]');
                                    FFAppState().seat97 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat97 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat97 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat98 != 2) {
                                if (FFAppState().seat98 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k8]');
                                    FFAppState().seat98 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k8]');
                                    FFAppState().seat98 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat98 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat98 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().seat99 != 2) {
                                if (FFAppState().seat99 == 0) {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .addToSelectedSeats('[r9 ; k9]');
                                    FFAppState().seat99 = 1;
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromSelectedSeats('[r9 ; k9]');
                                    FFAppState().seat99 = 0;
                                  });
                                }
                              }
                            },
                            child: Icon(
                              Icons.event_seat,
                              color: valueOrDefault<Color>(
                                () {
                                  if (FFAppState().seat99 == 0) {
                                    return Colors.black;
                                  } else if (FFAppState().seat99 == 1) {
                                    return Color(0xFF59E009);
                                  } else {
                                    return Color(0xFFEF0303);
                                  }
                                }(),
                                Color(0xFFDA13DA),
                              ),
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2.0,
                      color: Color(0x80000000),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 30.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Wybrane miejsca:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              if (FFAppState().selectedSeats.length == 0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                        child: AlertDialog(
                                      title: Text('UWAGA'),
                                      content: Text(
                                          'Proszę wybrać przynajmniej jedno miejsce siedzące!'),
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
                              } else {
                                context.pushNamed(
                                  'TicketTransactionSummay',
                                  queryParameters: {
                                    'selectedMovie': serializeParam(
                                      widget.selectedMovie,
                                      ParamType.Document,
                                    ),
                                    'selectedRepertory': serializeParam(
                                      widget.selectedRepertory,
                                      ParamType.Document,
                                    ),
                                    'selectedRepertoryDetails': serializeParam(
                                      widget.selectedRepertoryDetails,
                                      ParamType.Document,
                                    ),
                                    'posterChoice': serializeParam(
                                      widget.posterChoice,
                                      ParamType.String,
                                    ),
                                    'priceSum': serializeParam(
                                      functions.calculateFinalPrice(
                                          FFAppState().selectedSeats.length,
                                          widget.selectedRepertory!
                                              .pricePerTicket,
                                          widget.posterChoice!),
                                      ParamType.double,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'selectedMovie': widget.selectedMovie,
                                    'selectedRepertory':
                                        widget.selectedRepertory,
                                    'selectedRepertoryDetails':
                                        widget.selectedRepertoryDetails,
                                  },
                                );
                              }
                            },
                            text: 'DO PLATNOŚCI',
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
      ),
    );
  }
}
