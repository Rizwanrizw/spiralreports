import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'assessment_option_item_model.dart';
export 'assessment_option_item_model.dart';

class AssessmentOptionItemWidget extends StatefulWidget {
  const AssessmentOptionItemWidget({
    super.key,
    required this.text,
    required this.onTap,
    bool? isSelected,
  }) : this.isSelected = isSelected ?? false;

  final String? text;
  final Future Function()? onTap;
  final bool isSelected;

  @override
  State<AssessmentOptionItemWidget> createState() =>
      _AssessmentOptionItemWidgetState();
}

class _AssessmentOptionItemWidgetState
    extends State<AssessmentOptionItemWidget> {
  late AssessmentOptionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssessmentOptionItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isSelected = widget!.isSelected;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.isSelected = !_model.isSelected;
        setState(() {});
        await widget.onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            _model.isSelected
                ? Color(0x561254FF)
                : FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).secondaryBackground,
          ),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.all(26.0),
          child: AutoSizeText(
            valueOrDefault<String>(
              widget!.text,
              'Option',
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  lineHeight: 1.4,
                ),
          ),
        ),
      ),
    );
  }
}
