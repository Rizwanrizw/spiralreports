import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/assessment_option_item_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'assessment_quiz_widget.dart' show AssessmentQuizWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AssessmentQuizModel extends FlutterFlowModel<AssessmentQuizWidget> {
  ///  Local state fields for this page.

  DataStruct? assessmentData;
  void updateAssessmentDataStruct(Function(DataStruct) updateFn) {
    updateFn(assessmentData ??= DataStruct());
  }

  List<ResponseStruct> userResponse = [];
  void addToUserResponse(ResponseStruct item) => userResponse.add(item);
  void removeFromUserResponse(ResponseStruct item) => userResponse.remove(item);
  void removeAtIndexFromUserResponse(int index) => userResponse.removeAt(index);
  void insertAtIndexInUserResponse(int index, ResponseStruct item) =>
      userResponse.insert(index, item);
  void updateUserResponseAtIndex(
          int index, Function(ResponseStruct) updateFn) =>
      userResponse[index] = updateFn(userResponse[index]);

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Single Assessment)] action in assessment_quiz widget.
  ApiCallResponse? getAssessmentData;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for secondary_button component.
  late SecondaryButtonModel secondaryButtonModel;
  // Stores action output result for [Backend Call - API (Assessment Evaluation)] action in Button widget.
  ApiCallResponse? apiResult4nh;

  @override
  void initState(BuildContext context) {
    secondaryButtonModel = createModel(context, () => SecondaryButtonModel());
  }

  @override
  void dispose() {
    secondaryButtonModel.dispose();
  }
}
