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
import 'shorts_page_widget.dart' show ShortsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ShortsPageModel extends FlutterFlowModel<ShortsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for KKTubePlayerHeader1 component.
  late KKTubePlayerHeader1Model kKTubePlayerHeader1Model;
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Models for AddCommentTextField dynamic component.
  late FlutterFlowDynamicModels<AddCommentTextFieldModel>
      addCommentTextFieldModels1;
  // Model for KKTubePlayerHeader2 component.
  late KKTubePlayerHeader2Model kKTubePlayerHeader2Model;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Models for AddCommentTextField dynamic component.
  late FlutterFlowDynamicModels<AddCommentTextFieldModel>
      addCommentTextFieldModels2;
  // Model for KKTubePlayerHeader3NoActions component.
  late KKTubePlayerHeader3NoActionsModel kKTubePlayerHeader3NoActionsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    kKTubePlayerHeader1Model =
        createModel(context, () => KKTubePlayerHeader1Model());
    addCommentTextFieldModels1 =
        FlutterFlowDynamicModels(() => AddCommentTextFieldModel());
    kKTubePlayerHeader2Model =
        createModel(context, () => KKTubePlayerHeader2Model());
    addCommentTextFieldModels2 =
        FlutterFlowDynamicModels(() => AddCommentTextFieldModel());
    kKTubePlayerHeader3NoActionsModel =
        createModel(context, () => KKTubePlayerHeader3NoActionsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    kKTubePlayerHeader1Model.dispose();
    addCommentTextFieldModels1.dispose();
    kKTubePlayerHeader2Model.dispose();
    addCommentTextFieldModels2.dispose();
    kKTubePlayerHeader3NoActionsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
