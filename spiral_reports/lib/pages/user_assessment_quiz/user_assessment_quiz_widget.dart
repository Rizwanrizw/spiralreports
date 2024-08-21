import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/assessment_option_item_widget.dart';
import '/components/nav_bar_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_assessment_quiz_model.dart';
export 'user_assessment_quiz_model.dart';

class UserAssessmentQuizWidget extends StatefulWidget {
  const UserAssessmentQuizWidget({
    super.key,
    required this.assessmentID,
  });

  final String? assessmentID;

  @override
  State<UserAssessmentQuizWidget> createState() =>
      _UserAssessmentQuizWidgetState();
}

class _UserAssessmentQuizWidgetState extends State<UserAssessmentQuizWidget> {
  late UserAssessmentQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserAssessmentQuizModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getAssessmentData =
          await SpiralReportsUserAPIGroup.getSingleAssessmentCall.call(
        assessmentID: widget!.assessmentID,
        acessToken: currentAuthenticationToken,
      );

      if ((_model.getAssessmentData?.succeeded ?? true)) {
        // Set AssesmentData State
        _model.assessmentData = SingleAssessmentStruct.maybeFromMap(
                (_model.getAssessmentData?.jsonBody ?? ''))
            ?.data;
        _model.leveCount =
            DataStruct.maybeFromMap((_model.getAssessmentData?.jsonBody ?? ''))
                ?.levelsReq;
        _model.currentQuestion = valueOrDefault<String>(
          (_model.assessmentData?.questionSet?[_model.currentQuestionIndex])
              ?.question,
          'Question',
        );
        _model.totalQuestions = _model.assessmentData!.questionSet.length;
        _model.addToUserInput(UserQuestionResponseStruct(
          question: _model.assessmentData?.questionSet?.first?.question,
          considerScore:
              _model.assessmentData?.questionSet?.first?.considerScore,
        ));
        setState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Failed To Get Assessments'),
              content: Text('Please try again'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        context.safePop();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 1440.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 26.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                23.0, 0.0, 23.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: ' ',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                if (valueOrDefault<bool>(
                                  _model.pageViewCurrentIndex !=
                                      (_model.assessmentData!.questionSet
                                              .length -
                                          1),
                                  true,
                                ))
                                  FFButtonWidget(
                                    onPressed: () async {
                                      // Reset Counter
                                      _model.addToUserResponse(ResponseStruct(
                                        considerScore: (_model.assessmentData
                                                    ?.questionSet?[
                                                _model.pageViewCurrentIndex])
                                            ?.considerScore,
                                        question: (_model.assessmentData
                                                    ?.questionSet?[
                                                _model.pageViewCurrentIndex])
                                            ?.question,
                                        options: _model.userOptions
                                            .map((e) =>
                                                OptionsStruct.maybeFromMap(e))
                                            .withoutNulls
                                            .toList(),
                                      ));
                                      _model.selectedOptions = [];
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                      // Set AssesmentData State
                                      _model.addToUserInput(
                                          UserQuestionResponseStruct(
                                        question: (_model.assessmentData
                                                    ?.questionSet?[
                                                _model.pageViewCurrentIndex])
                                            ?.question,
                                        considerScore: (_model.assessmentData
                                                    ?.questionSet?[
                                                _model.pageViewCurrentIndex])
                                            ?.considerScore,
                                      ));
                                      setState(() {});
                                    },
                                    text: 'Next Question',
                                    icon: Icon(
                                      Icons.add,
                                      size: 26.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                if (valueOrDefault<bool>(
                                  _model.pageViewCurrentIndex ==
                                      (_model.assessmentData!.questionSet
                                              .length -
                                          1),
                                  false,
                                ))
                                  FFButtonWidget(
                                    onPressed: () async {
                                      // Reset Counter
                                      _model.addToUserResponse(ResponseStruct(
                                        considerScore: (_model.assessmentData
                                                    ?.questionSet?[
                                                _model.pageViewCurrentIndex])
                                            ?.considerScore,
                                        question: (_model.assessmentData
                                                    ?.questionSet?[
                                                _model.pageViewCurrentIndex])
                                            ?.question,
                                        options: _model.userOptions
                                            .map((e) =>
                                                OptionsStruct.maybeFromMap(e))
                                            .withoutNulls
                                            .toList(),
                                      ));
                                      FFAppState().response = functions
                                          .mapResponseStructToJson(
                                              _model.userResponse.toList())!
                                          .toList()
                                          .cast<dynamic>();
                                      setState(() {});
                                      FFAppState().response = _model.userInput
                                          .map((e) => e.toMap())
                                          .toList()
                                          .cast<dynamic>();
                                      setState(() {});
                                      _model.send4EvaluationAPI =
                                          await SpiralReportsUserAPIGroup
                                              .assessmentEvaluationCall
                                              .call(
                                        assessmentID: widget!.assessmentID,
                                        creditsUsed:
                                            _model.assessmentData?.credReq,
                                        responseJson: _model.userInput
                                            .map((e) => e.toMap())
                                            .toList(),
                                        levels:
                                            _model.assessmentData?.levelsReq,
                                        acessToken: currentAuthenticationToken,
                                      );

                                      if ((_model
                                              .send4EvaluationAPI?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Submit success',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Submit fail',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }

                                      setState(() {});
                                    },
                                    text: 'Submit Response',
                                    icon: Icon(
                                      Icons.add,
                                      size: 26.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final assessmentQuestions = _model
                                        .assessmentData?.questionSet
                                        ?.toList() ??
                                    [];

                                return Container(
                                  width: double.infinity,
                                  height: 500.0,
                                  child: PageView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: max(
                                                0,
                                                min(
                                                    0,
                                                    assessmentQuestions.length -
                                                        1))),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: assessmentQuestions.length,
                                    itemBuilder:
                                        (context, assessmentQuestionsIndex) {
                                      final assessmentQuestionsItem =
                                          assessmentQuestions[
                                              assessmentQuestionsIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            assessmentQuestionsItem.question,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 36.0, 0.0, 0.0),
                                            child: Text(
                                              'Select Available Options',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 18.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final questionOptions =
                                                      assessmentQuestionsItem
                                                          .options
                                                          .toList();

                                                  return MasonryGridView
                                                      .builder(
                                                    gridDelegate:
                                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 4,
                                                    ),
                                                    crossAxisSpacing: 26.0,
                                                    mainAxisSpacing: 26.0,
                                                    itemCount:
                                                        questionOptions.length,
                                                    itemBuilder: (context,
                                                        questionOptionsIndex) {
                                                      final questionOptionsItem =
                                                          questionOptions[
                                                              questionOptionsIndex];
                                                      return AssessmentOptionItemWidget(
                                                        key: Key(
                                                            'Keyz25_${questionOptionsIndex}_of_${questionOptions.length}'),
                                                        text:
                                                            questionOptionsItem
                                                                .text,
                                                        isSelected: _model
                                                            .selectedOptions
                                                            .contains(
                                                                questionOptionsItem),
                                                        onTap: () async {
                                                          if (_model
                                                              .selectedOptions
                                                              .contains(
                                                                  questionOptionsItem)) {
                                                            _model.removeFromSelectedOptions(
                                                                questionOptionsItem);
                                                            setState(() {});
                                                          } else {
                                                            _model.addToSelectedOptions(
                                                                questionOptionsItem);
                                                            setState(() {});
                                                          }

                                                          _model
                                                              .updateUserInputAtIndex(
                                                            _model
                                                                .pageViewCurrentIndex,
                                                            (e) => e
                                                              ..selectedAnswer =
                                                                  _model
                                                                      .selectedOptions
                                                                      .toList(),
                                                          );
                                                          setState(() {});
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ].addToStart(SizedBox(height: 15.0)),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 90.0))
                            .addToEnd(SizedBox(height: 30.0)),
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarV2Model,
                  updateCallback: () => setState(() {}),
                  child: NavBarV2Widget(
                    activePage: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
