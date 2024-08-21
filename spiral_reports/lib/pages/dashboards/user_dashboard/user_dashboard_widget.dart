import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/assessments_data_table_widget.dart';
import '/components/dashboard_admin_left_panel/dashboard_admin_left_panel_widget.dart';
import '/components/dashboard_widget/dashboard_widget_widget.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/h2_heading_group/h2_heading_group_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_dashboard_model.dart';
export 'user_dashboard_model.dart';

class UserDashboardWidget extends StatefulWidget {
  const UserDashboardWidget({
    super.key,
    bool? showAnimation,
    int? activeTab,
  })  : this.showAnimation = showAnimation ?? false,
        this.activeTab = activeTab ?? 1;

  final bool showAnimation;
  final int activeTab;

  @override
  State<UserDashboardWidget> createState() => _UserDashboardWidgetState();
}

class _UserDashboardWidgetState extends State<UserDashboardWidget> {
  late UserDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      if (functions.checkJWTExpiry(currentAuthenticationToken!)!) {
        _model.authRefreshAPI =
            await SpiralReportsUserAPIGroup.authRefreshCall.call(
          userID: currentAuthenticationToken,
          refreshToken: currentAuthRefreshToken,
        );

        if ((_model.authRefreshAPI?.succeeded ?? true)) {
          // Login Refresh
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signIn(
            authenticationToken:
                SpiralReportsUserAPIGroup.authRefreshCall.accessToken(
              (_model.authRefreshAPI?.jsonBody ?? ''),
            ),
            refreshToken:
                SpiralReportsUserAPIGroup.authRefreshCall.refreshToken(
              (_model.authRefreshAPI?.jsonBody ?? ''),
            ),
          );
          _navigate = () => context.goNamedAuth('entry', context.mounted);
        } else {
          // Logout
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          _navigate = () => context.goNamedAuth('entry', context.mounted);
        }

        return;
      } else {
        _model.activeTab = widget!.activeTab;
        setState(() {});
      }

      _navigate();
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
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.dashboardAdminLeftPanelModel,
                  updateCallback: () => setState(() {}),
                  child: DashboardAdminLeftPanelWidget(
                    activeTab: widget!.activeTab,
                    showAnimation: widget!.showAnimation,
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: Builder(
                    builder: (context) {
                      if (_model.activeTab == 1) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  wrapWithModel(
                                    model: _model.h1HeadingGroupModel,
                                    updateCallback: () => setState(() {}),
                                    child: H1HeadingGroupWidget(
                                      heading:
                                          'Welcome Back, ${FFAppState().user.firstName}',
                                      subText:
                                          'Track, manage and forecast your cyber security assessments with SpiralReports',
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AlignedTooltip(
                                        content: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            'Click to add credits',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        offset: 4.0,
                                        preferredDirection: AxisDirection.left,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        elevation: 4.0,
                                        tailBaseWidth: 24.0,
                                        tailLength: 12.0,
                                        waitDuration:
                                            Duration(milliseconds: 100),
                                        showDuration:
                                            Duration(milliseconds: 1500),
                                        triggerMode: TooltipTriggerMode.tap,
                                        child: wrapWithModel(
                                          model: _model.secondaryButtonModel,
                                          updateCallback: () => setState(() {}),
                                          child: SecondaryButtonWidget(
                                            text:
                                                '${FFAppState().user.credits.toString()} Credits Left',
                                            icon: Icon(
                                              Icons.auto_awesome_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            action: () async {
                                              context.pushNamed(
                                                'settings',
                                                queryParameters: {
                                                  'pageIndex': serializeParam(
                                                    2,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Take Assessment',
                                        icon: Icon(
                                          Icons.add_rounded,
                                          size: 24.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Color(0xFF1150F5),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Wrap(
                                  spacing: 16.0,
                                  runSpacing: 16.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    wrapWithModel(
                                      model: _model.dashboardWidgetModel1,
                                      updateCallback: () => setState(() {}),
                                      child: DashboardWidgetWidget(
                                        title: 'Total Assessments',
                                        statCount: '12',
                                        primarySubText: '40%',
                                        secondarySubText: 'up from last month',
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.dashboardWidgetModel2,
                                      updateCallback: () => setState(() {}),
                                      child: DashboardWidgetWidget(
                                        title: 'Draft Assessments',
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 18.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.h2HeadingGroupModel,
                                  updateCallback: () => setState(() {}),
                                  child: H2HeadingGroupWidget(
                                    heading: 'Assessments',
                                    subText:
                                        'All your assessments in one place',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FutureBuilder<ApiCallResponse>(
                                  future: SpiralReportsUserAPIGroup
                                      .getAllAssessmentsCall
                                      .call(
                                    acessToken: currentAuthenticationToken,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final assessmentsDataTableGetAllAssessmentsResponse =
                                        snapshot.data!;

                                    return wrapWithModel(
                                      model: _model.assessmentsDataTableModel,
                                      updateCallback: () => setState(() {}),
                                      child: AssessmentsDataTableWidget(
                                        assessmentList:
                                            SpiralReportsUserAPIGroup
                                                .getAllAssessmentsCall
                                                .assessmentData(
                                          assessmentsDataTableGetAllAssessmentsResponse
                                              .jsonBody,
                                        )!,
                                        deleteAction: (itemID) async {},
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 16.0))
                                .addToStart(SizedBox(height: 36.0))
                                .addToEnd(SizedBox(height: 24.0)),
                          ),
                        );
                      } else if (_model.activeTab == 2) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Evaluations',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        );
                      }
                    },
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
