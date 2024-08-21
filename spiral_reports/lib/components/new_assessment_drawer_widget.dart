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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_assessment_drawer_model.dart';
export 'new_assessment_drawer_model.dart';

class NewAssessmentDrawerWidget extends StatefulWidget {
  const NewAssessmentDrawerWidget({super.key});

  @override
  State<NewAssessmentDrawerWidget> createState() =>
      _NewAssessmentDrawerWidgetState();
}

class _NewAssessmentDrawerWidgetState extends State<NewAssessmentDrawerWidget> {
  late NewAssessmentDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewAssessmentDrawerModel());

    _model.assessmentNameTextFieldTextController ??= TextEditingController();
    _model.assessmentNameTextFieldFocusNode ??= FocusNode();

    _model.bioTextFieldTextController ??= TextEditingController();
    _model.bioTextFieldFocusNode ??= FocusNode();

    _model.tagsTextFieldTextController ??= TextEditingController();
    _model.tagsTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 900.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Container(
        width: double.infinity,
        height: 500.0,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _model.pageViewController ??=
              PageController(initialPage: 0),
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller:
                              _model.assessmentNameTextFieldTextController,
                          focusNode: _model.assessmentNameTextFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.assessmentNameTextFieldTextController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter Assessment Name',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 21.0,
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
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsets.all(18.0),
                            suffixIcon: _model
                                    .assessmentNameTextFieldTextController!
                                    .text
                                    .isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model
                                          .assessmentNameTextFieldTextController
                                          ?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 21.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model
                              .assessmentNameTextFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300.0,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.smHeadingItemModel1,
                            updateCallback: () => setState(() {}),
                            child: SmHeadingItemWidget(
                              heading: 'Description',
                              subText: 'Write a short introduction.',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 200.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: TextFormField(
                                        controller:
                                            _model.bioTextFieldTextController,
                                        focusNode: _model.bioTextFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Description',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: null,
                                        validator: _model
                                            .bioTextFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 32.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300.0,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.smHeadingItemModel2,
                            updateCallback: () => setState(() {}),
                            child: SmHeadingItemWidget(
                              heading: 'Credits Needed',
                              subText:
                                  'Enter Required Credits to take this assessment',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 160.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.minus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    incrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    count: _model
                                        .creditsCountControllerValue ??= 0,
                                    updateCount: (count) => setState(() =>
                                        _model.creditsCountControllerValue =
                                            count),
                                    stepSize: 1,
                                    minimum: 0,
                                    maximum: 10,
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 32.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300.0,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.smHeadingItemModel3,
                            updateCallback: () => setState(() {}),
                            child: SmHeadingItemWidget(
                              heading: 'Tags',
                              subText: 'Write a short introduction.',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.tagsTextFieldTextController,
                                    focusNode: _model.tagsTextFieldFocusNode,
                                    onFieldSubmitted: (_) async {
                                      _model.addToTags(_model
                                          .tagsTextFieldTextController.text);
                                      setState(() {});
                                      setState(() {
                                        _model.tagsTextFieldTextController
                                            ?.clear();
                                      });
                                    },
                                    autofocus: false,
                                    textInputAction: TextInputAction.send,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Add Tags',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding: EdgeInsets.all(16.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model
                                        .tagsTextFieldTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final tagList = _model.tags.toList();

                                    return Wrap(
                                      spacing: 12.0,
                                      runSpacing: 12.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(tagList.length,
                                          (tagListIndex) {
                                        final tagListItem =
                                            tagList[tagListIndex];
                                        return FilterChipWidget(
                                          key: Key(
                                              'Keygrg_${tagListIndex}_of_${tagList.length}'),
                                          text: tagListItem,
                                          action: () async {
                                            _model.removeAtIndexFromTags(
                                                tagListIndex);
                                            setState(() {});
                                          },
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 32.0)),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    wrapWithModel(
                      model: _model.h3HeadingGroupModel,
                      updateCallback: () => setState(() {}),
                      child: H3HeadingGroupWidget(
                        heading: 'Level Information',
                        subText: 'Update your photo and personal details here.',
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300.0,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.smHeadingItemModel4,
                            updateCallback: () => setState(() {}),
                            child: SmHeadingItemWidget(
                              heading: 'Level Score',
                              subText: 'Enter Maximum score for this level',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 160.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.minus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    incrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    count: _model
                                        .levelesCountControllerValue ??= 0,
                                    updateCount: (count) => setState(() =>
                                        _model.levelesCountControllerValue =
                                            count),
                                    stepSize: 1,
                                    minimum: 0,
                                    maximum: 10,
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 32.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300.0,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.smHeadingItemModel5,
                            updateCallback: () => setState(() {}),
                            child: SmHeadingItemWidget(
                              heading: 'Score for Each Level',
                              subText: ' ',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 160.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.minus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    incrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    count: _model.scoreCountControllerValue ??=
                                        0,
                                    updateCount: (count) => setState(() =>
                                        _model.scoreCountControllerValue =
                                            count),
                                    stepSize: 1,
                                    minimum: 0,
                                    maximum: 10,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue ??= false,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.checkboxValue = newValue!);
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                    Flexible(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Add Zero Score to',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: ' ',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: _model
                                                  .assessmentNameTextFieldTextController
                                                  .text,
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 32.0)),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.primaryButtonModel,
                            updateCallback: () => setState(() {}),
                            child: PrimaryButtonWidget(
                              text: 'Add Questions',
                              icon: Icon(
                                Icons.add_rounded,
                                size: 24.0,
                              ),
                              isActive: false,
                              action: () async {
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 32.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.secondaryButtonModel,
                      updateCallback: () => setState(() {}),
                      child: SecondaryButtonWidget(
                        text: 'Back',
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
                    Flexible(
                      child: Text(
                        _model.assessmentNameTextFieldTextController.text,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model:
                                      _model.questionSetQuestionTextFieldModel,
                                  updateCallback: () => setState(() {}),
                                  child: QuestionSetQuestionTextFieldWidget(),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Add Options',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      buttonSize: 36.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 20.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    wrapWithModel(
                                      model: _model.addOptionComponentModel,
                                      updateCallback: () => setState(() {}),
                                      child: AddOptionComponentWidget(
                                        text: 'dkjnalsda',
                                        hintText: 'Type Option Here',
                                        levelCount: 121,
                                        addQuestionButton: () async {},
                                        editButton: () async {},
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 26.0)),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            42.0, 16.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.smHeadingItemModel6,
                                    updateCallback: () => setState(() {}),
                                    child: SmHeadingItemWidget(
                                      heading: 'Add Level',
                                      subText:
                                          'Add a new level to your assessment',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF9FAFB),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 60.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.newAssessmetCreateAPI =
                              await SpiralReportsAdminAPIGroup
                                  .createAssessmentCall
                                  .call(
                            title: _model
                                .assessmentNameTextFieldTextController.text,
                            description: _model.bioTextFieldTextController.text,
                            tagsList: _model.tags,
                            creditsRequired: _model.creditsCountControllerValue,
                            levelsReq: _model.levelesCountControllerValue,
                            maxLevelScore: _model.scoreCountControllerValue,
                            questionSetJson: FFAppState().testQuestionSet2,
                            status: 'DRAFT',
                            accessToken: currentAuthenticationToken,
                          );

                          if ((_model.newAssessmetCreateAPI?.succeeded ??
                              true)) {
                            Navigator.pop(context);
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Couldnt Create Assessment'),
                                  content: Text(getJsonField(
                                    (_model.newAssessmetCreateAPI?.jsonBody ??
                                        ''),
                                    r'''$.message''',
                                  ).toString()),
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
                          }

                          setState(() {});
                        },
                        text: 'Create New Assessment',
                        options: FFButtonOptions(
                          width: double.infinity,
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
                    ),
                  ]
                      .divide(SizedBox(height: 26.0))
                      .addToStart(SizedBox(height: 32.0))
                      .addToEnd(SizedBox(height: 62.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
