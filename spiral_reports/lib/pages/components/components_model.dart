import '/components/dashboard_admin_left_panel/dashboard_admin_left_panel_widget.dart';
import '/components/dashboard_widget/dashboard_widget_widget.dart';
import '/components/filter_chip/filter_chip_widget.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/h2_heading_group/h2_heading_group_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'components_widget.dart' show ComponentsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponentsModel extends FlutterFlowModel<ComponentsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for dashboard_admin_left_panel component.
  late DashboardAdminLeftPanelModel dashboardAdminLeftPanelModel;
  // Model for h1_heading_group component.
  late H1HeadingGroupModel h1HeadingGroupModel;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel1;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for dashboard_widget component.
  late DashboardWidgetModel dashboardWidgetModel1;
  // Model for dashboard_widget component.
  late DashboardWidgetModel dashboardWidgetModel2;
  // Model for dashboard_widget component.
  late DashboardWidgetModel dashboardWidgetModel3;
  // Model for h2_heading_group component.
  late H2HeadingGroupModel h2HeadingGroupModel;
  // Model for filter_chip component.
  late FilterChipModel filterChipModel1;
  // Model for filter_chip component.
  late FilterChipModel filterChipModel2;
  // Model for filter_chip component.
  late FilterChipModel filterChipModel3;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel2;
  // State field(s) for searchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    dashboardAdminLeftPanelModel =
        createModel(context, () => DashboardAdminLeftPanelModel());
    h1HeadingGroupModel = createModel(context, () => H1HeadingGroupModel());
    secondaryButtonModel1 = createModel(context, () => SecondaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    dashboardWidgetModel1 = createModel(context, () => DashboardWidgetModel());
    dashboardWidgetModel2 = createModel(context, () => DashboardWidgetModel());
    dashboardWidgetModel3 = createModel(context, () => DashboardWidgetModel());
    h2HeadingGroupModel = createModel(context, () => H2HeadingGroupModel());
    filterChipModel1 = createModel(context, () => FilterChipModel());
    filterChipModel2 = createModel(context, () => FilterChipModel());
    filterChipModel3 = createModel(context, () => FilterChipModel());
    secondaryButtonModel2 = createModel(context, () => SecondaryButtonModel());
  }

  @override
  void dispose() {
    dashboardAdminLeftPanelModel.dispose();
    h1HeadingGroupModel.dispose();
    secondaryButtonModel1.dispose();
    primaryButtonModel.dispose();
    dashboardWidgetModel1.dispose();
    dashboardWidgetModel2.dispose();
    dashboardWidgetModel3.dispose();
    h2HeadingGroupModel.dispose();
    filterChipModel1.dispose();
    filterChipModel2.dispose();
    filterChipModel3.dispose();
    secondaryButtonModel2.dispose();
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();
  }
}
