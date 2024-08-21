import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_item/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_admin_left_panel_model.dart';
export 'dashboard_admin_left_panel_model.dart';

class DashboardAdminLeftPanelWidget extends StatefulWidget {
  const DashboardAdminLeftPanelWidget({
    super.key,
    int? activeTab,
    bool? showAnimation,
  })  : this.activeTab = activeTab ?? 1,
        this.showAnimation = showAnimation ?? false;

  final int activeTab;
  final bool showAnimation;

  @override
  State<DashboardAdminLeftPanelWidget> createState() =>
      _DashboardAdminLeftPanelWidgetState();
}

class _DashboardAdminLeftPanelWidgetState
    extends State<DashboardAdminLeftPanelWidget> {
  late DashboardAdminLeftPanelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardAdminLeftPanelModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.activeTab = widget!.activeTab;
      setState(() {});
    });

    _model.searchTextFieldTextController ??= TextEditingController();
    _model.searchTextFieldFocusNode ??= FocusNode();

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
      width: MediaQuery.sizeOf(context).width * 0.25,
      height: MediaQuery.sizeOf(context).height,
      constraints: BoxConstraints(
        maxWidth: 300.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: FlutterFlowTheme.of(context).alternate,
            offset: Offset(
              1.0,
              0.0,
            ),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('entry');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/SpiralDesk_Logo.jpg',
                          height: 65.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: TextFormField(
                    controller: _model.searchTextFieldTextController,
                    focusNode: _model.searchTextFieldFocusNode,
                    autofocus: false,
                    textInputAction: TextInputAction.search,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Search',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    validator: _model.searchTextFieldTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarItemModel1,
                  updateCallback: () => setState(() {}),
                  child: NavBarItemWidget(
                    isActive: widget!.activeTab == 1,
                    text: 'Dashboard',
                    icon: Icon(
                      Icons.home_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    hasChevron: false,
                    action: () async {
                      if (FFAppState().role == UserRole.Admin) {
                        context.pushNamed(
                          'admin_dashboard_assessments',
                          queryParameters: {
                            'activeTab': serializeParam(
                              1,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        context.pushNamed(
                          'user_dashboard',
                          queryParameters: {
                            'activeTab': serializeParam(
                              1,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarItemModel2,
                  updateCallback: () => setState(() {}),
                  child: NavBarItemWidget(
                    isActive: widget!.activeTab == 2,
                    text: 'Reports',
                    icon: Icon(
                      Icons.book_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    hasChevron: false,
                    action: () async {
                      if (FFAppState().role == UserRole.Admin) {
                        context.pushNamed(
                          'admin_dashboard_assessments',
                          queryParameters: {
                            'activeTab': serializeParam(
                              2,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        context.pushNamed(
                          'user_dashboard',
                          queryParameters: {
                            'activeTab': serializeParam(
                              2,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarItemModel3,
                  updateCallback: () => setState(() {}),
                  child: NavBarItemWidget(
                    isActive: widget!.activeTab == 3,
                    text: 'Evaluations',
                    icon: Icon(
                      Icons.score_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    hasChevron: false,
                    action: () async {
                      if (FFAppState().role == UserRole.Admin) {
                        context.pushNamed(
                          'admin_dashboard_assessments',
                          queryParameters: {
                            'activeTab': serializeParam(
                              3,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        context.pushNamed(
                          'user_dashboard',
                          queryParameters: {
                            'activeTab': serializeParam(
                              3,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.navBarItemModel4,
                    updateCallback: () => setState(() {}),
                    child: NavBarItemWidget(
                      isActive: widget!.activeTab == 5,
                      text: 'Support',
                      icon: Icon(
                        Icons.support_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      hasChevron: false,
                      action: () async {},
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: wrapWithModel(
                      model: _model.navBarItemModel5,
                      updateCallback: () => setState(() {}),
                      child: NavBarItemWidget(
                        isActive: widget!.activeTab == 6,
                        text: 'Settings',
                        icon: Icon(
                          Icons.settings_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        hasChevron: false,
                        action: () async {
                          context.pushNamed('settings');
                        },
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 38.0,
                              height: 38.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/951/600',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${FFAppState().user.firstName} ${FFAppState().user.lastName}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  FFAppState().user.email,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.logout_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Logout of Spiral Reports'),
                                      content:
                                          Text('Do you really want to logout'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Logout'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Are you very sure'),
                                      content: Text(
                                          'Are you sure you want to logout'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Yes'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Sayanora Sucker'),
                                  content:
                                      Text('Your system will never be secure '),
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
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth('entry', context.mounted);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
