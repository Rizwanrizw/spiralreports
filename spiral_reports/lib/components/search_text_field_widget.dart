import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_text_field_model.dart';
export 'search_text_field_model.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({
    super.key,
    this.initialValue,
    required this.searchAction,
  });

  final String? initialValue;
  final Future Function(String searchQuery)? searchAction;

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  late SearchTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchTextFieldModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      constraints: BoxConstraints(
        minHeight: 80.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(200.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 2000),
                  () async {
                    _model.query = _model.textController.text;
                    setState(() {});
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  alignLabelWithHint: false,
                  hintText: 'Search Spiral Reports',
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                textAlign: TextAlign.start,
                maxLines: null,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 100.0,
              buttonSize: 50.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.send_rounded,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
        ),
      ),
    );
  }
}
