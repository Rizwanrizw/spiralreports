import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'assessment_detail_page_widget.dart' show AssessmentDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AssessmentDetailPageModel
    extends FlutterFlowModel<AssessmentDetailPageWidget> {
  ///  Local state fields for this page.

  dynamic assessmentData;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Single Assessment)] action in assessment_detail_page widget.
  ApiCallResponse? getAssessmentAPI;
  // Stores action output result for [Backend Call - API (Auth Refresh)] action in assessment_detail_page widget.
  ApiCallResponse? userAuthRefreshAPI;
  // Stores action output result for [Backend Call - API (Get Single Assessment Admin)] action in assessment_detail_page widget.
  ApiCallResponse? getAdminAssessmentAPI;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
