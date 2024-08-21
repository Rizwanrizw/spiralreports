import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'entry_model.dart';
export 'entry_model.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({super.key});

  @override
  State<EntryWidget> createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  late EntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        if (FFAppState().role == UserRole.User) {
          _model.userAssessmentAPI =
              await SpiralReportsUserAPIGroup.getAllAssessmentsCall.call(
            acessToken: currentAuthenticationToken,
          );

          if ((_model.userAssessmentAPI?.succeeded ?? true)) {
            FFAppState().assessmentsList =
                SpiralReportsUserAPIGroup.getAllAssessmentsCall
                    .assessmentData(
                      (_model.userAssessmentAPI?.jsonBody ?? ''),
                    )!
                    .toList()
                    .cast<dynamic>();
          } else if ((_model.userAssessmentAPI?.statusCode ?? 200) == 401) {
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Could\'nt Fetch Assessments',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
        } else {
          _model.adminAssessmentsAPI =
              await SpiralReportsAdminAPIGroup.getAllAssessmentsAdminCall.call(
            accessToken: currentAuthenticationToken,
          );

          if ((_model.adminAssessmentsAPI?.succeeded ?? true)) {
            FFAppState().assessmentsList =
                SpiralReportsAdminAPIGroup.getAllAssessmentsAdminCall
                    .assessmentList(
                      (_model.adminAssessmentsAPI?.jsonBody ?? ''),
                    )!
                    .toList()
                    .cast<dynamic>();
          } else if ((_model.adminAssessmentsAPI?.statusCode ?? 200) == 401) {
            _model.adminAuthRefreshAPI =
                await SpiralReportsAdminAPIGroup.adminRefreshCall.call(
              userID: currentUserUid,
              refreshToken: currentAuthRefreshToken,
            );

            GoRouter.of(context).prepareAuthEvent();
            await authManager.signIn(
              authenticationToken: getJsonField(
                (_model.adminAuthRefreshAPI?.jsonBody ?? ''),
                r'''$.data.access_token''',
              ).toString().toString(),
              refreshToken: getJsonField(
                (_model.adminAuthRefreshAPI?.jsonBody ?? ''),
                r'''$.data.refresh_token''',
              ).toString().toString(),
              authUid: getJsonField(
                (_model.adminAuthRefreshAPI?.jsonBody ?? ''),
                r'''$.data.admin._id''',
              ).toString().toString(),
            );
            _model.adminAssessments2API = await SpiralReportsAdminAPIGroup
                .getAllAssessmentsAdminCall
                .call(
              accessToken: currentAuthenticationToken,
            );

            if ((_model.adminAssessmentsAPI?.succeeded ?? true)) {
              FFAppState().assessmentsList =
                  SpiralReportsAdminAPIGroup.getAllAssessmentsAdminCall
                      .assessmentList(
                        (_model.adminAssessments2API?.jsonBody ?? ''),
                      )!
                      .toList()
                      .cast<dynamic>();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Please Login Again',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: Duration(milliseconds: 2000),
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Please Login Again',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              ),
            );
          }
        }
      } else {
        _model.apiResultqiq =
            await SpiralReportsAdminAPIGroup.getAllAssessmentsAdminCall.call();

        if ((_model.apiResultqiq?.succeeded ?? true)) {
          FFAppState().assessmentsList =
              SpiralReportsAdminAPIGroup.getAllAssessmentsAdminCall
                  .assessmentList(
                    (_model.apiResultqiq?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<dynamic>();
        }
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (loggedIn)
                      Container(
                        width: 56.0,
                        height: 56.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/441/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (!loggedIn)
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('email_login');
                        },
                        text: 'Login',
                        options: FFButtonOptions(
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    if (loggedIn)
                      FFButtonWidget(
                        onPressed: () async {
                          if (FFAppState().role == UserRole.User) {
                            context.pushNamed(
                              'user_dashboard_assessments',
                              queryParameters: {
                                'activeTab': serializeParam(
                                  1,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            context.pushNamed(
                              'admin_dashboard_assessments',
                              queryParameters: {
                                'activeTab': serializeParam(
                                  1,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          }
                        },
                        text: 'Console',
                        options: FFButtonOptions(
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 160.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'addLevels',
                                queryParameters: {
                                  'levels': serializeParam(
                                    3,
                                    ParamType.int,
                                  ),
                                  'title': serializeParam(
                                    'faksfsfasf',
                                    ParamType.String,
                                  ),
                                  'description': serializeParam(
                                    'asfsdfsa',
                                    ParamType.String,
                                  ),
                                  'tags': serializeParam(
                                    List.generate(
                                        random_data.randomInteger(5, 5),
                                        (index) => random_data.randomString(
                                              0,
                                              0,
                                              true,
                                              false,
                                              false,
                                            )),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'maxLevelScore': serializeParam(
                                    3,
                                    ParamType.int,
                                  ),
                                  'credRequired': serializeParam(
                                    5,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/SpiralDesk_Logo.jpg',
                                width: 250.0,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            width: 800.0,
                            constraints: BoxConstraints(
                              minHeight: 80.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 10.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 6.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          alignLabelWithHint: false,
                                          hintText: 'Search Spiral Reports',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: null,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 100.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.send_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      _model.searchResultsAPI =
                                          await SpiralReportsUserAPIGroup
                                              .searchAssessmentCall
                                              .call(
                                        query: _model.textController.text,
                                        acessToken: currentAuthenticationToken,
                                      );

                                      context.pushNamed(
                                        'search_results',
                                        queryParameters: {
                                          'searchQuery': serializeParam(
                                            _model.textController.text,
                                            ParamType.String,
                                          ),
                                          'searchResults': serializeParam(
                                            SpiralReportsUserAPIGroup
                                                .searchAssessmentCall
                                                .assessmentData(
                                              (_model.searchResultsAPI
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            ParamType.JSON,
                                            isList: true,
                                          ),
                                        }.withoutNulls,
                                      );

                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 26.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '© 2024. Spiral Reports',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
