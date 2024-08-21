import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'primary_button_model.dart';
export 'primary_button_model.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget({
    super.key,
    String? text,
    required this.icon,
    bool? isActive,
    required this.action,
  })  : this.text = text ?? 'Click Here',
        this.isActive = isActive ?? true;

  final String text;
  final Widget? icon;
  final bool isActive;
  final Future Function()? action;

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  late PrimaryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.action?.call();
      },
      text: widget!.text,
      icon: widget!.icon,
      options: FFButtonOptions(
        height: 48.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).secondaryBackground,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Color(0xFF1150F5),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
