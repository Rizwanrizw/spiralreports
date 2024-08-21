import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/h1_heading_group/h1_heading_group_widget.dart';
import '/components/label_text_field/label_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_login_model.dart';
export 'admin_login_model.dart';

class AdminLoginWidget extends StatefulWidget {
  const AdminLoginWidget({super.key});

  @override
  State<AdminLoginWidget> createState() => _AdminLoginWidgetState();
}

class _AdminLoginWidgetState extends State<AdminLoginWidget> {
  late AdminLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminLoginModel());

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
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/SpiralDesk_Logo.jpg',
                          height: 60.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 600.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 66.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.h1HeadingGroupModel,
                                      updateCallback: () => setState(() {}),
                                      child: H1HeadingGroupWidget(
                                        heading: 'Admin Login',
                                        subText:
                                            'Welcome back! Please enter your details.',
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: wrapWithModel(
                                            model: _model.emailModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: LabelTextFieldWidget(
                                              hintText: 'name@company.com',
                                              initialValue:
                                                  'admin@spiralreports.com',
                                              isReadOnly: false,
                                              label: 'Email',
                                              isPassword: false,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: wrapWithModel(
                                            model: _model.passwordModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: LabelTextFieldWidget(
                                              hintText:
                                                  'My Strong Secret Password',
                                              isReadOnly: false,
                                              label: 'Password',
                                              isPassword: true,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: ((/* NOT RECOMMENDED */ _model
                                                          .emailModel
                                                          .smallTextFieldModel
                                                          .textController
                                                          .text ==
                                                      'true') &&
                                                  (/* NOT RECOMMENDED */ _model
                                                          .passwordModel
                                                          .smallTextFieldModel
                                                          .textController
                                                          .text ==
                                                      'true'))
                                              ? null
                                              : () async {
                                                  Function() _navigate = () {};
                                                  if ((_model
                                                                  .emailModel
                                                                  .smallTextFieldModel
                                                                  .textController
                                                                  .text !=
                                                              null &&
                                                          _model
                                                                  .emailModel
                                                                  .smallTextFieldModel
                                                                  .textController
                                                                  .text !=
                                                              '') &&
                                                      (_model
                                                                  .passwordModel
                                                                  .smallTextFieldModel
                                                                  .textController
                                                                  .text !=
                                                              null &&
                                                          _model
                                                                  .passwordModel
                                                                  .smallTextFieldModel
                                                                  .textController
                                                                  .text !=
                                                              '')) {
                                                    if (functions
                                                        .workEmailCheck(_model
                                                            .emailModel
                                                            .smallTextFieldModel
                                                            .textController
                                                            .text)) {
                                                      // User Login
                                                      _model.adminLoginAPI =
                                                          await SpiralReportsAdminAPIGroup
                                                              .adminLoginCall
                                                              .call(
                                                        username: _model
                                                            .emailModel
                                                            .smallTextFieldModel
                                                            .textController
                                                            .text,
                                                        password: _model
                                                            .passwordModel
                                                            .smallTextFieldModel
                                                            .textController
                                                            .text,
                                                      );

                                                      if ((_model.adminLoginAPI
                                                              ?.succeeded ??
                                                          true)) {
                                                        GoRouter.of(context)
                                                            .prepareAuthEvent();
                                                        await authManager
                                                            .signIn(
                                                          authenticationToken:
                                                              SpiralReportsAdminAPIGroup
                                                                  .adminLoginCall
                                                                  .accessToken(
                                                            (_model.adminLoginAPI
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          refreshToken:
                                                              SpiralReportsAdminAPIGroup
                                                                  .adminLoginCall
                                                                  .refreshToken(
                                                            (_model.adminLoginAPI
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          authUid:
                                                              SpiralReportsAdminAPIGroup
                                                                  .adminLoginCall
                                                                  .userID(
                                                            (_model.adminLoginAPI
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                        );
                                                        _navigate = () =>
                                                            context.goNamedAuth(
                                                                'entry',
                                                                context
                                                                    .mounted);
                                                        FFAppState()
                                                            .updateUserStruct(
                                                          (e) => e
                                                            ..userID =
                                                                SpiralReportsAdminAPIGroup
                                                                    .adminLoginCall
                                                                    .userID(
                                                              (_model.adminLoginAPI
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ..firstName =
                                                                SpiralReportsAdminAPIGroup
                                                                    .adminLoginCall
                                                                    .firstName(
                                                              (_model.adminLoginAPI
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ..middleName =
                                                                getJsonField(
                                                              (_model.adminLoginAPI
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.middleName''',
                                                            ).toString()
                                                            ..lastName =
                                                                SpiralReportsAdminAPIGroup
                                                                    .adminLoginCall
                                                                    .lastName(
                                                              (_model.adminLoginAPI
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ..email =
                                                                SpiralReportsAdminAPIGroup
                                                                    .adminLoginCall
                                                                    .email(
                                                              (_model.adminLoginAPI
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ..phoneNumber =
                                                                SpiralReportsAdminAPIGroup
                                                                    .adminLoginCall
                                                                    .phoneNumber(
                                                              (_model.adminLoginAPI
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ..country =
                                                                SpiralReportsAdminAPIGroup
                                                                    .adminLoginCall
                                                                    .country(
                                                              (_model.adminLoginAPI
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                            ..credits =
                                                                getJsonField(
                                                              (_model.adminLoginAPI
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.credits''',
                                                            ),
                                                        );
                                                        FFAppState().role =
                                                            UserRole.Admin;
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Login Failed'),
                                                              content: Text(
                                                                  '${getJsonField(
                                                                (_model.adminLoginAPI
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString()}. Please try again'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        // Clear Text Fields
                                                        setState(() {
                                                          _model
                                                              .emailModel
                                                              .smallTextFieldModel
                                                              .textController
                                                              ?.clear();
                                                          _model
                                                              .passwordModel
                                                              .smallTextFieldModel
                                                              .textController
                                                              ?.clear();
                                                        });
                                                      }
                                                    } else {
                                                      // Alert
                                                      unawaited(
                                                        () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Only Work Email Allowed'),
                                                                content: Text(
                                                                    'Please only enter your work email'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }(),
                                                      );
                                                      // Clear Text Fields
                                                      setState(() {
                                                        _model
                                                            .emailModel
                                                            .smallTextFieldModel
                                                            .textController
                                                            ?.clear();
                                                        _model
                                                            .passwordModel
                                                            .smallTextFieldModel
                                                            .textController
                                                            ?.clear();
                                                      });
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Please fill in all the text fields',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
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
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                      ),
                                                    );
                                                  }

                                                  _navigate();

                                                  setState(() {});
                                                },
                                          text: 'Login to Spiral Reports',
                                          icon: Icon(
                                            Icons.login_rounded,
                                            size: 24.0,
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
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            disabledColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 32.0)),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('email_login');
                                      },
                                      text: 'User Login',
                                      options: FFButtonOptions(
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 32.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '© SprialDesk 2024',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.network(
                  'https://picsum.photos/seed/550/600',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
