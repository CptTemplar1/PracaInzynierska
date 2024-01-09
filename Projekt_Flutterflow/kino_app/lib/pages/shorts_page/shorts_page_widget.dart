import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_comment_text_field/add_comment_text_field_widget.dart';
import '/components/empty_list_widgets/empty_comments/empty_comments_widget.dart';
import '/components/k_k_tube_player_header1/k_k_tube_player_header1_widget.dart';
import '/components/k_k_tube_player_header2/k_k_tube_player_header2_widget.dart';
import '/components/k_k_tube_player_header3_no_actions/k_k_tube_player_header3_no_actions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'shorts_page_model.dart';
export 'shorts_page_model.dart';

class ShortsPageWidget extends StatefulWidget {
  const ShortsPageWidget({Key? key}) : super(key: key);

  @override
  _ShortsPageWidgetState createState() => _ShortsPageWidgetState();
}

class _ShortsPageWidgetState extends State<ShortsPageWidget> {
  late ShortsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShortsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.hasKKTubeAccount, false) ==
          false) {
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                    child: AlertDialog(
                  title: Text('UWAGA'),
                  content: Text(
                      'Aby uzyskać dostęp do tej sekcji wymagane jest konto KK-Tube. Czy chcesz utworzyć swoje konto?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, false),
                      child: Text('NIE'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext, true),
                      child: Text('TAK'),
                    ),
                  ],
                ));
              },
            ) ??
            false;
        if (confirmDialogResponse) {
          context.goNamed('CreateAccountPage');
        } else {
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed('MainPage');
        }

        return;
      } else {
        return;
      }
    });
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
          backgroundColor: Colors.black,
          drawer: WebViewAware(
              child: Drawer(
            elevation: 16.0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF27325A),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: 100.0,
                                  height: 100.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/user_avatar.png?alt=media&token=8a0e52ab-15dc-40aa-8696-1909ebd7f273',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault(
                                          currentUserDocument?.firstName, ''),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault(
                                          currentUserDocument?.lastName, ''),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'FUNKCJONALNOŚĆ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 20.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('MainPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.local_movies,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'REPERTUAR/FILMY',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('ShoppingTransactionPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.work_history,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'HISTORIA ZAKUPÓW',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('DiscountPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.wallet,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'DOŁADOWANIA',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('ShortsPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.app_shortcut,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'KKTUBE SHORTS',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('AllChatsPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.wechat_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'CZAT',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 10.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'MOJE KONTO',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.hasKKTubeAccount,
                                    false) ==
                                true)
                              AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('YourAccountPage');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 15.0, 0.0),
                                        child: Icon(
                                          Icons.account_circle_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 25.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'TWOJE KONTO KKTUBE',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('PersonalDataPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.person,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'DANE OSOBOWE',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('PasswordChangePage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.password_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'ZMIANA HASŁA',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('DeleteAccountPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.delete_forever_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'USUŃ KONTO',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 10.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'INNE',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('HelloPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.manage_accounts,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'O MNIE',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('HelpPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Icon(
                                      Icons.help,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 25.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'HELP',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .addToStart(SizedBox(height: 10.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth('LoginPage', context.mounted);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.login,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 35.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'WYLOGUJ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 16.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
          appBar: AppBar(
            backgroundColor: Color(0xFF27325A),
            automaticallyImplyLeading: true,
            title: Text(
              'KK Tube',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed('YourAccountPage');
                },
                child: Icon(
                  Icons.person_rounded,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  size: 45.0,
                ),
              ),
            ],
            centerTitle: true,
            elevation: 4.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FlipCard(
                    fill: Fill.fillBack,
                    direction: FlipDirection.HORIZONTAL,
                    speed: 400,
                    front: StreamBuilder<List<KkTubeVideosRecord>>(
                      stream: queryKkTubeVideosRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<KkTubeVideosRecord>
                            containerKkTubeVideosRecordList = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              wrapWithModel(
                                model: _model.kKTubePlayerHeader1Model,
                                updateCallback: () => setState(() {}),
                                child: KKTubePlayerHeader1Widget(
                                  documentList: containerKkTubeVideosRecordList
                                      .map((e) => e.reference)
                                      .toList(),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child:
                                      // Wygenerowanie dynamicznych dzieci pageView w oparciu o AppState z referencjami do filmików w losowej kolejności.
                                      Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final videosPageView = FFAppState()
                                            .RandomizedKKTubeVideos
                                            .toList();
                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: PageView.builder(
                                            controller: _model
                                                    .pageViewController1 ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        videosPageView.length -
                                                            1)),
                                            scrollDirection: Axis.vertical,
                                            itemCount: videosPageView.length,
                                            itemBuilder:
                                                (context, videosPageViewIndex) {
                                              final videosPageViewItem =
                                                  videosPageView[
                                                      videosPageViewIndex];
                                              return
                                                  // Odzyskanie dokumentu filmiku (kkTubeVideo) z referencji, na bazie której tworzone jest dziecko (podstrona) PageView.
                                                  StreamBuilder<
                                                      KkTubeVideosRecord>(
                                                stream: KkTubeVideosRecord
                                                    .getDocument(
                                                        videosPageViewItem),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final columnKkTubeVideosRecord =
                                                      snapshot.data!;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowVideoPlayer(
                                                                path:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  columnKkTubeVideosRecord
                                                                      .video,
                                                                  'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/defaultVideo.mp4?alt=media&token=12783943-3f2e-42cc-914b-0e7355572ab2',
                                                                ),
                                                                videoType:
                                                                    VideoType
                                                                        .network,
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                autoPlay: false,
                                                                looping: true,
                                                                showControls:
                                                                    true,
                                                                allowFullScreen:
                                                                    false,
                                                                allowPlaybackSpeedMenu:
                                                                    false,
                                                                lazyLoad: true,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      0.45),
                                                              child: Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final thumbsUpElement =
                                                                        currentUserReference;
                                                                    final thumbsUpUpdate = columnKkTubeVideosRecord
                                                                            .thumbsUp
                                                                            .contains(
                                                                                thumbsUpElement)
                                                                        ? FieldValue
                                                                            .arrayRemove([
                                                                            thumbsUpElement
                                                                          ])
                                                                        : FieldValue
                                                                            .arrayUnion([
                                                                            thumbsUpElement
                                                                          ]);
                                                                    await columnKkTubeVideosRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'thumbsUp':
                                                                              thumbsUpUpdate,
                                                                        },
                                                                      ),
                                                                    });

                                                                    await videosPageViewItem
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'thumbsDown':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  value: columnKkTubeVideosRecord
                                                                      .thumbsUp
                                                                      .contains(
                                                                          currentUserReference),
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .thumb_up,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 45.0,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .thumb_up_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.95,
                                                                      0.75),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .CommentsSectionVisibility =
                                                                        true;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .insert_comment_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      KkTubeAccountRecord>>(
                                                                stream:
                                                                    queryKkTubeAccountRecord(
                                                                  queryBuilder:
                                                                      (kkTubeAccountRecord) =>
                                                                          kkTubeAccountRecord
                                                                              .where(
                                                                    'UserRef',
                                                                    isEqualTo:
                                                                        columnKkTubeVideosRecord
                                                                            .user,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<KkTubeAccountRecord>
                                                                      containerKkTubeAccountRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final containerKkTubeAccountRecord = containerKkTubeAccountRecordList
                                                                          .isNotEmpty
                                                                      ? containerKkTubeAccountRecordList
                                                                          .first
                                                                      : null;
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              UsersRecord>>(
                                                                        stream:
                                                                            queryUsersRecord(
                                                                          queryBuilder: (usersRecord) =>
                                                                              usersRecord.where(
                                                                            'uid',
                                                                            isEqualTo:
                                                                                columnKkTubeVideosRecord.user?.id,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<UsersRecord>
                                                                              rowUsersRecordList =
                                                                              snapshot.data!;
                                                                          final rowUsersRecord = rowUsersRecordList.isNotEmpty
                                                                              ? rowUsersRecordList.first
                                                                              : null;
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    'UserAccountPage',
                                                                                    queryParameters: {
                                                                                      'selectedUser': serializeParam(
                                                                                        rowUsersRecord,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                      'selectedUserKKTubeAccount': serializeParam(
                                                                                        containerKkTubeAccountRecord,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'selectedUser': rowUsersRecord,
                                                                                      'selectedUserKKTubeAccount': containerKkTubeAccountRecord,
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  width: 60.0,
                                                                                  height: 60.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    valueOrDefault<String>(
                                                                                      rowUsersRecord?.photoUrl,
                                                                                      'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/user_avatar.png?alt=media&token=8a0e52ab-15dc-40aa-8696-1909ebd7f273',
                                                                                    ),
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      containerKkTubeAccountRecord?.nick,
                                                                                      'Wiesiek',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Colors.white,
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 60.0,
                                                                                height: 60.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: ToggleIcon(
                                                                                  onPressed: () async {
                                                                                    final subscribedByElement = currentUserReference;
                                                                                    final subscribedByUpdate = containerKkTubeAccountRecord!.subscribedBy.contains(subscribedByElement)
                                                                                        ? FieldValue.arrayRemove([
                                                                                            subscribedByElement
                                                                                          ])
                                                                                        : FieldValue.arrayUnion([
                                                                                            subscribedByElement
                                                                                          ]);
                                                                                    await containerKkTubeAccountRecord!.reference.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'SubscribedBy': subscribedByUpdate,
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  },
                                                                                  value: containerKkTubeAccountRecord!.subscribedBy.contains(currentUserReference),
                                                                                  onIcon: Icon(
                                                                                    Icons.subscriptions,
                                                                                    color: Color(0xFFFF0000),
                                                                                    size: 45.0,
                                                                                  ),
                                                                                  offIcon: Icon(
                                                                                    Icons.subscriptions_outlined,
                                                                                    color: Color(0xFFFF0000),
                                                                                    size: 45.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          columnKkTubeVideosRecord
                                                                              .title,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Colors.white,
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      0.55),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  columnKkTubeVideosRecord
                                                                      .thumbsUp
                                                                      .length
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      0.25),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  columnKkTubeVideosRecord
                                                                      .thumbsDown
                                                                      .length
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      0.15),
                                                              child: Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final thumbsDownElement =
                                                                        currentUserReference;
                                                                    final thumbsDownUpdate = columnKkTubeVideosRecord
                                                                            .thumbsDown
                                                                            .contains(
                                                                                thumbsDownElement)
                                                                        ? FieldValue
                                                                            .arrayRemove([
                                                                            thumbsDownElement
                                                                          ])
                                                                        : FieldValue
                                                                            .arrayUnion([
                                                                            thumbsDownElement
                                                                          ]);
                                                                    await columnKkTubeVideosRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'thumbsDown':
                                                                              thumbsDownUpdate,
                                                                        },
                                                                      ),
                                                                    });

                                                                    await videosPageViewItem
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'thumbsUp':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  value: columnKkTubeVideosRecord
                                                                      .thumbsDown
                                                                      .contains(
                                                                          currentUserReference),
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .thumb_down,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 45.0,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .thumb_down_outlined,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (FFAppState()
                                                                    .CommentsSectionVisibility ==
                                                                true)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        KkTubeVideoCommentRecord>>(
                                                                  stream:
                                                                      queryKkTubeVideoCommentRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<KkTubeVideoCommentRecord>
                                                                        containerKkTubeVideoCommentRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.7,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(25.0),
                                                                          topRight:
                                                                              Radius.circular(25.0),
                                                                        ),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                15.0,
                                                                                15.0,
                                                                                10.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    'KOMENTARZE',
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    setState(() {
                                                                                      FFAppState().CommentsSectionVisibility = false;
                                                                                    });
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.exit_to_app_rounded,
                                                                                    color: Colors.black,
                                                                                    size: 35.0,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                3.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                0.0,
                                                                                15.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                AuthUserStreamWidget(
                                                                                  builder: (context) => Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        currentUserPhoto,
                                                                                        'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/user_avatar.png?alt=media&token=8a0e52ab-15dc-40aa-8696-1909ebd7f273',
                                                                                      ),
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: wrapWithModel(
                                                                                    model: _model.addCommentTextFieldModels1.getModel(
                                                                                      videosPageViewIndex.toString(),
                                                                                      videosPageViewIndex,
                                                                                    ),
                                                                                    updateCallback: () => setState(() {}),
                                                                                    child: AddCommentTextFieldWidget(
                                                                                      key: Key(
                                                                                        'Key3ct_${videosPageViewIndex.toString()}',
                                                                                      ),
                                                                                      videoRef: columnKkTubeVideosRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                3.0,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final commentsListDynamic = containerKkTubeVideoCommentRecordList.where((e) => e.videoRef == columnKkTubeVideosRecord.reference).toList();
                                                                                if (commentsListDynamic.isEmpty) {
                                                                                  return Center(
                                                                                    child: EmptyCommentsWidget(),
                                                                                  );
                                                                                }
                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: commentsListDynamic.length,
                                                                                  itemBuilder: (context, commentsListDynamicIndex) {
                                                                                    final commentsListDynamicItem = commentsListDynamic[commentsListDynamicIndex];
                                                                                    return Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                      child: StreamBuilder<List<UsersRecord>>(
                                                                                        stream: queryUsersRecord(
                                                                                          queryBuilder: (usersRecord) => usersRecord.where(
                                                                                            'uid',
                                                                                            isEqualTo: commentsListDynamicItem.user?.id,
                                                                                          ),
                                                                                          singleRecord: true,
                                                                                        ),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                child: CircularProgressIndicator(
                                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                          final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;
                                                                                          return Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                              child: StreamBuilder<List<KkTubeAccountRecord>>(
                                                                                                stream: queryKkTubeAccountRecord(
                                                                                                  queryBuilder: (kkTubeAccountRecord) => kkTubeAccountRecord.where(
                                                                                                    'UserRef',
                                                                                                    isEqualTo: commentsListDynamicItem.user,
                                                                                                  ),
                                                                                                  singleRecord: true,
                                                                                                ),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 50.0,
                                                                                                        height: 50.0,
                                                                                                        child: CircularProgressIndicator(
                                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<KkTubeAccountRecord> rowKkTubeAccountRecordList = snapshot.data!;
                                                                                                  final rowKkTubeAccountRecord = rowKkTubeAccountRecordList.isNotEmpty ? rowKkTubeAccountRecordList.first : null;
                                                                                                  return InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onLongPress: () async {
                                                                                                      if (commentsListDynamicItem.user == currentUserReference) {
                                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return WebViewAware(
                                                                                                                    child: AlertDialog(
                                                                                                                  title: Text('UWAGA'),
                                                                                                                  content: Text('Czy na pewno chcesz usunąć ten komentarz?'),
                                                                                                                  actions: [
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                      child: Text('NIE'),
                                                                                                                    ),
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                      child: Text('TAK'),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ));
                                                                                                              },
                                                                                                            ) ??
                                                                                                            false;
                                                                                                        if (confirmDialogResponse) {
                                                                                                          await commentsListDynamicItem.reference.delete();
                                                                                                          return;
                                                                                                        } else {
                                                                                                          return;
                                                                                                        }
                                                                                                      } else {
                                                                                                        return;
                                                                                                      }
                                                                                                    },
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 50.0,
                                                                                                          height: 50.0,
                                                                                                          clipBehavior: Clip.antiAlias,
                                                                                                          decoration: BoxDecoration(
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: Image.network(
                                                                                                            valueOrDefault<String>(
                                                                                                              containerUsersRecord?.photoUrl,
                                                                                                              'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/user_avatar.png?alt=media&token=8a0e52ab-15dc-40aa-8696-1909ebd7f273',
                                                                                                            ),
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  '${rowKkTubeAccountRecord?.nick} - ${dateTimeFormat('d/M/y', commentsListDynamicItem.postDate)}',
                                                                                                                  textAlign: TextAlign.start,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        color: Color(0x98454343),
                                                                                                                      ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  commentsListDynamicItem.comment,
                                                                                                                  textAlign: TextAlign.start,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    back: StreamBuilder<List<KkTubeAccountRecord>>(
                      stream: queryKkTubeAccountRecord(
                        queryBuilder: (kkTubeAccountRecord) =>
                            kkTubeAccountRecord.where(
                          'SubscribedBy',
                          arrayContains: currentUserReference,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<KkTubeAccountRecord>
                            containerKkTubeAccountRecordList = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              // Jeśli liczba subskrybowanych użytkowników jest pusta, to nie pokazuj kontenera z filmikami.
                              if (containerKkTubeAccountRecordList.length != 0)
                                StreamBuilder<List<KkTubeVideosRecord>>(
                                  stream: queryKkTubeVideosRecord(
                                    queryBuilder: (kkTubeVideosRecord) =>
                                        kkTubeVideosRecord.whereIn(
                                            'user',
                                            containerKkTubeAccountRecordList
                                                .map((e) => e.userRef)
                                                .withoutNulls
                                                .toList()),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<KkTubeVideosRecord>
                                        containerKkTubeVideosRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          wrapWithModel(
                                            model:
                                                _model.kKTubePlayerHeader2Model,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: KKTubePlayerHeader2Widget(
                                              documentList:
                                                  containerKkTubeVideosRecordList
                                                      .map((e) => e.reference)
                                                      .toList(),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child:
                                                  // Wygenerowanie dynamicznych dzieci pageView w oparciu o AppState z referencjami do zasubskrybowanych filmików w losowej kolejności.
                                                  Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final subscribedVideosPageView =
                                                        FFAppState()
                                                            .RandomizedSubscribedKKTubeVideos
                                                            .toList();
                                                    return Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child: PageView.builder(
                                                        controller: _model
                                                                .pageViewController2 ??=
                                                            PageController(
                                                                initialPage: min(
                                                                    0,
                                                                    subscribedVideosPageView
                                                                            .length -
                                                                        1)),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            subscribedVideosPageView
                                                                .length,
                                                        itemBuilder: (context,
                                                            subscribedVideosPageViewIndex) {
                                                          final subscribedVideosPageViewItem =
                                                              subscribedVideosPageView[
                                                                  subscribedVideosPageViewIndex];
                                                          return
                                                              // Odzyskanie dokumentu filmiku (kkTubeVideo) z referencji, na bazie której tworzone jest dziecko (podstrona) PageView.
                                                              StreamBuilder<
                                                                  KkTubeVideosRecord>(
                                                            stream: KkTubeVideosRecord
                                                                .getDocument(
                                                                    subscribedVideosPageViewItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final columnKkTubeVideosRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowVideoPlayer(
                                                                            path:
                                                                                valueOrDefault<String>(
                                                                              columnKkTubeVideosRecord.video,
                                                                              'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/defaultVideo.mp4?alt=media&token=12783943-3f2e-42cc-914b-0e7355572ab2',
                                                                            ),
                                                                            videoType:
                                                                                VideoType.network,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            autoPlay:
                                                                                false,
                                                                            looping:
                                                                                true,
                                                                            showControls:
                                                                                true,
                                                                            allowFullScreen:
                                                                                false,
                                                                            allowPlaybackSpeedMenu:
                                                                                false,
                                                                            lazyLoad:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.45),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                60.0,
                                                                            height:
                                                                                60.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                ToggleIcon(
                                                                              onPressed: () async {
                                                                                final thumbsUpElement = currentUserReference;
                                                                                final thumbsUpUpdate = columnKkTubeVideosRecord.thumbsUp.contains(thumbsUpElement)
                                                                                    ? FieldValue.arrayRemove([
                                                                                        thumbsUpElement
                                                                                      ])
                                                                                    : FieldValue.arrayUnion([
                                                                                        thumbsUpElement
                                                                                      ]);
                                                                                await columnKkTubeVideosRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'thumbsUp': thumbsUpUpdate,
                                                                                    },
                                                                                  ),
                                                                                });

                                                                                await subscribedVideosPageViewItem.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'thumbsDown': FieldValue.arrayRemove([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              value: columnKkTubeVideosRecord.thumbsUp.contains(currentUserReference),
                                                                              onIcon: Icon(
                                                                                Icons.thumb_up,
                                                                                color: Colors.white,
                                                                                size: 45.0,
                                                                              ),
                                                                              offIcon: Icon(
                                                                                Icons.thumb_up_outlined,
                                                                                color: Colors.white,
                                                                                size: 45.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.95,
                                                                              0.75),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              setState(() {
                                                                                FFAppState().CommentsSectionVisibility = true;
                                                                              });
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.insert_comment_outlined,
                                                                              color: Colors.white,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              StreamBuilder<List<KkTubeAccountRecord>>(
                                                                            stream:
                                                                                queryKkTubeAccountRecord(
                                                                              queryBuilder: (kkTubeAccountRecord) => kkTubeAccountRecord.where(
                                                                                'UserRef',
                                                                                isEqualTo: columnKkTubeVideosRecord.user,
                                                                              ),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<KkTubeAccountRecord> containerKkTubeAccountRecordList = snapshot.data!;
                                                                              final containerKkTubeAccountRecord = containerKkTubeAccountRecordList.isNotEmpty ? containerKkTubeAccountRecordList.first : null;
                                                                              return Container(
                                                                                width: double.infinity,
                                                                                height: 65.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                  child: StreamBuilder<List<UsersRecord>>(
                                                                                    stream: queryUsersRecord(
                                                                                      queryBuilder: (usersRecord) => usersRecord.where(
                                                                                        'uid',
                                                                                        isEqualTo: columnKkTubeVideosRecord.user?.id,
                                                                                      ),
                                                                                      singleRecord: true,
                                                                                    ),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 50.0,
                                                                                            height: 50.0,
                                                                                            child: CircularProgressIndicator(
                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      List<UsersRecord> rowUsersRecordList = snapshot.data!;
                                                                                      final rowUsersRecord = rowUsersRecordList.isNotEmpty ? rowUsersRecordList.first : null;
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              context.pushNamed(
                                                                                                'UserAccountPage',
                                                                                                queryParameters: {
                                                                                                  'selectedUser': serializeParam(
                                                                                                    rowUsersRecord,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                  'selectedUserKKTubeAccount': serializeParam(
                                                                                                    containerKkTubeAccountRecord,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  'selectedUser': rowUsersRecord,
                                                                                                  'selectedUserKKTubeAccount': containerKkTubeAccountRecord,
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 60.0,
                                                                                              height: 60.0,
                                                                                              clipBehavior: Clip.antiAlias,
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              child: Image.network(
                                                                                                valueOrDefault<String>(
                                                                                                  rowUsersRecord?.photoUrl,
                                                                                                  'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/user_avatar.png?alt=media&token=8a0e52ab-15dc-40aa-8696-1909ebd7f273',
                                                                                                ),
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  containerKkTubeAccountRecord?.nick,
                                                                                                  'Wiesiek',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: Colors.white,
                                                                                                      fontSize: 16.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 60.0,
                                                                                            height: 60.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: ToggleIcon(
                                                                                              onPressed: () async {
                                                                                                final subscribedByElement = currentUserReference;
                                                                                                final subscribedByUpdate = containerKkTubeAccountRecord!.subscribedBy.contains(subscribedByElement) ? FieldValue.arrayRemove([subscribedByElement]) : FieldValue.arrayUnion([subscribedByElement]);
                                                                                                await containerKkTubeAccountRecord!.reference.update({
                                                                                                  ...mapToFirestore(
                                                                                                    {
                                                                                                      'SubscribedBy': subscribedByUpdate,
                                                                                                    },
                                                                                                  ),
                                                                                                });
                                                                                              },
                                                                                              value: containerKkTubeAccountRecord!.subscribedBy.contains(currentUserReference),
                                                                                              onIcon: Icon(
                                                                                                Icons.subscriptions,
                                                                                                color: Color(0xFFFF0000),
                                                                                                size: 45.0,
                                                                                              ),
                                                                                              offIcon: Icon(
                                                                                                Icons.subscriptions_outlined,
                                                                                                color: Color(0xFFFF0000),
                                                                                                size: 45.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      columnKkTubeVideosRecord.title,
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: Colors.white,
                                                                                            fontSize: 18.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.55),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              columnKkTubeVideosRecord.thumbsUp.length.toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.25),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              columnKkTubeVideosRecord.thumbsDown.length.toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.15),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                60.0,
                                                                            height:
                                                                                60.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                ToggleIcon(
                                                                              onPressed: () async {
                                                                                final thumbsDownElement = currentUserReference;
                                                                                final thumbsDownUpdate = columnKkTubeVideosRecord.thumbsDown.contains(thumbsDownElement)
                                                                                    ? FieldValue.arrayRemove([
                                                                                        thumbsDownElement
                                                                                      ])
                                                                                    : FieldValue.arrayUnion([
                                                                                        thumbsDownElement
                                                                                      ]);
                                                                                await columnKkTubeVideosRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'thumbsDown': thumbsDownUpdate,
                                                                                    },
                                                                                  ),
                                                                                });

                                                                                await subscribedVideosPageViewItem.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'thumbsUp': FieldValue.arrayRemove([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              value: columnKkTubeVideosRecord.thumbsDown.contains(currentUserReference),
                                                                              onIcon: Icon(
                                                                                Icons.thumb_down,
                                                                                color: Colors.white,
                                                                                size: 45.0,
                                                                              ),
                                                                              offIcon: Icon(
                                                                                Icons.thumb_down_outlined,
                                                                                color: Colors.white,
                                                                                size: 45.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (FFAppState().CommentsSectionVisibility ==
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                StreamBuilder<List<KkTubeVideoCommentRecord>>(
                                                                              stream: queryKkTubeVideoCommentRecord(),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<KkTubeVideoCommentRecord> containerKkTubeVideoCommentRecordList = snapshot.data!;
                                                                                return Container(
                                                                                  width: double.infinity,
                                                                                  height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(25.0),
                                                                                      topRight: Radius.circular(25.0),
                                                                                    ),
                                                                                    shape: BoxShape.rectangle,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 10.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                'KOMENTARZE',
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 16.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                setState(() {
                                                                                                  FFAppState().CommentsSectionVisibility = false;
                                                                                                });
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.exit_to_app_rounded,
                                                                                                color: Colors.black,
                                                                                                size: 35.0,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Divider(
                                                                                        thickness: 3.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            AuthUserStreamWidget(
                                                                                              builder: (context) => Container(
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  valueOrDefault<String>(
                                                                                                    currentUserPhoto,
                                                                                                    'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/user_avatar.png?alt=media&token=8a0e52ab-15dc-40aa-8696-1909ebd7f273',
                                                                                                  ),
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: wrapWithModel(
                                                                                                model: _model.addCommentTextFieldModels2.getModel(
                                                                                                  subscribedVideosPageViewIndex.toString(),
                                                                                                  subscribedVideosPageViewIndex,
                                                                                                ),
                                                                                                updateCallback: () => setState(() {}),
                                                                                                child: AddCommentTextFieldWidget(
                                                                                                  key: Key(
                                                                                                    'Key1b1_${subscribedVideosPageViewIndex.toString()}',
                                                                                                  ),
                                                                                                  videoRef: columnKkTubeVideosRecord.reference,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Divider(
                                                                                        thickness: 3.0,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final commentsListDynamic = containerKkTubeVideoCommentRecordList.where((e) => e.videoRef == columnKkTubeVideosRecord.reference).toList();
                                                                                            if (commentsListDynamic.isEmpty) {
                                                                                              return Center(
                                                                                                child: EmptyCommentsWidget(),
                                                                                              );
                                                                                            }
                                                                                            return ListView.builder(
                                                                                              padding: EdgeInsets.zero,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.vertical,
                                                                                              itemCount: commentsListDynamic.length,
                                                                                              itemBuilder: (context, commentsListDynamicIndex) {
                                                                                                final commentsListDynamicItem = commentsListDynamic[commentsListDynamicIndex];
                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                  child: StreamBuilder<List<UsersRecord>>(
                                                                                                    stream: queryUsersRecord(
                                                                                                      queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                        'uid',
                                                                                                        isEqualTo: commentsListDynamicItem.user?.id,
                                                                                                      ),
                                                                                                      singleRecord: true,
                                                                                                    ),
                                                                                                    builder: (context, snapshot) {
                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                      if (!snapshot.hasData) {
                                                                                                        return Center(
                                                                                                          child: SizedBox(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            child: CircularProgressIndicator(
                                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                FlutterFlowTheme.of(context).primary,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                      final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;
                                                                                                      return Container(
                                                                                                        width: double.infinity,
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                          child: StreamBuilder<List<KkTubeAccountRecord>>(
                                                                                                            stream: queryKkTubeAccountRecord(
                                                                                                              queryBuilder: (kkTubeAccountRecord) => kkTubeAccountRecord.where(
                                                                                                                'UserRef',
                                                                                                                isEqualTo: commentsListDynamicItem.user,
                                                                                                              ),
                                                                                                              singleRecord: true,
                                                                                                            ),
                                                                                                            builder: (context, snapshot) {
                                                                                                              // Customize what your widget looks like when it's loading.
                                                                                                              if (!snapshot.hasData) {
                                                                                                                return Center(
                                                                                                                  child: SizedBox(
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    child: CircularProgressIndicator(
                                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }
                                                                                                              List<KkTubeAccountRecord> rowKkTubeAccountRecordList = snapshot.data!;
                                                                                                              final rowKkTubeAccountRecord = rowKkTubeAccountRecordList.isNotEmpty ? rowKkTubeAccountRecordList.first : null;
                                                                                                              return InkWell(
                                                                                                                splashColor: Colors.transparent,
                                                                                                                focusColor: Colors.transparent,
                                                                                                                hoverColor: Colors.transparent,
                                                                                                                highlightColor: Colors.transparent,
                                                                                                                onLongPress: () async {
                                                                                                                  if (commentsListDynamicItem.user == currentUserReference) {
                                                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                                                          context: context,
                                                                                                                          builder: (alertDialogContext) {
                                                                                                                            return WebViewAware(
                                                                                                                                child: AlertDialog(
                                                                                                                              title: Text('UWAGA'),
                                                                                                                              content: Text('Czy na pewno chcesz usunąć ten komentarz?'),
                                                                                                                              actions: [
                                                                                                                                TextButton(
                                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                  child: Text('NIE'),
                                                                                                                                ),
                                                                                                                                TextButton(
                                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                  child: Text('TAK'),
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ));
                                                                                                                          },
                                                                                                                        ) ??
                                                                                                                        false;
                                                                                                                    if (confirmDialogResponse) {
                                                                                                                      await commentsListDynamicItem.reference.delete();
                                                                                                                      return;
                                                                                                                    } else {
                                                                                                                      return;
                                                                                                                    }
                                                                                                                  } else {
                                                                                                                    return;
                                                                                                                  }
                                                                                                                },
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 50.0,
                                                                                                                      height: 50.0,
                                                                                                                      clipBehavior: Clip.antiAlias,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Image.network(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          containerUsersRecord?.photoUrl,
                                                                                                                          'https://firebasestorage.googleapis.com/v0/b/flutterkino.appspot.com/o/user_avatar.png?alt=media&token=8a0e52ab-15dc-40aa-8696-1909ebd7f273',
                                                                                                                        ),
                                                                                                                        fit: BoxFit.cover,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Expanded(
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              '${rowKkTubeAccountRecord?.nick} - ${dateTimeFormat('d/M/y', commentsListDynamicItem.postDate)}',
                                                                                                                              textAlign: TextAlign.start,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    color: Color(0x98454343),
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              commentsListDynamicItem.comment,
                                                                                                                              textAlign: TextAlign.start,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              if (containerKkTubeAccountRecordList.length == 0)
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model: _model
                                            .kKTubePlayerHeader3NoActionsModel,
                                        updateCallback: () => setState(() {}),
                                        child:
                                            KKTubePlayerHeader3NoActionsWidget(),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Text(
                                              'WYGLĄDA NA TO, ŻE NIE ZASUBSKRYBOWAŁEŚ JESZCZE ŻADNEGO KONTA UŻYTKOWNIKA KKTUBE. WEJDŹ W PROFIL UŻYTKOWNIKA I NACIŚNIJ PRZYCISK SUBSKRYBUJ LUB KLIKNIJ IKONKĘ SUBSKRYPCJI ZNAJDUJĄCĄ SIĘ OBOK NAZWY UŻYTKOWNIKA POD KAŻDYM FILMIKIEM',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
