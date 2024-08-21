import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'assessment_detail_page_model.dart';
export 'assessment_detail_page_model.dart';

class AssessmentDetailPageWidget extends StatefulWidget {
  const AssessmentDetailPageWidget({
    super.key,
    this.showAnimation,
    required this.assessmentID,
  });

  final bool? showAnimation;
  final String? assessmentID;

  @override
  State<AssessmentDetailPageWidget> createState() =>
      _AssessmentDetailPageWidgetState();
}

class _AssessmentDetailPageWidgetState
    extends State<AssessmentDetailPageWidget> {
  late AssessmentDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssessmentDetailPageModel());

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
      ),
    );
  }
}
