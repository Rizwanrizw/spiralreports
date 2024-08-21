import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_option_bottom_sheet_widget.dart';
import '/components/large_text_field/large_text_field_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_levels_widget.dart' show AddLevelsWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddLevelsModel extends FlutterFlowModel<AddLevelsWidget> {
  ///  Local state fields for this page.

  List<QuestionSetStruct> questionSet = [];
  void addToQuestionSet(QuestionSetStruct item) => questionSet.add(item);
  void removeFromQuestionSet(QuestionSetStruct item) =>
      questionSet.remove(item);
  void removeAtIndexFromQuestionSet(int index) => questionSet.removeAt(index);
  void insertAtIndexInQuestionSet(int index, QuestionSetStruct item) =>
      questionSet.insert(index, item);
  void updateQuestionSetAtIndex(
          int index, Function(QuestionSetStruct) updateFn) =>
      questionSet[index] = updateFn(questionSet[index]);

  List<OptionsStruct> options = [];
  void addToOptions(OptionsStruct item) => options.add(item);
  void removeFromOptions(OptionsStruct item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, OptionsStruct item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(OptionsStruct) updateFn) =>
      options[index] = updateFn(options[index]);

  List<int> levels = [];
  void addToLevels(int item) => levels.add(item);
  void removeFromLevels(int item) => levels.remove(item);
  void removeAtIndexFromLevels(int index) => levels.removeAt(index);
  void insertAtIndexInLevels(int index, int item) => levels.insert(index, item);
  void updateLevelsAtIndex(int index, Function(int) updateFn) =>
      levels[index] = updateFn(levels[index]);

  int levelCounter = 0;

  ///  State fields for stateful widgets in this page.

  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel1;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Checkbox widget.
  Map<QuestionSetStruct, bool> checkboxValueMap = {};
  List<QuestionSetStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Bottom Sheet - addOptionBottomSheet] action in IconButton widget.
  OptionsStruct? newOption;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel2;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel1;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel2;
  // Stores action output result for [Backend Call - API (Create Assessment)] action in primary_button widget.
  ApiCallResponse? apiResulthjq;

  @override
  void initState(BuildContext context) {
    secondaryButtonModel1 = createModel(context, () => SecondaryButtonModel());
    secondaryButtonModel2 = createModel(context, () => SecondaryButtonModel());
    primaryButtonModel1 = createModel(context, () => PrimaryButtonModel());
    primaryButtonModel2 = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    secondaryButtonModel1.dispose();
    secondaryButtonModel2.dispose();
    primaryButtonModel1.dispose();
    primaryButtonModel2.dispose();
  }
}
