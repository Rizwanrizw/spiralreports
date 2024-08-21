import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/assessments_data_table_widget.dart';
import '/components/dashboard_widget/dashboard_widget_widget.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/h2_heading_group/h2_heading_group_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_right_panel_dashboard_widget.dart'
    show AdminRightPanelDashboardWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminRightPanelDashboardModel
    extends FlutterFlowModel<AdminRightPanelDashboardWidget> {
  ///  Local state fields for this component.

  List<dynamic> allAssessmentsList = [];
  void addToAllAssessmentsList(dynamic item) => allAssessmentsList.add(item);
  void removeFromAllAssessmentsList(dynamic item) =>
      allAssessmentsList.remove(item);
  void removeAtIndexFromAllAssessmentsList(int index) =>
      allAssessmentsList.removeAt(index);
  void insertAtIndexInAllAssessmentsList(int index, dynamic item) =>
      allAssessmentsList.insert(index, item);
  void updateAllAssessmentsListAtIndex(int index, Function(dynamic) updateFn) =>
      allAssessmentsList[index] = updateFn(allAssessmentsList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get All Assessments Admin)] action in admin_rightPanel_dashboard widget.
  ApiCallResponse? getAllAssessmentsAPI;
  // Model for h1_heading_group component.
  late H1HeadingGroupModel h1HeadingGroupModel;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel;
  // Model for dashboard_widget component.
  late DashboardWidgetModel dashboardWidgetModel1;
  // Model for dashboard_widget component.
  late DashboardWidgetModel dashboardWidgetModel2;
  // Model for dashboard_widget component.
  late DashboardWidgetModel dashboardWidgetModel3;
  // Model for h2_heading_group component.
  late H2HeadingGroupModel h2HeadingGroupModel;
  // Model for assessmentsDataTable component.
  late AssessmentsDataTableModel assessmentsDataTableModel;

  @override
  void initState(BuildContext context) {
    h1HeadingGroupModel = createModel(context, () => H1HeadingGroupModel());
    secondaryButtonModel = createModel(context, () => SecondaryButtonModel());
    dashboardWidgetModel1 = createModel(context, () => DashboardWidgetModel());
    dashboardWidgetModel2 = createModel(context, () => DashboardWidgetModel());
    dashboardWidgetModel3 = createModel(context, () => DashboardWidgetModel());
    h2HeadingGroupModel = createModel(context, () => H2HeadingGroupModel());
    assessmentsDataTableModel =
        createModel(context, () => AssessmentsDataTableModel());
  }

  @override
  void dispose() {
    h1HeadingGroupModel.dispose();
    secondaryButtonModel.dispose();
    dashboardWidgetModel1.dispose();
    dashboardWidgetModel2.dispose();
    dashboardWidgetModel3.dispose();
    h2HeadingGroupModel.dispose();
    assessmentsDataTableModel.dispose();
  }
}
