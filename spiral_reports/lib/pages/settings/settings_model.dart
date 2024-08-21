import '/backend/schema/structs/index.dart';
import '/components/dashboard_admin_left_panel/dashboard_admin_left_panel_widget.dart';
import '/components/dashboard_widget/dashboard_widget_widget.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/h3_heading_group/h3_heading_group_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/components/sm_heading_item/sm_heading_item_widget.dart';
import '/components/small_text_field/small_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for dashboard_admin_left_panel component.
  late DashboardAdminLeftPanelModel dashboardAdminLeftPanelModel;
  // Model for h1_heading_group component.
  late H1HeadingGroupModel h1HeadingGroupModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel1;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel1;
  // State field(s) for firstName_TextField widget.
  FocusNode? firstNameTextFieldFocusNode;
  TextEditingController? firstNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameTextFieldTextControllerValidator;
  // State field(s) for lastName_TextField widget.
  FocusNode? lastNameTextFieldFocusNode;
  TextEditingController? lastNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      lastNameTextFieldTextControllerValidator;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel2;
  // State field(s) for bio_TextField widget.
  FocusNode? bioTextFieldFocusNode;
  TextEditingController? bioTextFieldTextController;
  String? Function(BuildContext, String?)? bioTextFieldTextControllerValidator;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel2;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel3;
  // State field(s) for email_TextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel4;
  // State field(s) for phone_TextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldTextController;
  final phoneTextFieldMask = MaskTextInputFormatter(mask: '+## ##### #####');
  String? Function(BuildContext, String?)?
      phoneTextFieldTextControllerValidator;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel3;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel5;
  // State field(s) for compnay_TextField widget.
  FocusNode? compnayTextFieldFocusNode;
  TextEditingController? compnayTextFieldTextController;
  String? Function(BuildContext, String?)?
      compnayTextFieldTextControllerValidator;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel6;
  // State field(s) for job_TextField widget.
  FocusNode? jobTextFieldFocusNode;
  TextEditingController? jobTextFieldTextController;
  String? Function(BuildContext, String?)? jobTextFieldTextControllerValidator;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel4;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel7;
  // State field(s) for oldPassword_TextField widget.
  FocusNode? oldPasswordTextFieldFocusNode;
  TextEditingController? oldPasswordTextFieldTextController;
  late bool oldPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      oldPasswordTextFieldTextControllerValidator;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel8;
  // State field(s) for newPassword_TextField widget.
  FocusNode? newPasswordTextFieldFocusNode;
  TextEditingController? newPasswordTextFieldTextController;
  late bool newPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      newPasswordTextFieldTextControllerValidator;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel9;
  // State field(s) for confirmPassword_TextField widget.
  FocusNode? confirmPasswordTextFieldFocusNode;
  TextEditingController? confirmPasswordTextFieldTextController;
  late bool confirmPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextFieldTextControllerValidator;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel5;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel6;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel10;
  // State field(s) for cardNumber_TextField widget.
  FocusNode? cardNumberTextFieldFocusNode;
  TextEditingController? cardNumberTextFieldTextController;
  final cardNumberTextFieldMask =
      MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)?
      cardNumberTextFieldTextControllerValidator;
  // State field(s) for expiry_TextField widget.
  FocusNode? expiryTextFieldFocusNode;
  TextEditingController? expiryTextFieldTextController;
  final expiryTextFieldMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)?
      expiryTextFieldTextControllerValidator;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel11;
  // Model for small_text_field component.
  late SmallTextFieldModel smallTextFieldModel1;
  // Model for small_text_field component.
  late SmallTextFieldModel smallTextFieldModel2;
  // Model for small_text_field component.
  late SmallTextFieldModel smallTextFieldModel3;
  // Model for small_text_field component.
  late SmallTextFieldModel smallTextFieldModel4;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel7;
  // Model for dashboard_widget component.
  late DashboardWidgetModel dashboardWidgetModel1;
  // Model for dashboard_widget component.
  late DashboardWidgetModel dashboardWidgetModel2;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel8;

  @override
  void initState(BuildContext context) {
    dashboardAdminLeftPanelModel =
        createModel(context, () => DashboardAdminLeftPanelModel());
    h1HeadingGroupModel = createModel(context, () => H1HeadingGroupModel());
    h3HeadingGroupModel1 = createModel(context, () => H3HeadingGroupModel());
    smHeadingItemModel1 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel2 = createModel(context, () => SmHeadingItemModel());
    h3HeadingGroupModel2 = createModel(context, () => H3HeadingGroupModel());
    smHeadingItemModel3 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel4 = createModel(context, () => SmHeadingItemModel());
    h3HeadingGroupModel3 = createModel(context, () => H3HeadingGroupModel());
    smHeadingItemModel5 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel6 = createModel(context, () => SmHeadingItemModel());
    h3HeadingGroupModel4 = createModel(context, () => H3HeadingGroupModel());
    smHeadingItemModel7 = createModel(context, () => SmHeadingItemModel());
    oldPasswordTextFieldVisibility = false;
    smHeadingItemModel8 = createModel(context, () => SmHeadingItemModel());
    newPasswordTextFieldVisibility = false;
    smHeadingItemModel9 = createModel(context, () => SmHeadingItemModel());
    confirmPasswordTextFieldVisibility = false;
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    h3HeadingGroupModel5 = createModel(context, () => H3HeadingGroupModel());
    h3HeadingGroupModel6 = createModel(context, () => H3HeadingGroupModel());
    smHeadingItemModel10 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel11 = createModel(context, () => SmHeadingItemModel());
    smallTextFieldModel1 = createModel(context, () => SmallTextFieldModel());
    smallTextFieldModel2 = createModel(context, () => SmallTextFieldModel());
    smallTextFieldModel3 = createModel(context, () => SmallTextFieldModel());
    smallTextFieldModel4 = createModel(context, () => SmallTextFieldModel());
    secondaryButtonModel = createModel(context, () => SecondaryButtonModel());
    h3HeadingGroupModel7 = createModel(context, () => H3HeadingGroupModel());
    dashboardWidgetModel1 = createModel(context, () => DashboardWidgetModel());
    dashboardWidgetModel2 = createModel(context, () => DashboardWidgetModel());
    h3HeadingGroupModel8 = createModel(context, () => H3HeadingGroupModel());
  }

  @override
  void dispose() {
    dashboardAdminLeftPanelModel.dispose();
    h1HeadingGroupModel.dispose();
    tabBarController?.dispose();
    h3HeadingGroupModel1.dispose();
    smHeadingItemModel1.dispose();
    firstNameTextFieldFocusNode?.dispose();
    firstNameTextFieldTextController?.dispose();

    lastNameTextFieldFocusNode?.dispose();
    lastNameTextFieldTextController?.dispose();

    smHeadingItemModel2.dispose();
    bioTextFieldFocusNode?.dispose();
    bioTextFieldTextController?.dispose();

    h3HeadingGroupModel2.dispose();
    smHeadingItemModel3.dispose();
    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    smHeadingItemModel4.dispose();
    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    h3HeadingGroupModel3.dispose();
    smHeadingItemModel5.dispose();
    compnayTextFieldFocusNode?.dispose();
    compnayTextFieldTextController?.dispose();

    smHeadingItemModel6.dispose();
    jobTextFieldFocusNode?.dispose();
    jobTextFieldTextController?.dispose();

    h3HeadingGroupModel4.dispose();
    smHeadingItemModel7.dispose();
    oldPasswordTextFieldFocusNode?.dispose();
    oldPasswordTextFieldTextController?.dispose();

    smHeadingItemModel8.dispose();
    newPasswordTextFieldFocusNode?.dispose();
    newPasswordTextFieldTextController?.dispose();

    smHeadingItemModel9.dispose();
    confirmPasswordTextFieldFocusNode?.dispose();
    confirmPasswordTextFieldTextController?.dispose();

    primaryButtonModel.dispose();
    h3HeadingGroupModel5.dispose();
    h3HeadingGroupModel6.dispose();
    smHeadingItemModel10.dispose();
    cardNumberTextFieldFocusNode?.dispose();
    cardNumberTextFieldTextController?.dispose();

    expiryTextFieldFocusNode?.dispose();
    expiryTextFieldTextController?.dispose();

    smHeadingItemModel11.dispose();
    smallTextFieldModel1.dispose();
    smallTextFieldModel2.dispose();
    smallTextFieldModel3.dispose();
    smallTextFieldModel4.dispose();
    secondaryButtonModel.dispose();
    h3HeadingGroupModel7.dispose();
    dashboardWidgetModel1.dispose();
    dashboardWidgetModel2.dispose();
    h3HeadingGroupModel8.dispose();
  }
}
