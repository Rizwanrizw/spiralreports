import '/components/primary_button/primary_button_widget.dart';
import '/components/sm_heading_item/sm_heading_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'new_page_widget.dart' show NewPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewPageModel extends FlutterFlowModel<NewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel;

  @override
  void initState(BuildContext context) {
    smHeadingItemModel = createModel(context, () => SmHeadingItemModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    smHeadingItemModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    primaryButtonModel.dispose();
  }
}
