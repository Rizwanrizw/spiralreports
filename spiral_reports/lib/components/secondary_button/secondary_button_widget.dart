import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'secondary_button_model.dart';
export 'secondary_button_model.dart';

class SecondaryButtonWidget extends StatefulWidget {
  const SecondaryButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.action,
  });

  final String? text;
  final Widget? icon;
  final Future Function()? action;

  @override
  State<SecondaryButtonWidget> createState() => _SecondaryButtonWidgetState();
}

class _SecondaryButtonWidgetState extends State<SecondaryButtonWidget> {
  late SecondaryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecondaryButtonModel());

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
      text: widget!.text!,
      icon: widget!.icon,
      options: FFButtonOptions(
        height: 48.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primaryBackground,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
