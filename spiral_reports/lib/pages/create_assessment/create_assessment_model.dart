import '/backend/schema/structs/index.dart';
import '/components/filter_chip/filter_chip_widget.dart';
import '/components/h3_heading_group/h3_heading_group_widget.dart';
import '/components/new_question_bottom_sheet_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/sm_heading_item/sm_heading_item_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_assessment_widget.dart' show CreateAssessmentWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAssessmentModel extends FlutterFlowModel<CreateAssessmentWidget> {
  ///  Local state fields for this page.

  List<String> tags = [];
  void addToTags(String item) => tags.add(item);
  void removeFromTags(String item) => tags.remove(item);
  void removeAtIndexFromTags(int index) => tags.removeAt(index);
  void insertAtIndexInTags(int index, String item) => tags.insert(index, item);
  void updateTagsAtIndex(int index, Function(String) updateFn) =>
      tags[index] = updateFn(tags[index]);

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

  List<int> levels = [];
  void addToLevels(int item) => levels.add(item);
  void removeFromLevels(int item) => levels.remove(item);
  void removeAtIndexFromLevels(int index) => levels.removeAt(index);
  void insertAtIndexInLevels(int index, int item) => levels.insert(index, item);
  void updateLevelsAtIndex(int index, Function(int) updateFn) =>
      levels[index] = updateFn(levels[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel1;
  // State field(s) for bio_TextField widget.
  FocusNode? bioTextFieldFocusNode;
  TextEditingController? bioTextFieldTextController;
  String? Function(BuildContext, String?)? bioTextFieldTextControllerValidator;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel2;
  // State field(s) for credits_CountController widget.
  int? creditsCountControllerValue;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel3;
  // State field(s) for addTagsField widget.
  FocusNode? addTagsFieldFocusNode;
  TextEditingController? addTagsFieldTextController;
  String? Function(BuildContext, String?)? addTagsFieldTextControllerValidator;
  // Model for h3_heading_group component.
  late H3HeadingGroupModel h3HeadingGroupModel;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel4;
  // State field(s) for leveles_CountController widget.
  int? levelesCountControllerValue;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel5;
  // State field(s) for score_CountController widget.
  int? scoreCountControllerValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for primary_button component.
  late PrimaryButtonModel primaryButtonModel;
  // Stores action output result for [Bottom Sheet - newQuestionBottomSheet] action in Button widget.
  QuestionSetStruct? newQuestion;
  // State field(s) for asssessmentTitle widget.
  FocusNode? asssessmentTitleFocusNode;
  TextEditingController? asssessmentTitleTextController;
  String? Function(BuildContext, String?)?
      asssessmentTitleTextControllerValidator;

  @override
  void initState(BuildContext context) {
    smHeadingItemModel1 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel2 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel3 = createModel(context, () => SmHeadingItemModel());
    h3HeadingGroupModel = createModel(context, () => H3HeadingGroupModel());
    smHeadingItemModel4 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel5 = createModel(context, () => SmHeadingItemModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    smHeadingItemModel1.dispose();
    bioTextFieldFocusNode?.dispose();
    bioTextFieldTextController?.dispose();

    smHeadingItemModel2.dispose();
    smHeadingItemModel3.dispose();
    addTagsFieldFocusNode?.dispose();
    addTagsFieldTextController?.dispose();

    h3HeadingGroupModel.dispose();
    smHeadingItemModel4.dispose();
    smHeadingItemModel5.dispose();
    primaryButtonModel.dispose();
    asssessmentTitleFocusNode?.dispose();
    asssessmentTitleTextController?.dispose();
  }
}
