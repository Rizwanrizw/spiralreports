import '/backend/schema/structs/index.dart';
import '/components/dashboard_admin_left_panel/dashboard_admin_left_panel_widget.dart';
import '/components/dashboard_widget/dashboard_widget_widget.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/h3_heading_group/h3_heading_group_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/components/sm_heading_item/sm_heading_item_widget.dart';
import '/components/small_text_field/small_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({
    super.key,
    int? pageIndex,
  }) : this.pageIndex = pageIndex ?? 0;

  final int pageIndex;

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget>
    with TickerProviderStateMixin {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tabBarController!.animateTo(
          widget!.pageIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.firstNameTextFieldTextController ??=
        TextEditingController(text: FFAppState().user.firstName);
    _model.firstNameTextFieldFocusNode ??= FocusNode();

    _model.lastNameTextFieldTextController ??=
        TextEditingController(text: FFAppState().user.lastName);
    _model.lastNameTextFieldFocusNode ??= FocusNode();

    _model.bioTextFieldTextController ??= TextEditingController();
    _model.bioTextFieldFocusNode ??= FocusNode();

    _model.emailTextFieldTextController ??=
        TextEditingController(text: FFAppState().user.email);
    _model.emailTextFieldFocusNode ??= FocusNode();

    _model.phoneTextFieldTextController ??=
        TextEditingController(text: FFAppState().user.phoneNumber);
    _model.phoneTextFieldFocusNode ??= FocusNode();

    _model.compnayTextFieldTextController ??= TextEditingController();
    _model.compnayTextFieldFocusNode ??= FocusNode();

    _model.jobTextFieldTextController ??= TextEditingController();
    _model.jobTextFieldFocusNode ??= FocusNode();

    _model.oldPasswordTextFieldTextController ??= TextEditingController();
    _model.oldPasswordTextFieldFocusNode ??= FocusNode();

    _model.newPasswordTextFieldTextController ??= TextEditingController();
    _model.newPasswordTextFieldFocusNode ??= FocusNode();

    _model.confirmPasswordTextFieldTextController ??= TextEditingController();
    _model.confirmPasswordTextFieldFocusNode ??= FocusNode();

    _model.cardNumberTextFieldTextController ??= TextEditingController(
        text: FFAppState().primaryPaymentMethod.cardNumber.toString());
    _model.cardNumberTextFieldFocusNode ??= FocusNode();

    _model.expiryTextFieldTextController ??= TextEditingController(
        text: FFAppState().primaryPaymentMethod.cvv.toString());
    _model.expiryTextFieldFocusNode ??= FocusNode();

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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.dashboardAdminLeftPanelModel,
                updateCallback: () => setState(() {}),
                child: DashboardAdminLeftPanelWidget(
                  showAnimation: false,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.h1HeadingGroupModel,
                      updateCallback: () => setState(() {}),
                      child: H1HeadingGroupWidget(
                        heading: 'Settings',
                        subText: 'Change all your settings here',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(-1.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor: FlutterFlowTheme.of(context).primary,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelPadding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              padding: EdgeInsets.all(4.0),
                              tabs: [
                                Tab(
                                  text: 'Profile',
                                ),
                                Tab(
                                  text: 'Security',
                                ),
                                Tab(
                                  text: 'Credits',
                                ),
                                Tab(
                                  text: 'Usage History',
                                ),
                                Tab(
                                  text: 'Notifications',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [
                                  () async {},
                                  () async {},
                                  () async {},
                                  () async {},
                                  () async {}
                                ][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.h3HeadingGroupModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: H3HeadingGroupWidget(
                                              heading: 'Personal Information',
                                              subText:
                                                  'Update your photo and personal details here',
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                decoration: BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .smHeadingItemModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: SmHeadingItemWidget(
                                                    heading: 'Your Name',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 800.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .firstNameTextFieldTextController,
                                                          focusNode: _model
                                                              .firstNameTextFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.firstNameTextFieldTextController',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () async {
                                                              FFAppState()
                                                                  .updateUserStruct(
                                                                (e) => e
                                                                  ..firstName =
                                                                      _model
                                                                          .firstNameTextFieldTextController
                                                                          .text,
                                                              );
                                                              setState(() {});
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'First Name',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          validator: _model
                                                              .firstNameTextFieldTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .lastNameTextFieldTextController,
                                                          focusNode: _model
                                                              .lastNameTextFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.lastNameTextFieldTextController',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () async {
                                                              FFAppState()
                                                                  .updateUserStruct(
                                                                (e) => e
                                                                  ..lastName =
                                                                      _model
                                                                          .lastNameTextFieldTextController
                                                                          .text,
                                                              );
                                                              setState(() {});
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Last Name',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          validator: _model
                                                              .lastNameTextFieldTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 24.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 32.0)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model:
                                                    _model.smHeadingItemModel2,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SmHeadingItemWidget(
                                                  heading: 'Your Bio',
                                                  subText:
                                                      'Update your personal biography',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 800.0,
                                              height: 170.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .bioTextFieldTextController,
                                                  focusNode: _model
                                                      .bioTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    hintText:
                                                        'Add your bio here',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  maxLines: 10,
                                                  maxLength: 275,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  validator: _model
                                                      .bioTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 32.0)),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        wrapWithModel(
                                          model: _model.h3HeadingGroupModel2,
                                          updateCallback: () => setState(() {}),
                                          child: H3HeadingGroupWidget(
                                            heading: 'Contact Information',
                                            subText:
                                                'Update your contact information here',
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model:
                                                    _model.smHeadingItemModel3,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SmHeadingItemWidget(
                                                  heading: 'Your Email',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 800.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .emailTextFieldTextController,
                                                        focusNode: _model
                                                            .emailTextFieldFocusNode,
                                                        autofocus: false,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'youremail@company.com',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .emailTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 32.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model:
                                                    _model.smHeadingItemModel4,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SmHeadingItemWidget(
                                                  heading: 'Your Phone',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 800.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .phoneTextFieldTextController,
                                                        focusNode: _model
                                                            .phoneTextFieldFocusNode,
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          FFAppState()
                                                              .updateUserStruct(
                                                            (e) => e
                                                              ..phoneNumber = _model
                                                                  .phoneTextFieldTextController
                                                                  .text,
                                                          );
                                                          setState(() {});
                                                        },
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Phone Number',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .phoneTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          _model
                                                              .phoneTextFieldMask
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 32.0)),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        wrapWithModel(
                                          model: _model.h3HeadingGroupModel3,
                                          updateCallback: () => setState(() {}),
                                          child: H3HeadingGroupWidget(
                                            heading: 'Company Information',
                                            subText:
                                                'Update your company information here',
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model:
                                                    _model.smHeadingItemModel5,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SmHeadingItemWidget(
                                                  heading: 'Company Name',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 800.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .compnayTextFieldTextController,
                                                        focusNode: _model
                                                            .compnayTextFieldFocusNode,
                                                        autofocus: false,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Company Name',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .compnayTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 32.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model:
                                                    _model.smHeadingItemModel6,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SmHeadingItemWidget(
                                                  heading: 'Job Position',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 800.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .jobTextFieldTextController,
                                                        focusNode: _model
                                                            .jobTextFieldFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'Job Title',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .jobTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 32.0)),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 26.0))
                                          .addToEnd(SizedBox(height: 130.0)),
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.h3HeadingGroupModel4,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: H3HeadingGroupWidget(
                                              heading: 'Password Settings',
                                              subText:
                                                  'Update your photo and personal details here',
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model:
                                                    _model.smHeadingItemModel7,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SmHeadingItemWidget(
                                                  heading: 'Current Password',
                                                  subText:
                                                      'Password you use currently',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 800.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .oldPasswordTextFieldTextController,
                                                        focusNode: _model
                                                            .oldPasswordTextFieldFocusNode,
                                                        autofocus: false,
                                                        obscureText: !_model
                                                            .oldPasswordTextFieldVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Current Password',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .oldPasswordTextFieldVisibility =
                                                                  !_model
                                                                      .oldPasswordTextFieldVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.oldPasswordTextFieldVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .oldPasswordTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 32.0)),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model:
                                                    _model.smHeadingItemModel8,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SmHeadingItemWidget(
                                                  heading: 'New Password',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 800.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .newPasswordTextFieldTextController,
                                                        focusNode: _model
                                                            .newPasswordTextFieldFocusNode,
                                                        autofocus: false,
                                                        obscureText: !_model
                                                            .newPasswordTextFieldVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'New Password',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .newPasswordTextFieldVisibility =
                                                                  !_model
                                                                      .newPasswordTextFieldVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.newPasswordTextFieldVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .newPasswordTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 32.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model:
                                                    _model.smHeadingItemModel9,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SmHeadingItemWidget(
                                                  heading:
                                                      'Confirm New Password',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 800.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .confirmPasswordTextFieldTextController,
                                                        focusNode: _model
                                                            .confirmPasswordTextFieldFocusNode,
                                                        autofocus: false,
                                                        obscureText: !_model
                                                            .confirmPasswordTextFieldVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Confirm New Password',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .confirmPasswordTextFieldVisibility =
                                                                  !_model
                                                                      .confirmPasswordTextFieldVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.confirmPasswordTextFieldVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .confirmPasswordTextFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 32.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 26.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 500.0,
                                                  decoration: BoxDecoration(),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .primaryButtonModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: PrimaryButtonWidget(
                                                      text: 'Update Password',
                                                      icon: Icon(
                                                        Icons
                                                            .change_circle_outlined,
                                                        size: 24.0,
                                                      ),
                                                      isActive: false,
                                                      action: () async {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Text(
                                                  'Change in password will only take effect after you confirm password change email',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                      ]
                                          .divide(SizedBox(height: 26.0))
                                          .addToEnd(SizedBox(height: 130.0)),
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.h3HeadingGroupModel5,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: H3HeadingGroupWidget(
                                              heading: 'Credit Summary',
                                              subText:
                                                  'Update your photo and personal details here',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(24.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Credit Usage Summary',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '93',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      'Total Credits',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: '  ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      'up from last month',
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
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 24.0)),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '2,332',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      'Estimated Spend',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: ' ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      'Billing in INR',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xA557636C),
                                                                  ),
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
                                                        ],
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 24.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        wrapWithModel(
                                          model: _model.h3HeadingGroupModel6,
                                          updateCallback: () => setState(() {}),
                                          child: H3HeadingGroupWidget(
                                            heading: 'Billing Information',
                                            subText:
                                                'Update your photo and personal details here',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                decoration: BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .smHeadingItemModel10,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: SmHeadingItemWidget(
                                                    heading: 'Primary Method',
                                                    subText:
                                                        'Primarily used for payment',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 800.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 5,
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .cardNumberTextFieldTextController,
                                                          focusNode: _model
                                                              .cardNumberTextFieldFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Card Number',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .cardNumberTextFieldTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            _model
                                                                .cardNumberTextFieldMask
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .expiryTextFieldTextController,
                                                          focusNode: _model
                                                              .expiryTextFieldFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Card Number',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .expiryTextFieldTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            _model
                                                                .expiryTextFieldMask
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 24.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 32.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 300.0,
                                                decoration: BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .smHeadingItemModel11,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: SmHeadingItemWidget(
                                                    heading:
                                                        'Additional Payment Methods',
                                                    subText:
                                                        'Primarily used for payment',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 800.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .smallTextFieldModel1,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                SmallTextFieldWidget(
                                                              initialValue:
                                                                  '4261 2354 1222 1421',
                                                              hintText:
                                                                  'First Name',
                                                              isReadOnly: true,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .smallTextFieldModel2,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                SmallTextFieldWidget(
                                                              initialValue:
                                                                  '01/ 29',
                                                              hintText:
                                                                  'Second Name',
                                                              isReadOnly: true,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 24.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .smallTextFieldModel3,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                SmallTextFieldWidget(
                                                              initialValue:
                                                                  '4261 5332 1233 1242',
                                                              hintText:
                                                                  'First Name',
                                                              isReadOnly: true,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .smallTextFieldModel4,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                SmallTextFieldWidget(
                                                              initialValue:
                                                                  '11/ 26',
                                                              hintText:
                                                                  'Second Name',
                                                              isReadOnly: true,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 24.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 32.0)),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.secondaryButtonModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: SecondaryButtonWidget(
                                              text:
                                                  'Add Additional Payment Method',
                                              icon: Icon(
                                                Icons.add_card,
                                                size: 24.0,
                                              ),
                                              action: () async {},
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 26.0))
                                          .addToEnd(SizedBox(height: 130.0)),
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.h3HeadingGroupModel7,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: H3HeadingGroupWidget(
                                              heading: 'View Your Credit Usage',
                                              subText:
                                                  'All your assessment credit usage in one single place',
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model:
                                                  _model.dashboardWidgetModel1,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: DashboardWidgetWidget(
                                                title: 'Total Assessments',
                                                statCount: '321',
                                                primarySubText: '40%',
                                                secondarySubText:
                                                    'up from last month',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.dashboardWidgetModel2,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: DashboardWidgetWidget(
                                                title: 'Total Evaluations',
                                                statCount: '21',
                                                primarySubText: '55%',
                                                secondarySubText:
                                                    'up from last month',
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 24.0)),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                'Title',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                'Subtitle goes here...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              dense: false,
                                            ),
                                          ],
                                        ),
                                      ]
                                          .divide(SizedBox(height: 26.0))
                                          .addToEnd(SizedBox(height: 130.0)),
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.h3HeadingGroupModel8,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: H3HeadingGroupWidget(
                                              heading: 'Your Activity',
                                              subText:
                                                  'All your assessment credit usage in one single place',
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                'Update ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                'Subtitle goes here...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              dense: false,
                                            ),
                                            ListTile(
                                              title: Text(
                                                'Title',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                'Subtitle goes here...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              dense: false,
                                            ),
                                            ListTile(
                                              title: Text(
                                                'Title',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                'Subtitle goes here...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              dense: false,
                                            ),
                                            ListTile(
                                              title: Text(
                                                'Title',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                'Subtitle goes here...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              dense: false,
                                            ),
                                          ],
                                        ),
                                      ]
                                          .divide(SizedBox(height: 26.0))
                                          .addToEnd(SizedBox(height: 130.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ].divide(SizedBox(width: 32.0)),
          ),
        ),
      ),
    );
  }
}
