import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sm_heading_item_model.dart';
export 'sm_heading_item_model.dart';

class SmHeadingItemWidget extends StatefulWidget {
  const SmHeadingItemWidget({
    super.key,
    String? heading,
    this.subText,
  }) : this.heading = heading ?? 'Heading';

  final String heading;
  final String? subText;

  @override
  State<SmHeadingItemWidget> createState() => _SmHeadingItemWidgetState();
}

class _SmHeadingItemWidgetState extends State<SmHeadingItemWidget> {
  late SmHeadingItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmHeadingItemModel());

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
          widget!.heading,
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          valueOrDefault<String>(
            widget!.subText,
            'Short description',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
              ),
        ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
