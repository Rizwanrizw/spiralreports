import '/components/small_text_field/small_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'label_text_field_widget.dart' show LabelTextFieldWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LabelTextFieldModel extends FlutterFlowModel<LabelTextFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for small_text_field component.
  late SmallTextFieldModel smallTextFieldModel;

  @override
  void initState(BuildContext context) {
    smallTextFieldModel = createModel(context, () => SmallTextFieldModel());
  }

  @override
  void dispose() {
    smallTextFieldModel.dispose();
  }
}
