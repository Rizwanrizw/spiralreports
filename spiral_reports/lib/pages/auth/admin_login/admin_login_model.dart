import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/label_text_field/label_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'admin_login_widget.dart' show AdminLoginWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminLoginModel extends FlutterFlowModel<AdminLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for h1_heading_group component.
  late H1HeadingGroupModel h1HeadingGroupModel;
  // Model for email.
  late LabelTextFieldModel emailModel;
  // Model for password.
  late LabelTextFieldModel passwordModel;
  // Stores action output result for [Backend Call - API (Admin Login)] action in Button widget.
  ApiCallResponse? adminLoginAPI;

  @override
  void initState(BuildContext context) {
    h1HeadingGroupModel = createModel(context, () => H1HeadingGroupModel());
    emailModel = createModel(context, () => LabelTextFieldModel());
    passwordModel = createModel(context, () => LabelTextFieldModel());
  }

  @override
  void dispose() {
    h1HeadingGroupModel.dispose();
    emailModel.dispose();
    passwordModel.dispose();
  }
}
