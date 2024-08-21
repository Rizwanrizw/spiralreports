import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'evaluation_result_bottom_sheet_model.dart';
export 'evaluation_result_bottom_sheet_model.dart';

class EvaluationResultBottomSheetWidget extends StatefulWidget {
  const EvaluationResultBottomSheetWidget({super.key});

  @override
  State<EvaluationResultBottomSheetWidget> createState() =>
      _EvaluationResultBottomSheetWidgetState();
}

class _EvaluationResultBottomSheetWidgetState
    extends State<EvaluationResultBottomSheetWidget> {
  late EvaluationResultBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EvaluationResultBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 26.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 1440.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Text(
                  'Recommendation',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Expanded(
                child: MarkdownBody(
                  data:
                      '''Based on the assessment maturity score of 55 and the points identified, it is recommended to implement the following cybersecurity products to improve the Business Continuity Management (BCM) program:\\n\\n1. Business Continuity Management (BCM) Software: Implement a comprehensive BCM software solution that can assist in documenting, tracking, and reporting BCM metrics and Key Performance Indicators (KPIs) across the organization. This will help in improving the governance and organization of the BCM program.\\n\\n2. Incident Management Tool: Consider implementing an incident management tool or software to streamline crisis escalations and incident management protocols. This will ensure that crisis management plans are consistently followed and documented.\\n\\n3. Training and Awareness Platforms: Invest in training and awareness platforms for Business Continuity and Disaster Recovery teams to enhance their skills and understanding of their roles in crisis management. This will improve the staff experience and resource count for planned BCM initiatives.\\n\\nIn terms of best practices for the existing tools used (slack, hotmail, 2fa), it is recommended to:\\n\\n1. Utilize Slack for Communication and Collaboration: Ensure that all BCM team members are using Slack effectively for communication and collaboration. Create dedicated channels for crisis management discussions, document sharing, and real-time updates during crisis situations.\\n\\n2. Secure Email Communication: Implement best practices for secure email communication using Hotmail, such as encrypting sensitive information, using strong passwords, and enabling two-factor authentication (2FA) to prevent unauthorized access to email accounts.\\n\\n3. Enhance 2FA Implementation: Review and enhance the implementation of 2FA across all relevant platforms and systems to strengthen access control and prevent unauthorized access to critical BCM-related information and tools.\\n\\nBy implementing the recommended cybersecurity products and best practices, the organization can improve its overall cybersecurity posture and enhance the maturity of its Business Continuity Management program.''',
                  selectable: true,
                  onTapLink: (_, url, __) => launchURL(url!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
