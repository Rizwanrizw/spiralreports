import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/dashboard_admin_left_panel/dashboard_admin_left_panel_widget.dart';
import '/components/h3_heading_group/h3_heading_group_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'assessment_detail_widget.dart' show AssessmentDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class AssessmentDetailModel extends FlutterFlowModel<AssessmentDetailWidget> {
  ///  Local state fields for this page.

  dynamic assessmentData;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Single Assessment)] action in assessment_detail widget.
  ApiCallResponse? getAssessmentAPI;
  // Stores action output result for [Backend Call - API (Auth Refresh)] action in assessment_detail widget.
  ApiCallResponse? userAuthRefreshAPI;
  // Stores action output result for [Backend Call - API (Get Single Assessment Admin)] action in assessment_detail widget.
  ApiCallResponse? getAdminAssessmentAPI;
  // Model for dashboard_admin_left_panel component.
  late DashboardAdminLeftPanelModel dashboardAdminLeftPanelModel;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel1;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel1;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel2;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel2;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel2;

  @override
  void initState(BuildContext context) {
    dashboardAdminLeftPanelModel =
        createModel(context, () => DashboardAdminLeftPanelModel());
    secondaryButtonModel1 = createModel(context, () => SecondaryButtonModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    h3HeadingGroupModel1 = createModel(context, () => H3HeadingGroupModel());
    h3HeadingGroupModel2 = createModel(context, () => H3HeadingGroupModel());
    secondaryButtonModel2 = createModel(context, () => SecondaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    dashboardAdminLeftPanelModel.dispose();
    secondaryButtonModel1.dispose();
    primaryButtonModel1.dispose();
    h3HeadingGroupModel1.dispose();
    h3HeadingGroupModel2.dispose();
    secondaryButtonModel2.dispose();
    primaryButtonModel2.dispose();
  }
}
