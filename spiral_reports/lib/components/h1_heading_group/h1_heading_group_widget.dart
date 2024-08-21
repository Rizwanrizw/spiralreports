import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'h1_heading_group_model.dart';
export 'h1_heading_group_model.dart';

class H1HeadingGroupWidget extends StatefulWidget {
  const H1HeadingGroupWidget({
    super.key,
    String? heading,
    this.subText,
  }) : this.heading = heading ?? 'Dashboard';

  final String heading;
  final String? subText;

  @override
  State<H1HeadingGroupWidget> createState() => _H1HeadingGroupWidgetState();
}

class _H1HeadingGroupWidgetState extends State<H1HeadingGroupWidget> {
  late H1HeadingGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => H1HeadingGroupModel());

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
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Inter',
                  fontSize: 30.0,
                  letterSpacing: 0.0,
                ),
          ),
          Text(
            valueOrDefault<String>(
              widget!.subText,
              'This is the subtext',
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}
