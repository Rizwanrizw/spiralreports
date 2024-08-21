import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'level_option_list_item_model.dart';
export 'level_option_list_item_model.dart';

class LevelOptionListItemWidget extends StatefulWidget {
  const LevelOptionListItemWidget({
    super.key,
    required this.levelNumber,
    required this.addOptionCallback,
    required this.options,
  });

  final int? levelNumber;
  final Future Function()? addOptionCallback;
  final List<OptionsStruct>? options;

  @override
  State<LevelOptionListItemWidget> createState() =>
      _LevelOptionListItemWidgetState();
}

class _LevelOptionListItemWidgetState extends State<LevelOptionListItemWidget> {
  late LevelOptionListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LevelOptionListItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.0,
      height: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StickyHeader(
                  overlapHeaders: false,
                  header: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFEBF0F8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Level ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget!.levelNumber?.toString(),
                                    '1',
                                  ),
                                  style: TextStyle(),
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
                        ),
                      ),
                    ),
                  ),
                  content: Builder(
                    builder: (context) {
                      final optionList = widget!.options!.toList();

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(optionList.length, (optionListIndex) {
                          final optionListItem = optionList[optionListIndex];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary10,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0x341254FF),
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  optionListItem.text,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ),
                          );
                        }).divide(SizedBox(height: 16.0)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget.addOptionCallback?.call();
                },
                text: 'Add Option',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFEBF0F8),
                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
