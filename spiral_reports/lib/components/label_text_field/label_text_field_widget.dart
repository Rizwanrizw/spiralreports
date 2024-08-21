import '/components/small_text_field/small_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'label_text_field_model.dart';
export 'label_text_field_model.dart';

class LabelTextFieldWidget extends StatefulWidget {
  const LabelTextFieldWidget({
    super.key,
    String? hintText,
    this.initialValue,
    bool? isReadOnly,
    required this.label,
    bool? isPassword,
  })  : this.hintText = hintText ?? 'Add Here',
        this.isReadOnly = isReadOnly ?? false,
        this.isPassword = isPassword ?? false;

  final String hintText;
  final String? initialValue;
  final bool isReadOnly;
  final String? label;
  final bool isPassword;

  @override
  State<LabelTextFieldWidget> createState() => _LabelTextFieldWidgetState();
}

class _LabelTextFieldWidgetState extends State<LabelTextFieldWidget> {
  late LabelTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LabelTextFieldModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          valueOrDefault<String>(
            widget!.label,
            'Enter Here',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        wrapWithModel(
          model: _model.smallTextFieldModel,
          updateCallback: () => setState(() {}),
          child: SmallTextFieldWidget(
            initialValue: widget!.initialValue,
            hintText: widget!.hintText,
            isReadOnly: widget!.isReadOnly,
            isPassword: widget!.isPassword,
          ),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
