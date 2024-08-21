import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'entry_widget.dart' show EntryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EntryModel extends FlutterFlowModel<EntryWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get All Assessments)] action in entry widget.
  ApiCallResponse? userAssessmentAPI;
  // Stores action output result for [Backend Call - API (Get All Assessments Admin)] action in entry widget.
  ApiCallResponse? adminAssessmentsAPI;
  // Stores action output result for [Backend Call - API (Admin Refresh)] action in entry widget.
  ApiCallResponse? adminAuthRefreshAPI;
  // Stores action output result for [Backend Call - API (Get All Assessments Admin)] action in entry widget.
  ApiCallResponse? adminAssessments2API;
  // Stores action output result for [Backend Call - API (Get All Assessments Admin)] action in entry widget.
  ApiCallResponse? apiResultqiq;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Search Assessment)] action in IconButton widget.
  ApiCallResponse? searchResultsAPI;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
