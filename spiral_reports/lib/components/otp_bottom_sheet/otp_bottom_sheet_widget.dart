import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'otp_bottom_sheet_model.dart';
export 'otp_bottom_sheet_model.dart';

class OtpBottomSheetWidget extends StatefulWidget {
  const OtpBottomSheetWidget({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  State<OtpBottomSheetWidget> createState() => _OtpBottomSheetWidgetState();
}

class _OtpBottomSheetWidgetState extends State<OtpBottomSheetWidget> {
  late OtpBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x51FFFFFF),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 660.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(36.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 52.0,
                      height: 52.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/74/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Please check your email.',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'We have send the code to ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: valueOrDefault<String>(
                                  widget!.email,
                                  'error@spiraldesk.com',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
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
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    PinCodeTextField(
                      autoDisposeControllers: false,
                      appContext: context,
                      length: 6,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: false,
                      autoFocus: false,
                      enablePinAutofill: false,
                      errorTextSpace: 16.0,
                      showCursor: true,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      obscureText: false,
                      hintCharacter: '-',
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldHeight: 80.0,
                        fieldWidth: 80.0,
                        borderWidth: 2.0,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        shape: PinCodeFieldShape.box,
                        activeColor: FlutterFlowTheme.of(context).primaryText,
                        inactiveColor: FlutterFlowTheme.of(context).alternate,
                        selectedColor: FlutterFlowTheme.of(context).primary,
                      ),
                      controller: _model.pinCodeController,
                      onChanged: (_) {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _model.pinCodeControllerValidator
                          .asValidator(context),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: wrapWithModel(
                            model: _model.secondaryButtonModel,
                            updateCallback: () => setState(() {}),
                            child: SecondaryButtonWidget(
                              text: 'Send Code Again',
                              icon: Icon(
                                Icons.replay,
                                size: 24.0,
                              ),
                              action: () async {
                                setState(() {
                                  _model.pinCodeController?.clear();
                                });
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Verification Code Send'),
                                      content: Text(
                                          'Your verification code has been send again'),
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
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: wrapWithModel(
                            model: _model.primaryButtonModel,
                            updateCallback: () => setState(() {}),
                            child: PrimaryButtonWidget(
                              text: 'Verify Email',
                              icon: Icon(
                                Icons.verified_user,
                                size: 24.0,
                              ),
                              isActive: false,
                              action: () async {},
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Cancel Verification',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].divide(SizedBox(height: 36.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
