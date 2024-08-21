import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'large_text_field_model.dart';
export 'large_text_field_model.dart';

class LargeTextFieldWidget extends StatefulWidget {
  const LargeTextFieldWidget({
    super.key,
    this.initialText,
    this.hintText,
    bool? isReadOnly,
    bool? showClearField,
  })  : this.isReadOnly = isReadOnly ?? false,
        this.showClearField = showClearField ?? false;

  final String? initialText;
  final String? hintText;
  final bool isReadOnly;
  final bool showClearField;

  @override
  State<LargeTextFieldWidget> createState() => _LargeTextFieldWidgetState();
}

class _LargeTextFieldWidgetState extends State<LargeTextFieldWidget> {
  late LargeTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LargeTextFieldModel());

    _model.textController ??= TextEditingController(text: widget!.initialText);
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
          _model.text = _model.textController.text;
          setState(() {});
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
        contentPadding: EdgeInsetsDirectional.fromSTEB(18.0, 24.0, 18.0, 24.0),
        suffixIcon: _model.textController!.text.isNotEmpty
            ? InkWell(
                onTap: () async {
                  _model.textController?.clear();
                  _model.text = _model.textController.text;
                  setState(() {});
                  setState(() {});
                },
                child: Icon(
                  Icons.clear,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              )
            : null,
      ),
      style: FlutterFlowTheme.of(context).titleLarge.override(
            fontFamily: 'Inter',
            letterSpacing: 0.0,
          ),
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}
