import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'h2_heading_group_model.dart';
export 'h2_heading_group_model.dart';

class H2HeadingGroupWidget extends StatefulWidget {
  const H2HeadingGroupWidget({
    super.key,
    String? heading,
    this.subText,
  }) : this.heading = heading ?? 'Heading';

  final String heading;
  final String? subText;

  @override
  State<H2HeadingGroupWidget> createState() => _H2HeadingGroupWidgetState();
}

class _H2HeadingGroupWidgetState extends State<H2HeadingGroupWidget> {
  late H2HeadingGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => H2HeadingGroupModel());

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
            widget!.heading,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 28.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            widget!.subText!,
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
