import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'otp_bottom_sheet_widget.dart' show OtpBottomSheetWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtpBottomSheetModel extends FlutterFlowModel<OtpBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    secondaryButtonModel = createModel(context, () => SecondaryButtonModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
    secondaryButtonModel.dispose();
    primaryButtonModel.dispose();
  }
}
