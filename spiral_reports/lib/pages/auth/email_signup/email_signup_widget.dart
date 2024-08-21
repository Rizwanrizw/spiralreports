import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/label_text_field/label_text_field_widget.dart';
import '/components/small_text_field/small_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_signup_model.dart';
export 'email_signup_model.dart';

class EmailSignupWidget extends StatefulWidget {
  const EmailSignupWidget({super.key});

  @override
  State<EmailSignupWidget> createState() => _EmailSignupWidgetState();
}

class _EmailSignupWidgetState extends State<EmailSignupWidget> {
  late EmailSignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailSignupModel());

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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 620.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/launcher_icon.jpg',
                          width: 92.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 500.0,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Create Account',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      'Start your security journey.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.emailTextFieldModel,
                                      updateCallback: () => setState(() {}),
                                      child: SmallTextFieldWidget(
                                        hintText: 'Enter Your Email',
                                        isReadOnly: false,
                                        isPassword: false,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.emailTextFieldModel
                                                    .textController.text !=
                                                null &&
                                            _model.emailTextFieldModel
                                                    .textController.text !=
                                                '') {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Please add email'),
                                                        content: Text(
                                                            'Please fill in your work email  to get started'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('Okay'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                        }
                                      },
                                      text: 'Get Started',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('entry');
                                      },
                                      text: 'Back To Home',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lets Know More About You',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 32.0),
                                    child: Text(
                                      'Start your security journey.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.firstNameModel,
                                      updateCallback: () => setState(() {}),
                                      child: LabelTextFieldWidget(
                                        hintText: 'Jack',
                                        isReadOnly: false,
                                        label: 'First Name',
                                        isPassword: false,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.middleNameModel,
                                      updateCallback: () => setState(() {}),
                                      child: LabelTextFieldWidget(
                                        hintText: 'Jack',
                                        isReadOnly: false,
                                        label: 'Middle Name',
                                        isPassword: false,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.lastNameModel,
                                      updateCallback: () => setState(() {}),
                                      child: LabelTextFieldWidget(
                                        hintText: 'Jack',
                                        isReadOnly: false,
                                        label: 'Last Name',
                                        isPassword: false,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if ((_model
                                                        .firstNameModel
                                                        .smallTextFieldModel
                                                        .textController
                                                        .text !=
                                                    null &&
                                                _model
                                                        .firstNameModel
                                                        .smallTextFieldModel
                                                        .textController
                                                        .text !=
                                                    '') &&
                                            (_model
                                                        .lastNameModel
                                                        .smallTextFieldModel
                                                        .textController
                                                        .text !=
                                                    null &&
                                                _model
                                                        .lastNameModel
                                                        .smallTextFieldModel
                                                        .textController
                                                        .text !=
                                                    '')) {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Please Enter Name'),
                                                        content: Text(
                                                            'First and Last name is required'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('Okay'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('entry');
                                      },
                                      text: 'Back To Home',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lets Know More About You',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 32.0),
                                    child: Text(
                                      'Start your security journey.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.phoneNumberModel,
                                    updateCallback: () => setState(() {}),
                                    child: LabelTextFieldWidget(
                                      hintText: '91791263826',
                                      isReadOnly: false,
                                      label: 'Phone Number',
                                      isPassword: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if ((_model
                                                        .firstNameModel
                                                        .smallTextFieldModel
                                                        .textController
                                                        .text !=
                                                    null &&
                                                _model
                                                        .firstNameModel
                                                        .smallTextFieldModel
                                                        .textController
                                                        .text !=
                                                    '') &&
                                            (_model
                                                        .lastNameModel
                                                        .smallTextFieldModel
                                                        .textController
                                                        .text !=
                                                    null &&
                                                _model
                                                        .lastNameModel
                                                        .smallTextFieldModel
                                                        .textController
                                                        .text !=
                                                    '')) {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Please Enter Name'),
                                                        content: Text(
                                                            'First and Last name is required'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('Okay'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await _model.pageViewController
                                            ?.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      text: 'Go Back',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Enter Password',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.passwordTextFieldModel,
                                    updateCallback: () => setState(() {}),
                                    child: SmallTextFieldWidget(
                                      initialValue: 'My Password',
                                      hintText: 'Enter Your Password',
                                      isReadOnly: false,
                                      isPassword: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.passwordConfirmationModel,
                                    updateCallback: () => setState(() {}),
                                    child: SmallTextFieldWidget(
                                      initialValue: 'Confirm Password',
                                      hintText: 'Confirm Your Password',
                                      isReadOnly: false,
                                      isPassword: true,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 36.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: ((_model.passwordTextFieldModel
                                                        .textController.text !=
                                                    null &&
                                                _model.passwordTextFieldModel
                                                        .textController.text !=
                                                    '') &&
                                            (_model.passwordConfirmationModel
                                                        .textController.text !=
                                                    null &&
                                                _model.passwordConfirmationModel
                                                        .textController.text !=
                                                    ''))
                                        ? null
                                        : () async {
                                            Function() _navigate = () {};
                                            if (_model.passwordTextFieldModel
                                                    .textController.text ==
                                                _model.passwordConfirmationModel
                                                    .textController.text) {
                                              _model.userCreateAPI =
                                                  await SpiralReportsUserAPIGroup
                                                      .userSignupCall
                                                      .call(
                                                firstName: _model
                                                    .firstNameModel
                                                    .smallTextFieldModel
                                                    .textController
                                                    .text,
                                                middleName: _model
                                                    .middleNameModel
                                                    .smallTextFieldModel
                                                    .textController
                                                    .text,
                                                lastName: _model
                                                    .lastNameModel
                                                    .smallTextFieldModel
                                                    .textController
                                                    .text,
                                                email: _model
                                                    .emailTextFieldModel
                                                    .textController
                                                    .text,
                                                country: 'IN',
                                                phone: int.tryParse(_model
                                                    .phoneNumberModel
                                                    .smallTextFieldModel
                                                    .textController
                                                    .text),
                                                password: _model
                                                    .passwordTextFieldModel
                                                    .textController
                                                    .text,
                                              );

                                              if ((_model.userCreateAPI
                                                      ?.succeeded ??
                                                  true)) {
                                                GoRouter.of(context)
                                                    .prepareAuthEvent();
                                                await authManager.signIn(
                                                  authenticationToken:
                                                      SpiralReportsUserAPIGroup
                                                          .userSignupCall
                                                          .accessToken(
                                                    (_model.userCreateAPI
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  refreshToken:
                                                      SpiralReportsUserAPIGroup
                                                          .userSignupCall
                                                          .refreshToken(
                                                    (_model.userCreateAPI
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                );
                                                _navigate = () =>
                                                    context.goNamedAuth('entry',
                                                        context.mounted);
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Failed to create user'),
                                                      content: Text(
                                                          'Failed to create user'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            } else {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Password Does not match'),
                                                            content: Text(
                                                                'Please type in the same password'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Okay'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                            }

                                            _navigate();

                                            setState(() {});
                                          },
                                    text: 'Create Account',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                      disabledColor:
                                          FlutterFlowTheme.of(context).accent1,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 28.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await _model.pageViewController
                                          ?.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Go Back',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
