import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list_widgets/empty_chat_list/empty_chat_list_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'all_chats_page_model.dart';
export 'all_chats_page_model.dart';

class AllChatsPageWidget extends StatefulWidget {
  const AllChatsPageWidget({Key? key}) : super(key: key);

  @override
  _AllChatsPageWidgetState createState() => _AllChatsPageWidgetState();
}

class _AllChatsPageWidgetState extends State<AllChatsPageWidget> {
  late AllChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsPageModel());
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
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await _model.listViewController?.animateTo(
                0,
                duration: Duration(milliseconds: 100),
                curve: Curves.ease,
              );
            },
            backgroundColor: Color(0xFF27325A),
            elevation: 8.0,
            child: Icon(
              Icons.keyboard_arrow_up,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 45.0,
            ),
          ),
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
                  controller: _model.columnController,
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
              'Wszystkie Czaty',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 22.0,
                  ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('InviteUserPage');
                  },
                  child: Icon(
                    Icons.person,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 35.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('CreateGroupChatPage');
                  },
                  child: Icon(
                    Icons.people_alt,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 35.0,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 4.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
              child: StreamBuilder<List<ChatsRecord>>(
                stream: queryChatsRecord(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where(
                        'users',
                        arrayContains: currentUserReference,
                      )
                      .orderBy('last_message_time', descending: true),
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
                  List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                  if (listViewChatsRecordList.isEmpty) {
                    return Center(
                      child: EmptyChatListWidget(),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewChatsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewChatsRecord =
                          listViewChatsRecordList[listViewIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onLongPress: () async {
                          var _shouldSetState = false;
                          if (listViewChatsRecord.allUsersChat == true) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                    child: AlertDialog(
                                  title: Text('UWAGA'),
                                  content: Text(
                                      'Nie możesz usunąć tego czatu grupowego, ponieważ jest to domyślny czat ze wszystkimi użytkownikami.'),
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
                            if (_shouldSetState) setState(() {});
                            return;
                          } else {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                        child: AlertDialog(
                                      title: Text('UWAGA'),
                                      content: Text(
                                          'Czy na pewno chcesz usunąć ten czat?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('NIE'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('TAK'),
                                        ),
                                      ],
                                    ));
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              _model.allMessages =
                                  await queryChatMessagesRecordOnce(
                                queryBuilder: (chatMessagesRecord) =>
                                    chatMessagesRecord.where(
                                  'chat',
                                  isEqualTo: listViewChatsRecord.reference,
                                ),
                              );
                              _shouldSetState = true;
                              await listViewChatsRecord.reference.delete();
                              _model.iterator = 0;
                              while (_model.iterator <
                                  _model.allMessages!.length) {
                                await _model
                                    .allMessages![_model.iterator].reference
                                    .delete();
                                _model.iterator = _model.iterator + 1;
                              }
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: StreamBuilder<FFChatInfo>(
                            stream: FFChatManager.instance
                                .getChatInfo(chatRecord: listViewChatsRecord),
                            builder: (context, snapshot) {
                              final chatInfo = snapshot.data ??
                                  FFChatInfo(listViewChatsRecord);
                              return FFChatPreview(
                                onTap: () => context.pushNamed(
                                  'ChatPage',
                                  queryParameters: {
                                    'chatUser': serializeParam(
                                      chatInfo.otherUsers.length == 1
                                          ? chatInfo.otherUsersList.first
                                          : null,
                                      ParamType.Document,
                                    ),
                                    'chatRef': serializeParam(
                                      chatInfo.chatRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'chatUser': chatInfo.otherUsers.length == 1
                                        ? chatInfo.otherUsersList.first
                                        : null,
                                  },
                                ),
                                lastChatText: chatInfo.chatPreviewMessage(),
                                lastChatTime:
                                    listViewChatsRecord.lastMessageTime,
                                seen: listViewChatsRecord.lastMessageSeenBy!
                                    .contains(currentUserReference),
                                title: chatInfo.chatPreviewTitle(),
                                userProfilePic: chatInfo.chatPreviewPic(),
                                color: Color(0xFFDADDE1),
                                unreadColor: Colors.blue,
                                titleTextStyle: GoogleFonts.getFont(
                                  'DM Sans',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                                dateTextStyle: GoogleFonts.getFont(
                                  'DM Sans',
                                  color: Color(0x73000000),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                previewTextStyle: GoogleFonts.getFont(
                                  'DM Sans',
                                  color: Color(0x73000000),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                ),
                                contentPadding: EdgeInsets.all(3.0),
                                borderRadius: BorderRadius.circular(0.0),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    controller: _model.listViewController,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
