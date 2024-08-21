import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_set_question_text_field_model.dart';
export 'question_set_question_text_field_model.dart';

class QuestionSetQuestionTextFieldWidget extends StatefulWidget {
  const QuestionSetQuestionTextFieldWidget({super.key});

  @override
  State<QuestionSetQuestionTextFieldWidget> createState() =>
      _QuestionSetQuestionTextFieldWidgetState();
}

class _QuestionSetQuestionTextFieldWidgetState
    extends State<QuestionSetQuestionTextFieldWidget> {
  late QuestionSetQuestionTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionSetQuestionTextFieldModel());

    _model.textController ??= TextEditingController(text: _model.questionText);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          Duration(milliseconds: 2000),
          () async {
            _model.questionText = _model.textController.text;
            setState(() {});
          },
        ),
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          isDense: false,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          hintText: 'Add Question Here',
          hintStyle: FlutterFlowTheme.of(context).labelLarge.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          contentPadding: EdgeInsets.all(18.0),
        ),
        style: FlutterFlowTheme.of(context).labelLarge.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        maxLines: null,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
