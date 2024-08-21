import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/assessment_option_item_widget.dart';
import '/components/nav_bar_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'user_assessment_quiz_widget.dart' show UserAssessmentQuizWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserAssessmentQuizModel
    extends FlutterFlowModel<UserAssessmentQuizWidget> {
  ///  Local state fields for this page.

  DataStruct? assessmentData;
  void updateAssessmentDataStruct(Function(DataStruct) updateFn) {
    updateFn(assessmentData ??= DataStruct());
  }

  List<OptionsStruct> selectedOptions = [];
  void addToSelectedOptions(OptionsStruct item) => selectedOptions.add(item);
  void removeFromSelectedOptions(OptionsStruct item) =>
      selectedOptions.remove(item);
  void removeAtIndexFromSelectedOptions(int index) =>
      selectedOptions.removeAt(index);
  void insertAtIndexInSelectedOptions(int index, OptionsStruct item) =>
      selectedOptions.insert(index, item);
  void updateSelectedOptionsAtIndex(
          int index, Function(OptionsStruct) updateFn) =>
      selectedOptions[index] = updateFn(selectedOptions[index]);

  int currentQuestionIndex = 0;

  int? currentPageViewIndex;

  int? leveCount;

  String? currentQuestion;

  int totalQuestions = 1;

  List<dynamic> userOptions = [];
  void addToUserOptions(dynamic item) => userOptions.add(item);
  void removeFromUserOptions(dynamic item) => userOptions.remove(item);
  void removeAtIndexFromUserOptions(int index) => userOptions.removeAt(index);
  void insertAtIndexInUserOptions(int index, dynamic item) =>
      userOptions.insert(index, item);
  void updateUserOptionsAtIndex(int index, Function(dynamic) updateFn) =>
      userOptions[index] = updateFn(userOptions[index]);

  int selectedOption2JSONCounter = 0;

  List<dynamic> userResponseData = [];
  void addToUserResponseData(dynamic item) => userResponseData.add(item);
  void removeFromUserResponseData(dynamic item) =>
      userResponseData.remove(item);
  void removeAtIndexFromUserResponseData(int index) =>
      userResponseData.removeAt(index);
  void insertAtIndexInUserResponseData(int index, dynamic item) =>
      userResponseData.insert(index, item);
  void updateUserResponseDataAtIndex(int index, Function(dynamic) updateFn) =>
      userResponseData[index] = updateFn(userResponseData[index]);

  List<ResponseStruct> userResponse = [];
  void addToUserResponse(ResponseStruct item) => userResponse.add(item);
  void removeFromUserResponse(ResponseStruct item) => userResponse.remove(item);
  void removeAtIndexFromUserResponse(int index) => userResponse.removeAt(index);
  void insertAtIndexInUserResponse(int index, ResponseStruct item) =>
      userResponse.insert(index, item);
  void updateUserResponseAtIndex(
          int index, Function(ResponseStruct) updateFn) =>
      userResponse[index] = updateFn(userResponse[index]);

  List<String> toolsUsed = ['Slack', 'Hotmail'];
  void addToToolsUsed(String item) => toolsUsed.add(item);
  void removeFromToolsUsed(String item) => toolsUsed.remove(item);
  void removeAtIndexFromToolsUsed(int index) => toolsUsed.removeAt(index);
  void insertAtIndexInToolsUsed(int index, String item) =>
      toolsUsed.insert(index, item);
  void updateToolsUsedAtIndex(int index, Function(String) updateFn) =>
      toolsUsed[index] = updateFn(toolsUsed[index]);

  List<UserQuestionResponseStruct> userInput = [];
  void addToUserInput(UserQuestionResponseStruct item) => userInput.add(item);
  void removeFromUserInput(UserQuestionResponseStruct item) =>
      userInput.remove(item);
  void removeAtIndexFromUserInput(int index) => userInput.removeAt(index);
  void insertAtIndexInUserInput(int index, UserQuestionResponseStruct item) =>
      userInput.insert(index, item);
  void updateUserInputAtIndex(
          int index, Function(UserQuestionResponseStruct) updateFn) =>
      userInput[index] = updateFn(userInput[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Single Assessment)] action in user_assessment_quiz widget.
  ApiCallResponse? getAssessmentData;
  // Stores action output result for [Backend Call - API (Assessment Evaluation)] action in submitResponseButton widget.
  ApiCallResponse? send4EvaluationAPI;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for navBar_v2 component.
  late NavBarV2Model navBarV2Model;

  @override
  void initState(BuildContext context) {
    navBarV2Model = createModel(context, () => NavBarV2Model());
  }

  @override
  void dispose() {
    navBarV2Model.dispose();
  }
}
