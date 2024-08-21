import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'small_text_field_model.dart';
export 'small_text_field_model.dart';

class SmallTextFieldWidget extends StatefulWidget {
  const SmallTextFieldWidget({
    super.key,
    this.initialValue,
    String? hintText,
    bool? isReadOnly,
    int? maxLines,
    bool? isPassword,
  })  : this.hintText = hintText ?? 'Add Here',
        this.isReadOnly = isReadOnly ?? false,
        this.maxLines = maxLines ?? 1,
        this.isPassword = isPassword ?? false;

  final String? initialValue;
  final String hintText;
  final bool isReadOnly;
  final int maxLines;
  final bool isPassword;

  @override
  State<SmallTextFieldWidget> createState() => _SmallTextFieldWidgetState();
}

class _SmallTextFieldWidgetState extends State<SmallTextFieldWidget> {
  late SmallTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallTextFieldModel());

    _model.textController ??= TextEditingController(text: widget!.initialValue);
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
    return TextFormField(
      controller: _model.textController,
      focusNode: _model.textFieldFocusNode,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.textController',
        Duration(milliseconds: 2000),
        () async {
          _model.text = widget!.initialValue;
        },
      ),
      autofocus: false,
      readOnly: widget!.isReadOnly,
      obscureText: false,
      decoration: InputDecoration(
        isDense: false,
        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
        hintText: widget!.hintText,
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
      maxLines: widget!.maxLines,
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}
