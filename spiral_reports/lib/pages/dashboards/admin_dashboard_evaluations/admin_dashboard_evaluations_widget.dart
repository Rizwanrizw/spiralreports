import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/nav_bar_v2_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_dashboard_evaluations_model.dart';
export 'admin_dashboard_evaluations_model.dart';

class AdminDashboardEvaluationsWidget extends StatefulWidget {
  const AdminDashboardEvaluationsWidget({
    super.key,
    bool? showAnimation,
    int? activeTab,
  })  : this.showAnimation = showAnimation ?? false,
        this.activeTab = activeTab ?? 1;

  final bool showAnimation;
  final int activeTab;

  @override
  State<AdminDashboardEvaluationsWidget> createState() =>
      _AdminDashboardEvaluationsWidgetState();
}

class _AdminDashboardEvaluationsWidgetState
    extends State<AdminDashboardEvaluationsWidget> {
  late AdminDashboardEvaluationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminDashboardEvaluationsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      if (functions.checkJWTExpiry(currentAuthenticationToken!)!) {
        _model.authRefreshAPI =
            await SpiralReportsAdminAPIGroup.adminRefreshCall.call(
          userID: currentUserUid,
          refreshToken: currentAuthRefreshToken,
        );

        if ((_model.authRefreshAPI?.succeeded ?? true)) {
          // Login Refresh
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signIn(
            authenticationToken:
                SpiralReportsAdminAPIGroup.adminRefreshCall.accessToken(
              (_model.authRefreshAPI?.jsonBody ?? ''),
            ),
            refreshToken:
                SpiralReportsAdminAPIGroup.adminRefreshCall.refreshToken(
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 1440.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              wrapWithModel(
                                model: _model.h1HeadingGroupModel,
                                updateCallback: () => setState(() {}),
                                child: H1HeadingGroupWidget(
                                  heading:
                                      'Welcome back, ${currentUserData?.firstName}',
                                  subText: 'Track all your evaluations here',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 26.0, 24.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState().getAllEvaluationsAdminAPI(
                            requestFn: () => SpiralReportsAdminAPIGroup
                                .getAllEvaluationsAdminCall
                                .call(
                              accessToken: currentAuthenticationToken,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final dataTableContainerGetAllEvaluationsAdminResponse =
                                snapshot.data!;

                            return Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 1440.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Builder(
                                builder: (context) {
                                  final evalList = SpiralReportsAdminAPIGroup
                                          .getAllEvaluationsAdminCall
                                          .evaluationList(
                                            dataTableContainerGetAllEvaluationsAdminResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                                  if (evalList.isEmpty) {
                                    return Image.asset(
                                      'https://img.freepik.com/free-vector/completed-steps-concept-illustration_114360-5441.jpg?w=1480&t=st=1715957990~exp=1715958590~hmac=62e60ab9dbaa88a3e1b2bd62ca42d3bb32ba4d501b0cb1f6caac0e56c8d5c03d',
                                      width: 800.0,
                                    );
                                  }

                                  return FlutterFlowDataTable<dynamic>(
                                    controller:
                                        _model.paginatedDataTableController,
                                    data: evalList,
                                    columnsBuilder: (onSortChanged) => [
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            'Name',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            'Credits Used',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            'Domain',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            'Tokens Used',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            'Status',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      DataColumn2(
                                        label: DefaultTextStyle.merge(
                                          softWrap: true,
                                          child: Text(
                                            ' ',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    dataRowBuilder: (evalListItem,
                                            evalListIndex,
                                            selected,
                                            onSelectChanged) =>
                                        DataRow(
                                      color: MaterialStateProperty.all(
                                        evalListIndex % 2 == 0
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : Color(0xFFF9FAFB),
                                      ),
                                      cells: [
                                        Text(
                                          getJsonField(
                                            evalListItem,
                                            r'''$.title''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              getJsonField(
                                                evalListItem,
                                                r'''$.creditsUsed''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final tags = getJsonField(
                                              evalListItem,
                                              r'''$.tags''',
                                            ).toList();

                                            return Wrap(
                                              spacing: 4.0,
                                              runSpacing: 4.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: List.generate(
                                                  tags.length, (tagsIndex) {
                                                final tagsItem =
                                                    tags[tagsIndex];
                                                return Text(
                                                  tagsItem.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                        Text(
                                          getJsonField(
                                            evalListItem,
                                            r'''$.tokens.totalTokens''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary10,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            child: Text(
                                              getJsonField(
                                                evalListItem,
                                                r'''$.status''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.5,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                buttonSize: 50.0,
                                                icon: Icon(
                                                  Icons.chevron_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 28.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    'admin_dashboard_evaluations',
                                                    queryParameters: {
                                                      'activeTab':
                                                          serializeParam(
                                                        1,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                buttonSize: 50.0,
                                                icon: Icon(
                                                  Icons.more_vert,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 26.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ].divide(SizedBox(width: 15.0)),
                                          ),
                                        ),
                                      ].map((c) => DataCell(c)).toList(),
                                    ),
                                    emptyBuilder: () => Image.asset(
                                      'https://img.freepik.com/free-vector/completed-steps-concept-illustration_114360-5441.jpg?w=1480&t=st=1715957990~exp=1715958590~hmac=62e60ab9dbaa88a3e1b2bd62ca42d3bb32ba4d501b0cb1f6caac0e56c8d5c03d',
                                      width: 800.0,
                                    ),
                                    paginated: true,
                                    selectable: false,
                                    hidePaginator: false,
                                    showFirstLastButtons: false,
                                    width: double.infinity,
                                    height: double.infinity,
                                    headingRowHeight: 48.0,
                                    dataRowHeight: 72.0,
                                    columnSpacing: 20.0,
                                    headingRowColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    addHorizontalDivider: true,
                                    addTopAndBottomDivider: true,
                                    hideDefaultHorizontalDivider: true,
                                    horizontalDividerColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    horizontalDividerThickness: 1.0,
                                    addVerticalDivider: false,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(height: 120.0))
                      .addToEnd(SizedBox(height: 30.0)),
                ),
              ),
              wrapWithModel(
                model: _model.navBarV2Model,
                updateCallback: () => setState(() {}),
                child: NavBarV2Widget(
                  activePage: widget!.activeTab,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
