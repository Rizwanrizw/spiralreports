import '/components/nav_bar_v2_widget.dart';
import '/components/sm_heading_item/sm_heading_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_results_model.dart';
export 'search_results_model.dart';

class SearchResultsWidget extends StatefulWidget {
  const SearchResultsWidget({
    super.key,
    bool? showAnimation,
    this.searchQuery,
    required this.searchResults,
  }) : this.showAnimation = showAnimation ?? false;

  final bool showAnimation;
  final String? searchQuery;
  final List<dynamic>? searchResults;

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  late SearchResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.searchQuery = widget!.searchQuery!;
      setState(() {});
    });

    _model.textController ??= TextEditingController(text: widget!.searchQuery);
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                      child: StickyHeader(
                        overlapHeaders: false,
                        header: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 18.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 900.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'Search',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.send_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                _model.searchQuery =
                                                    _model.textController.text;
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        content: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                150.0, 0.0, 150.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final searchResultList = functions
                                        .assessmentSearch(
                                            FFAppState()
                                                .assessmentsList
                                                .toList(),
                                            _model.searchQuery)
                                        ?.toList() ??
                                    [];

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:
                                      List.generate(searchResultList.length,
                                          (searchResultListIndex) {
                                    final searchResultListItem =
                                        searchResultList[searchResultListIndex];
                                    return Container(
                                      width: double.infinity,
                                      constraints: BoxConstraints(
                                        maxWidth: 1080.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'user_assessment_quiz',
                                            queryParameters: {
                                              'assessmentID': serializeParam(
                                                getJsonField(
                                                  searchResultListItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.settings_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                      Text(
                                                        'Penetration Testing',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0x281254FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  4.0,
                                                                  8.0,
                                                                  4.0),
                                                      child: Text(
                                                        'Start Now',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              height: 2.0,
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 0.0, 8.0),
                                              child: SmHeadingItemWidget(
                                                key: Key(
                                                    'Keyhuj_${searchResultListIndex}_of_${searchResultList.length}'),
                                                heading: getJsonField(
                                                  searchResultListItem,
                                                  r'''$.title''',
                                                ).toString(),
                                                subText: getJsonField(
                                                  searchResultListItem,
                                                  r'''$.description''',
                                                ).toString(),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 16.0),
                                              child: Text(
                                                getJsonField(
                                                  searchResultListItem,
                                                  r'''$.credReq''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).divide(SizedBox(height: 12.0)),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.navBarV2Model,
                updateCallback: () => setState(() {}),
                child: NavBarV2Widget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
