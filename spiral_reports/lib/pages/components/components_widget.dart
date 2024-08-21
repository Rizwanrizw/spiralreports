import '/components/dashboard_admin_left_panel/dashboard_admin_left_panel_widget.dart';
import '/components/dashboard_widget/dashboard_widget_widget.dart';
import '/components/filter_chip/filter_chip_widget.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/h2_heading_group/h2_heading_group_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'components_model.dart';
export 'components_model.dart';

class ComponentsWidget extends StatefulWidget {
  const ComponentsWidget({super.key});

  @override
  State<ComponentsWidget> createState() => _ComponentsWidgetState();
}

class _ComponentsWidgetState extends State<ComponentsWidget> {
  late ComponentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentsModel());

    _model.searchTextFieldTextController ??= TextEditingController();
    _model.searchTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.dashboardAdminLeftPanelModel,
                updateCallback: () => setState(() {}),
                child: DashboardAdminLeftPanelWidget(
                  showAnimation: false,
                ),
              ),
              Flexible(
                flex: 7,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 36.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              wrapWithModel(
                                model: _model.h1HeadingGroupModel,
                                updateCallback: () => setState(() {}),
                                child: H1HeadingGroupWidget(
                                  heading: 'Welcome Back, Balu',
                                  subText:
                                      'Track, manage and forecast your cyber security assessments with SpiralReports',
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.secondaryButtonModel1,
                                    updateCallback: () => setState(() {}),
                                    child: SecondaryButtonWidget(
                                      text: '3 Credits Left',
                                      icon: Icon(
                                        Icons.auto_awesome_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      action: () async {},
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.primaryButtonModel,
                                    updateCallback: () => setState(() {}),
                                    child: PrimaryButtonWidget(
                                      text: 'New Assessment',
                                      icon: Icon(
                                        Icons.add_rounded,
                                        size: 24.0,
                                      ),
                                      isActive: false,
                                      action: () async {},
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.dashboardWidgetModel1,
                                updateCallback: () => setState(() {}),
                                child: DashboardWidgetWidget(
                                  title: 'Total Assessments',
                                  statCount: '321',
                                  primarySubText: '40%',
                                  secondarySubText: 'up from last month',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.dashboardWidgetModel2,
                                updateCallback: () => setState(() {}),
                                child: DashboardWidgetWidget(
                                  title: 'Total Evaluations',
                                  statCount: '21',
                                  primarySubText: '55%',
                                  secondarySubText: 'up from last month',
                                ),
                              ),
                              wrapWithModel(
                                model: _model.dashboardWidgetModel3,
                                updateCallback: () => setState(() {}),
                                child: DashboardWidgetWidget(
                                  title: 'Total Reports',
                                  statCount: '99',
                                  primarySubText: '12%',
                                  secondarySubText: 'up from last month',
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.h2HeadingGroupModel,
                            updateCallback: () => setState(() {}),
                            child: H2HeadingGroupWidget(
                              heading: 'Assessments',
                              subText: 'All your assessments in one place',
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.filterChipModel1,
                                  updateCallback: () => setState(() {}),
                                  child: FilterChipWidget(
                                    text: 'All Time',
                                    action: () async {},
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.filterChipModel2,
                                  updateCallback: () => setState(() {}),
                                  child: FilterChipWidget(
                                    text: 'May 1 - 15',
                                    action: () async {},
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.filterChipModel3,
                                  updateCallback: () => setState(() {}),
                                  child: FilterChipWidget(
                                    text: 'March 15 - 30',
                                    action: () async {},
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.secondaryButtonModel2,
                                  updateCallback: () => setState(() {}),
                                  child: SecondaryButtonWidget(
                                    text: 'More Filters',
                                    icon: Icon(
                                      Icons.filter_list_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    action: () async {},
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Container(
                              width: 320.0,
                              child: TextFormField(
                                controller:
                                    _model.searchTextFieldTextController,
                                focusNode: _model.searchTextFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchTextFieldTextController',
                                  Duration(milliseconds: 1000),
                                  () => setState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Search',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                  ),
                                  suffixIcon: _model
                                          .searchTextFieldTextController!
                                          .text
                                          .isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.searchTextFieldTextController
                                                ?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            size: 20.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                validator: _model
                                    .searchTextFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 24.0)),
          ),
        ),
      ),
    );
  }
}
