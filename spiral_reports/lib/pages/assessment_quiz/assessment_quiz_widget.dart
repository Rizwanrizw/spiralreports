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
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'assessment_quiz_model.dart';
export 'assessment_quiz_model.dart';

class AssessmentQuizWidget extends StatefulWidget {
  const AssessmentQuizWidget({
    super.key,
    required this.assessmentID,
  });

  final String? assessmentID;

  @override
  State<AssessmentQuizWidget> createState() => _AssessmentQuizWidgetState();
}

class _AssessmentQuizWidgetState extends State<AssessmentQuizWidget> {
  late AssessmentQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssessmentQuizModel());

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
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  constraints: BoxConstraints(
                    maxWidth: 1100.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              120.0, 36.0, 120.0, 0.0),
                          child: Text(
                            _model.currentQuestion!,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Text(
                            'Please Select Options',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final questionLevels =
                                  (_model.assessmentData?.questionSet?[
                                              _model.currentQuestionIndex])
                                          ?.options
                                          ?.unique((e) => e.level)
                                          ?.sortedList(
                                              keyOf: (e) => e.level,
                                              desc: false)
                                          ?.toList() ??
                                      [];

                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: PageView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(
                                                    0,
                                                    min(
                                                        0,
                                                        questionLevels.length -
                                                            1))),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: questionLevels.length,
                                        itemBuilder:
                                            (context, questionLevelsIndex) {
                                          final questionLevelsItem =
                                              questionLevels[
                                                  questionLevelsIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 26.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final options = functions
                                                          .getFilteredOptions(
                                                              _model.pageViewCurrentIndex +
                                                                  1,
                                                              _model
                                                                  .assessmentData!
                                                                  .questionSet[
                                                                      _model
                                                                          .currentQuestionIndex]
                                                                  .options
                                                                  .toList())
                                                          .toList();

                                                      return Wrap(
                                                        spacing: 16.0,
                                                        runSpacing: 16.0,
                                                        alignment: WrapAlignment
                                                            .center,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: List.generate(
                                                            options.length,
                                                            (optionsIndex) {
                                                          final optionsItem =
                                                              options[
                                                                  optionsIndex];
                                                          return Container(
                                                            width: 250.0,
                                                            height: 130.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                AssessmentOptionItemWidget(
                                                              key: Key(
                                                                  'Key1ms_${optionsIndex}_of_${options.length}'),
                                                              text: optionsItem
                                                                  .text,
                                                              isSelected: _model
                                                                  .selectedOptions
                                                                  .contains(
                                                                      optionsItem),
                                                              onTap: () async {
                                                                if (_model
                                                                    .selectedOptions
                                                                    .contains(
                                                                        optionsItem)) {
                                                                  _model.removeFromSelectedOptions(
                                                                      optionsItem);
                                                                  setState(
                                                                      () {});
                                                                } else {
                                                                  _model.addToSelectedOptions(
                                                                      optionsItem);
                                                                  setState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 16.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller:
                                              _model.pageViewController ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              questionLevels
                                                                      .length -
                                                                  1))),
                                          count: questionLevels.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                            setState(() {});
                                          },
                                          effect: smooth_page_indicator
                                              .ExpandingDotsEffect(
                                            expansionFactor: 3.0,
                                            spacing: 8.0,
                                            radius: 16.0,
                                            dotWidth: 16.0,
                                            dotHeight: 8.0,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(36.0, 36.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: wrapWithModel(
                      model: _model.secondaryButtonModel,
                      updateCallback: () => setState(() {}),
                      child: SecondaryButtonWidget(
                        text: 'Go To Assessment Detail Page',
                        icon: Icon(
                          Icons.arrow_back,
                          size: 24.0,
                        ),
                        action: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await _model.pageViewController?.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                          _model.currentPageViewIndex =
                              _model.pageViewCurrentIndex;
                          setState(() {});
                        },
                        text: 'Previous Level',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await _model.pageViewController?.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                          _model.currentPageViewIndex =
                              _model.pageViewCurrentIndex;
                          setState(() {});
                        },
                        text: 'Next Level',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      if (_model.currentQuestionIndex <
                          (_model.totalQuestions - 1))
                        FFButtonWidget(
                          onPressed: () async {
                            await _model.pageViewController?.animateToPage(
                              0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            _model.currentQuestionIndex =
                                _model.currentQuestionIndex + 1;
                            _model.currentQuestion = valueOrDefault<String>(
                              (_model.assessmentData?.questionSet?[
                                      _model.currentQuestionIndex])
                                  ?.question,
                              'Question',
                            );
                            setState(() {});
                          },
                          text: 'Next Question',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      FFButtonWidget(
                        onPressed: () async {
                          _model.apiResult4nh = await SpiralReportsUserAPIGroup
                              .assessmentEvaluationCall
                              .call(
                            assessmentID: widget!.assessmentID,
                            creditsUsed: 1,
                            acessToken: currentAuthenticationToken,
                            responseJson: FFAppState().response,
                            levels: random_data.randomInteger(0, 3),
                          );

                          if ((_model.apiResult4nh?.succeeded ?? true)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Assessment Submitted'),
                                  content: Text('Submitteed'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed('entry');
                          }

                          setState(() {});
                        },
                        text: 'Submit Assessment',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
