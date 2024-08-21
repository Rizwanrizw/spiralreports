import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'h3_heading_group_model.dart';
export 'h3_heading_group_model.dart';

class H3HeadingGroupWidget extends StatefulWidget {
  const H3HeadingGroupWidget({
    super.key,
    this.heading,
    String? subText,
  }) : this.subText = subText ?? ' ';

  final String? heading;
  final String subText;

  @override
  State<H3HeadingGroupWidget> createState() => _H3HeadingGroupWidgetState();
}

class _H3HeadingGroupWidgetState extends State<H3HeadingGroupWidget> {
  late H3HeadingGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => H3HeadingGroupModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget!.heading,
              'Heading',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            widget!.subText,
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Inter',
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                ),
          ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}
