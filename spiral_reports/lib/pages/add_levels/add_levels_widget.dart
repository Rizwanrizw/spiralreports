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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_levels_model.dart';
export 'add_levels_model.dart';

class AddLevelsWidget extends StatefulWidget {
  const AddLevelsWidget({
    super.key,
    required this.levels,
    required this.title,
    this.description,
    required this.tags,
    required this.maxLevelScore,
    required this.credRequired,
  });

  final int? levels;
  final String? title;
  final String? description;
  final List<String>? tags;
  final int? maxLevelScore;
  final int? credRequired;

  @override
  State<AddLevelsWidget> createState() => _AddLevelsWidgetState();
}

class _AddLevelsWidgetState extends State<AddLevelsWidget> {
  late AddLevelsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddLevelsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToQuestionSet(QuestionSetStruct());
      setState(() {});
      while (_model.levelCounter < widget!.levels!) {
        _model.addToLevels(1);
        setState(() {});
        _model.levelCounter = _model.levelCounter + 1;
        setState(() {});
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(49.0, 56.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.secondaryButtonModel1,
                  updateCallback: () => setState(() {}),
                  child: SecondaryButtonWidget(
                    text: 'Back',
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
              Builder(
                builder: (context) {
                  final questionSetList = _model.questionSet.toList();

                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _model.pageViewController ??= PageController(
                          initialPage:
                              max(0, min(0, questionSetList.length - 1))),
                      scrollDirection: Axis.horizontal,
                      itemCount: questionSetList.length,
                      itemBuilder: (context, questionSetListIndex) {
                        final questionSetListItem =
                            questionSetList[questionSetListIndex];
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    160.0, 90.0, 160.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LargeTextFieldWidget(
                                          key: Key(
                                              'Keyhne_${questionSetListIndex}_of_${questionSetList.length}'),
                                          hintText: 'Add Question Here',
                                          isReadOnly: false,
                                          showClearField: false,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: Checkbox(
                                                value: _model.checkboxValueMap[
                                                        questionSetListItem] ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                              .checkboxValueMap[
                                                          questionSetListItem] =
                                                      newValue!);
                                                },
                                                side: BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'This Score is not considered',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            if (_model.levels.length <=
                                                widget!.levels!)
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.addToLevels(1);
                                                  setState(() {});
                                                },
                                                text: 'Add Level',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final levelList =
                                            _model.levels.toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children:
                                              List.generate(levelList.length,
                                                  (levelListIndex) {
                                            final levelListItem =
                                                levelList[levelListIndex];
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        26.0, 18.0, 18.0, 26.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Level - ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  (levelListIndex +
                                                                          1)
                                                                      .toString(),
                                                                  '1',
                                                                ),
                                                                style:
                                                                    TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              icon: Icon(
                                                                Icons.delete,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                _model.removeAtIndexFromLevels(
                                                                    levelListItem);
                                                                setState(() {});
                                                              },
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons.add,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            AddOptionBottomSheetWidget(
                                                                          level:
                                                                              valueOrDefault<int>(
                                                                            levelListIndex +
                                                                                1,
                                                                            1,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(() =>
                                                                        _model.newOption =
                                                                            value));

                                                                _model.addToOptions(
                                                                    _model
                                                                        .newOption!);
                                                                setState(() {});

                                                                setState(() {});
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ],
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final seperatedOptionsList =
                                                            functions
                                                                .getFilteredOptions(
                                                                    valueOrDefault<
                                                                        int>(
                                                                      levelListIndex +
                                                                          1,
                                                                      1,
                                                                    ),
                                                                    _model
                                                                        .options
                                                                        .toList())
                                                                .toList();

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                              seperatedOptionsList
                                                                  .length,
                                                              (seperatedOptionsListIndex) {
                                                            final seperatedOptionsListItem =
                                                                seperatedOptionsList[
                                                                    seperatedOptionsListIndex];
                                                            return Text(
                                                              seperatedOptionsListItem
                                                                  .text,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            );
                                                          }).divide(SizedBox(
                                                              height: 8.0)),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).divide(SizedBox(height: 18.0)),
                                        );
                                      },
                                    ),
                                  ]
                                      .divide(SizedBox(height: 26.0))
                                      .addToStart(SizedBox(height: 32.0))
                                      .addToEnd(SizedBox(height: 62.0)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.secondaryButtonModel2,
                        updateCallback: () => setState(() {}),
                        child: SecondaryButtonWidget(
                          text: 'Go To Previous Question',
                          icon: Icon(
                            Icons.arrow_back,
                            size: 24.0,
                          ),
                          action: () async {
                            await _model.pageViewController?.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.primaryButtonModel1,
                        updateCallback: () => setState(() {}),
                        child: PrimaryButtonWidget(
                          text: 'Save and Add Next Question',
                          icon: Icon(
                            Icons.add,
                            size: 24.0,
                          ),
                          isActive: false,
                          action: () async {
                            _model.updateQuestionSetAtIndex(
                              _model.pageViewCurrentIndex,
                              (e) => e
                                ..question = 'This is a question'
                                ..considerScore = true
                                ..options = _model.options.toList(),
                            );
                            setState(() {});
                            _model.addToQuestionSet(QuestionSetStruct());
                            _model.options = [];
                            setState(() {});
                            await _model.pageViewController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.updateQuestionSetAtIndex(
                            _model.pageViewCurrentIndex,
                            (e) => e
                              ..question = 'This is a question'
                              ..considerScore = true
                              ..options = _model.options.toList(),
                          );
                          setState(() {});
                          _model.addToQuestionSet(QuestionSetStruct());
                          _model.options = [];
                          setState(() {});
                          await _model.pageViewController?.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: wrapWithModel(
                          model: _model.primaryButtonModel2,
                          updateCallback: () => setState(() {}),
                          child: PrimaryButtonWidget(
                            text: 'Save Assessment',
                            icon: Icon(
                              Icons.add,
                              size: 24.0,
                            ),
                            isActive: false,
                            action: () async {
                              _model.apiResulthjq =
                                  await SpiralReportsAdminAPIGroup
                                      .createAssessmentCall
                                      .call(
                                title: widget!.title,
                                description: widget!.description,
                                tagsList: widget!.tags,
                                creditsRequired: widget!.credRequired,
                                levelsReq: widget!.levels,
                                maxLevelScore: widget!.maxLevelScore,
                                questionSetJson: FFAppState().testQuestionSet2,
                                status: 'DRAFT',
                                accessToken: currentAuthenticationToken,
                              );

                              if ((_model.apiResulthjq?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Assessment Created'),
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
                          ),
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
