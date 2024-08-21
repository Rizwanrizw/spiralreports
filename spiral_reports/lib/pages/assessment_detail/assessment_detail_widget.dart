import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/dashboard_admin_left_panel/dashboard_admin_left_panel_widget.dart';
import '/components/h3_heading_group/h3_heading_group_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'assessment_detail_model.dart';
export 'assessment_detail_model.dart';

class AssessmentDetailWidget extends StatefulWidget {
  const AssessmentDetailWidget({
    super.key,
    this.showAnimation,
    required this.assessmentID,
  });

  final bool? showAnimation;
  final String? assessmentID;

  @override
  State<AssessmentDetailWidget> createState() => _AssessmentDetailWidgetState();
}

class _AssessmentDetailWidgetState extends State<AssessmentDetailWidget> {
  late AssessmentDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssessmentDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().role == UserRole.User) {
        _model.getAssessmentAPI =
            await SpiralReportsUserAPIGroup.getSingleAssessmentCall.call(
          assessmentID: widget!.assessmentID,
          acessToken: currentAuthenticationToken,
        );

        if ((_model.getAssessmentAPI?.succeeded ?? true)) {
          _model.assessmentData = (_model.getAssessmentAPI?.jsonBody ?? '');
          setState(() {});
        } else if ((_model.getAssessmentAPI?.statusCode ?? 200) == 401) {
          _model.userAuthRefreshAPI =
              await SpiralReportsUserAPIGroup.authRefreshCall.call(
            userID: currentUserUid,
            refreshToken: currentAuthRefreshToken,
          );

          if ((_model.userAuthRefreshAPI?.succeeded ?? true)) {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signIn(
              authenticationToken:
                  SpiralReportsUserAPIGroup.authRefreshCall.accessToken(
                (_model.userAuthRefreshAPI?.jsonBody ?? ''),
              ),
              refreshToken:
                  SpiralReportsUserAPIGroup.authRefreshCall.refreshToken(
                (_model.userAuthRefreshAPI?.jsonBody ?? ''),
              ),
            );
          }
        }
      } else {
        _model.getAdminAssessmentAPI =
            await SpiralReportsAdminAPIGroup.getSingleAssessmentAdminCall.call(
          assessmentID: widget!.assessmentID,
          accessToken: currentAuthenticationToken,
        );

        if ((_model.getAdminAssessmentAPI?.succeeded ?? true)) {
          _model.assessmentData =
              (_model.getAdminAssessmentAPI?.jsonBody ?? '');
          setState(() {});
        }
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
                    activeTab: 99,
                    showAnimation: widget!.showAnimation,
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 36.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary10,
                                  borderRadius: BorderRadius.circular(80.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 12.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 3.0, 6.0, 3.0),
                                          child: Text(
                                            'Product',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '15 min Assessment',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.secondaryButtonModel1,
                                    updateCallback: () => setState(() {}),
                                    child: SecondaryButtonWidget(
                                      text: 'Save For Later',
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
                                    model: _model.primaryButtonModel1,
                                    updateCallback: () => setState(() {}),
                                    child: PrimaryButtonWidget(
                                      text: 'Take Assessment',
                                      icon: Icon(
                                        Icons.add_rounded,
                                        size: 24.0,
                                      ),
                                      isActive: false,
                                      action: () async {
                                        context.pushNamed(
                                          'assessment_quiz',
                                          queryParameters: {
                                            'assessmentID': serializeParam(
                                              widget!.assessmentID,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getJsonField(
                                    _model.assessmentData,
                                    r'''$.data.title''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  getJsonField(
                                    _model.assessmentData,
                                    r'''$.data.description''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 32.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                              'https://picsum.photos/seed/856/600',
                              width: double.infinity,
                              height: 500.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 32.0, 80.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.h3HeadingGroupModel1,
                                    updateCallback: () => setState(() {}),
                                    child: H3HeadingGroupWidget(
                                      heading: getJsonField(
                                        _model.assessmentData,
                                        r'''$.data.credReq''',
                                      ).toString(),
                                      subText: 'Credits',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.h3HeadingGroupModel2,
                                    updateCallback: () => setState(() {}),
                                    child: H3HeadingGroupWidget(
                                      heading: 'Manish Kammath',
                                      subText: 'Writtern By',
                                    ),
                                  ),
                                ].divide(SizedBox(width: 69.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text:
                                                  'spiralreports://spiralreports.com${GoRouterState.of(context).uri.toString()}'));
                                        },
                                        text: 'Copy Link',
                                        icon: Icon(
                                          Icons.content_copy,
                                          size: 22.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderRadius: 12.0,
                                        borderWidth: 1.0,
                                        buttonSize: 48.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.facebook,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                      Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          buttonSize: 48.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.share_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await Share.share(
                                              'spiralreports://spiralreports.com${GoRouterState.of(context).uri.toString()}',
                                              sharePositionOrigin:
                                                  getWidgetBoundingBox(context),
                                            );
                                          },
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              66.0, 69.0, 66.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.secondaryButtonModel2,
                                  updateCallback: () => setState(() {}),
                                  child: SecondaryButtonWidget(
                                    text: 'Save For Later',
                                    icon: Icon(
                                      Icons.auto_awesome_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    action: () async {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.primaryButtonModel2,
                                  updateCallback: () => setState(() {}),
                                  child: PrimaryButtonWidget(
                                    text: 'Take Assessment',
                                    icon: Icon(
                                      Icons.add_rounded,
                                      size: 24.0,
                                    ),
                                    isActive: false,
                                    action: () async {
                                      context.pushNamed(
                                        'assessment_quiz',
                                        queryParameters: {
                                          'assessmentID': serializeParam(
                                            widget!.assessmentID,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 16.0))
                          .addToStart(SizedBox(height: 96.0))
                          .addToEnd(SizedBox(height: 190.0)),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
