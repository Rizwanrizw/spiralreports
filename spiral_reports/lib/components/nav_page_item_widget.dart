import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_page_item_model.dart';
export 'nav_page_item_model.dart';

class NavPageItemWidget extends StatefulWidget {
  const NavPageItemWidget({
    super.key,
    required this.text,
    bool? isActive,
  }) : this.isActive = isActive ?? false;

  final String? text;
  final bool isActive;

  @override
  State<NavPageItemWidget> createState() => _NavPageItemWidgetState();
}

class _NavPageItemWidgetState extends State<NavPageItemWidget> {
  late NavPageItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavPageItemModel());

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
      height: 40.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.isActive
              ? Color(0xFF0942D6)
              : FlutterFlowTheme.of(context).primary,
          FlutterFlowTheme.of(context).primary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Text(
            valueOrDefault<String>(
              widget!.text,
              'Assessments',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
