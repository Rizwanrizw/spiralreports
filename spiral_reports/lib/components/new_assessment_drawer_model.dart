import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/add_option_component_widget.dart';
import '/components/filter_chip/filter_chip_widget.dart';
import '/components/h3_heading_group/h3_heading_group_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/question_set_question_text_field_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/components/sm_heading_item/sm_heading_item_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'new_assessment_drawer_widget.dart' show NewAssessmentDrawerWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewAssessmentDrawerModel
    extends FlutterFlowModel<NewAssessmentDrawerWidget> {
  ///  Local state fields for this component.

  List<String> tags = [];
  void addToTags(String item) => tags.add(item);
  void removeFromTags(String item) => tags.remove(item);
  void removeAtIndexFromTags(int index) => tags.removeAt(index);
  void insertAtIndexInTags(int index, String item) => tags.insert(index, item);
  void updateTagsAtIndex(int index, Function(String) updateFn) =>
      tags[index] = updateFn(tags[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for assessment_name_TextField widget.
  FocusNode? assessmentNameTextFieldFocusNode;
  TextEditingController? assessmentNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      assessmentNameTextFieldTextControllerValidator;
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
  // State field(s) for tags_TextField widget.
  FocusNode? tagsTextFieldFocusNode;
  TextEditingController? tagsTextFieldTextController;
  String? Function(BuildContext, String?)? tagsTextFieldTextControllerValidator;
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
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel;
  // Model for questionSetQuestionTextField component.
  late QuestionSetQuestionTextFieldModel questionSetQuestionTextFieldModel;
  // Model for addOptionComponent component.
  late AddOptionComponentModel addOptionComponentModel;
  // Model for sm_heading_item component.
  late SmHeadingItemModel smHeadingItemModel6;
  // Stores action output result for [Backend Call - API (Create Assessment)] action in Button widget.
  ApiCallResponse? newAssessmetCreateAPI;

  @override
  void initState(BuildContext context) {
    smHeadingItemModel1 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel2 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel3 = createModel(context, () => SmHeadingItemModel());
    h3HeadingGroupModel = createModel(context, () => H3HeadingGroupModel());
    smHeadingItemModel4 = createModel(context, () => SmHeadingItemModel());
    smHeadingItemModel5 = createModel(context, () => SmHeadingItemModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    secondaryButtonModel = createModel(context, () => SecondaryButtonModel());
    questionSetQuestionTextFieldModel =
        createModel(context, () => QuestionSetQuestionTextFieldModel());
    addOptionComponentModel =
        createModel(context, () => AddOptionComponentModel());
    smHeadingItemModel6 = createModel(context, () => SmHeadingItemModel());
  }

  @override
  void dispose() {
    assessmentNameTextFieldFocusNode?.dispose();
    assessmentNameTextFieldTextController?.dispose();

    smHeadingItemModel1.dispose();
    bioTextFieldFocusNode?.dispose();
    bioTextFieldTextController?.dispose();

    smHeadingItemModel2.dispose();
    smHeadingItemModel3.dispose();
    tagsTextFieldFocusNode?.dispose();
    tagsTextFieldTextController?.dispose();

    h3HeadingGroupModel.dispose();
    smHeadingItemModel4.dispose();
    smHeadingItemModel5.dispose();
    primaryButtonModel.dispose();
    secondaryButtonModel.dispose();
    questionSetQuestionTextFieldModel.dispose();
    addOptionComponentModel.dispose();
    smHeadingItemModel6.dispose();
  }
}
