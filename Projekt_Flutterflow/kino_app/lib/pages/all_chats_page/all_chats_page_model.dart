import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list_widgets/empty_chat_list/empty_chat_list_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'all_chats_page_widget.dart' show AllChatsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AllChatsPageModel extends FlutterFlowModel<AllChatsPageWidget> {
  ///  Local state fields for this page.

  int iterator = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ChatMessagesRecord>? allMessages;
  // State field(s) for Column widget.
  ScrollController? columnController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewController = ScrollController();
    columnController = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    listViewController?.dispose();
    columnController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
