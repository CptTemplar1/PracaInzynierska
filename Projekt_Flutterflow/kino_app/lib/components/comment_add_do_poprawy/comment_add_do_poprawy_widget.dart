import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_add_do_poprawy_model.dart';
export 'comment_add_do_poprawy_model.dart';

class CommentAddDoPoprawyWidget extends StatefulWidget {
  const CommentAddDoPoprawyWidget({Key? key}) : super(key: key);

  @override
  _CommentAddDoPoprawyWidgetState createState() =>
      _CommentAddDoPoprawyWidgetState();
}

class _CommentAddDoPoprawyWidgetState extends State<CommentAddDoPoprawyWidget> {
  late CommentAddDoPoprawyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentAddDoPoprawyModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return
        // Komponent samego TextFielda wykorzystany na stronie Shorts. Nie czyści pola TextField po dodaniu komentarza. Po poprawkach do wyrzucenia razem z całą stroną shorts.
        Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 5.0, 0.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          Duration(milliseconds: 2000),
          () => setState(() {}),
        ),
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Twój komentarz',
          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                color: Color(0x7F000000),
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x7F000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFAB2323),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFAB2323),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: Icon(
            Icons.insert_comment_rounded,
            color: Color(0x7F000000),
          ),
          suffixIcon: _model.textController!.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    _model.textController?.clear();
                    setState(() {});
                  },
                  child: Icon(
                    Icons.clear,
                    color: Color(0x7F000000),
                    size: 22.0,
                  ),
                )
              : null,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Poppins',
              color: Colors.black,
            ),
        maxLines: null,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
