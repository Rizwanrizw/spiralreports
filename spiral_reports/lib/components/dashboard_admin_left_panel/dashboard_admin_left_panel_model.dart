import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_item/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_admin_left_panel_widget.dart'
    show DashboardAdminLeftPanelWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardAdminLeftPanelModel
    extends FlutterFlowModel<DashboardAdminLeftPanelWidget> {
  ///  Local state fields for this component.

  int? activeTab = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for searchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;
  // Model for navBar_item component.
  late NavBarItemModel navBarItemModel1;
  // Model for navBar_item component.
  late NavBarItemModel navBarItemModel2;
  // Model for navBar_item component.
  late NavBarItemModel navBarItemModel3;
  // Model for navBar_item component.
  late NavBarItemModel navBarItemModel4;
  // Model for navBar_item component.
  late NavBarItemModel navBarItemModel5;

  @override
  void initState(BuildContext context) {
    navBarItemModel1 = createModel(context, () => NavBarItemModel());
    navBarItemModel2 = createModel(context, () => NavBarItemModel());
    navBarItemModel3 = createModel(context, () => NavBarItemModel());
    navBarItemModel4 = createModel(context, () => NavBarItemModel());
    navBarItemModel5 = createModel(context, () => NavBarItemModel());
  }

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();

    navBarItemModel1.dispose();
    navBarItemModel2.dispose();
    navBarItemModel3.dispose();
    navBarItemModel4.dispose();
    navBarItemModel5.dispose();
  }
}
