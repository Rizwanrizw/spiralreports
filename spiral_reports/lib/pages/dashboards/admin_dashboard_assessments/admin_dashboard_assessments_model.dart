import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/nav_bar_v2_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'admin_dashboard_assessments_widget.dart'
    show AdminDashboardAssessmentsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminDashboardAssessmentsModel
    extends FlutterFlowModel<AdminDashboardAssessmentsWidget> {
  ///  Local state fields for this page.

  List<dynamic> allAssessmentList = [];
  void addToAllAssessmentList(dynamic item) => allAssessmentList.add(item);
  void removeFromAllAssessmentList(dynamic item) =>
      allAssessmentList.remove(item);
  void removeAtIndexFromAllAssessmentList(int index) =>
      allAssessmentList.removeAt(index);
  void insertAtIndexInAllAssessmentList(int index, dynamic item) =>
      allAssessmentList.insert(index, item);
  void updateAllAssessmentListAtIndex(int index, Function(dynamic) updateFn) =>
      allAssessmentList[index] = updateFn(allAssessmentList[index]);

  int activeTab = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Admin Refresh)] action in admin_dashboard_assessments widget.
  ApiCallResponse? authRefreshAPI;
  // Model for h1_heading_group component.
  late H1HeadingGroupModel h1HeadingGroupModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();
  // Model for navBar_v2 component.
  late NavBarV2Model navBarV2Model;

  @override
  void initState(BuildContext context) {
    h1HeadingGroupModel = createModel(context, () => H1HeadingGroupModel());
    navBarV2Model = createModel(context, () => NavBarV2Model());
  }

  @override
  void dispose() {
    h1HeadingGroupModel.dispose();
    paginatedDataTableController.dispose();
    navBarV2Model.dispose();
  }
}
