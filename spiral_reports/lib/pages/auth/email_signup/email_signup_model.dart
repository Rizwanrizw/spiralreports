import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/label_text_field/label_text_field_widget.dart';
import '/components/small_text_field/small_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'email_signup_widget.dart' show EmailSignupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailSignupModel extends FlutterFlowModel<EmailSignupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for emailTextField.
  late SmallTextFieldModel emailTextFieldModel;
  // Model for firstName.
  late LabelTextFieldModel firstNameModel;
  // Model for middleName.
  late LabelTextFieldModel middleNameModel;
  // Model for lastName.
  late LabelTextFieldModel lastNameModel;
  // Model for phoneNumber.
  late LabelTextFieldModel phoneNumberModel;
  // Model for passwordTextField.
  late SmallTextFieldModel passwordTextFieldModel;
  // Model for passwordConfirmation.
  late SmallTextFieldModel passwordConfirmationModel;
  // Stores action output result for [Backend Call - API (User Signup)] action in Button widget.
  ApiCallResponse? userCreateAPI;

  @override
  void initState(BuildContext context) {
    emailTextFieldModel = createModel(context, () => SmallTextFieldModel());
    firstNameModel = createModel(context, () => LabelTextFieldModel());
    middleNameModel = createModel(context, () => LabelTextFieldModel());
    lastNameModel = createModel(context, () => LabelTextFieldModel());
    phoneNumberModel = createModel(context, () => LabelTextFieldModel());
    passwordTextFieldModel = createModel(context, () => SmallTextFieldModel());
    passwordConfirmationModel =
        createModel(context, () => SmallTextFieldModel());
  }

  @override
  void dispose() {
    emailTextFieldModel.dispose();
    firstNameModel.dispose();
    middleNameModel.dispose();
    lastNameModel.dispose();
    phoneNumberModel.dispose();
    passwordTextFieldModel.dispose();
    passwordConfirmationModel.dispose();
  }
}
