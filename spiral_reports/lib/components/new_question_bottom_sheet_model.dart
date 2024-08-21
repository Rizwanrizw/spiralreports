import '/backend/schema/structs/index.dart';
import '/components/add_option_bottom_sheet_widget.dart';
import '/components/level_option_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'new_question_bottom_sheet_widget.dart'
    show NewQuestionBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewQuestionBottomSheetModel
    extends FlutterFlowModel<NewQuestionBottomSheetWidget> {
  ///  Local state fields for this component.

  List<OptionsStruct> options = [];
  void addToOptions(OptionsStruct item) => options.add(item);
  void removeFromOptions(OptionsStruct item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, OptionsStruct item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(OptionsStruct) updateFn) =>
      options[index] = updateFn(options[index]);

  int loopCurrentIndex = 1;

  List<int> levelCountList = [];
  void addToLevelCountList(int item) => levelCountList.add(item);
  void removeFromLevelCountList(int item) => levelCountList.remove(item);
  void removeAtIndexFromLevelCountList(int index) =>
      levelCountList.removeAt(index);
  void insertAtIndexInLevelCountList(int index, int item) =>
      levelCountList.insert(index, item);
  void updateLevelCountListAtIndex(int index, Function(int) updateFn) =>
      levelCountList[index] = updateFn(levelCountList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for considerScoreSwitch widget.
  bool? considerScoreSwitchValue;
  // Stores action output result for [Bottom Sheet - addOptionBottomSheet] action in levelOptionListItem widget.
  OptionsStruct? newOption;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
