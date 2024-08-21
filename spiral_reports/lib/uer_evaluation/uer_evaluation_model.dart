import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'uer_evaluation_widget.dart' show UerEvaluationWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UerEvaluationModel extends FlutterFlowModel<UerEvaluationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for asssessmentTitle widget.
  FocusNode? asssessmentTitleFocusNode;
  TextEditingController? asssessmentTitleTextController;
  String? Function(BuildContext, String?)?
      asssessmentTitleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    asssessmentTitleFocusNode?.dispose();
    asssessmentTitleTextController?.dispose();
  }
}
