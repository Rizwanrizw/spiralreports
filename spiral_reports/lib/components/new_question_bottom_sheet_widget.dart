import '/backend/schema/structs/index.dart';
import '/components/add_option_bottom_sheet_widget.dart';
import '/components/level_option_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_question_bottom_sheet_model.dart';
export 'new_question_bottom_sheet_model.dart';

class NewQuestionBottomSheetWidget extends StatefulWidget {
  const NewQuestionBottomSheetWidget({
    super.key,
    required this.level,
  });

  final int? level;

  @override
  State<NewQuestionBottomSheetWidget> createState() =>
      _NewQuestionBottomSheetWidgetState();
}

class _NewQuestionBottomSheetWidgetState
    extends State<NewQuestionBottomSheetWidget> {
  late NewQuestionBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewQuestionBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.loopCurrentIndex <= widget!.level!) {
        _model.addToLevelCountList(_model.loopCurrentIndex);
        setState(() {});
        _model.loopCurrentIndex = _model.loopCurrentIndex + 1;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.considerScoreSwitchValue = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 26.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 900.0,
          constraints: BoxConstraints(
            maxWidth: 1440.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(
                              context,
                              QuestionSetStruct(
                                question: _model.textController.text,
                                considerScore: _model.considerScoreSwitchValue,
                                options: _model.options,
                              ));
                        },
                        text: 'Add Question',
                        icon: Icon(
                          Icons.add,
                          size: 26.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Enter Question Here',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          lineHeight: 1.5,
                        ),
                    maxLines: null,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Switch.adaptive(
                        value: _model.considerScoreSwitchValue!,
                        onChanged: (newValue) async {
                          setState(() =>
                              _model.considerScoreSwitchValue = newValue!);
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      Expanded(
                        child: Text(
                          'Consider Score',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(23.0, 8.0, 23.0, 0.0),
                  child: Text(
                    'Question Options',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    final levelsList = _model.levelCountList.toList();

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(levelsList.length, (levelsListIndex) {
                          final levelsListItem = levelsList[levelsListIndex];
                          return LevelOptionListItemWidget(
                            key: Key(
                                'Keyfgm_${levelsListIndex}_of_${levelsList.length}'),
                            levelNumber: levelsListIndex + 1,
                            options: _model.options
                                .where((e) => e.level == (levelsListIndex + 1))
                                .toList(),
                            addOptionCallback: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AddOptionBottomSheetWidget(
                                      level: levelsListIndex + 1,
                                    ),
                                  );
                                },
                              ).then((value) =>
                                  safeSetState(() => _model.newOption = value));

                              _model.addToOptions(_model.newOption!);
                              _model.updatePage(() {});

                              setState(() {});
                            },
                          );
                        })
                                .divide(SizedBox(width: 12.0))
                                .addToStart(SizedBox(width: 23.0))
                                .addToEnd(SizedBox(width: 23.0)),
                      ),
                    );
                  },
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
