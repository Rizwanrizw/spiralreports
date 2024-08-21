import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'assessments_data_table_model.dart';
export 'assessments_data_table_model.dart';

class AssessmentsDataTableWidget extends StatefulWidget {
  const AssessmentsDataTableWidget({
    super.key,
    required this.assessmentList,
    required this.deleteAction,
  });

  final List<dynamic>? assessmentList;
  final Future Function(String itemID)? deleteAction;

  @override
  State<AssessmentsDataTableWidget> createState() =>
      _AssessmentsDataTableWidgetState();
}

class _AssessmentsDataTableWidgetState
    extends State<AssessmentsDataTableWidget> {
  late AssessmentsDataTableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssessmentsDataTableModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Builder(
        builder: (context) {
          final assessments = widget!.assessmentList!.toList();
          if (assessments.isEmpty) {
            return Image.asset(
              'https://img.freepik.com/free-vector/completed-steps-concept-illustration_114360-5441.jpg?w=1480&t=st=1715957990~exp=1715958590~hmac=62e60ab9dbaa88a3e1b2bd62ca42d3bb32ba4d501b0cb1f6caac0e56c8d5c03d',
              width: 800.0,
            );
          }

          return FlutterFlowDataTable<dynamic>(
            controller: _model.paginatedDataTableController,
            data: assessments,
            columnsBuilder: (onSortChanged) => [
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Name',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Company',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Tags',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Status',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    ' ',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
            dataRowBuilder: (assessmentsItem, assessmentsIndex, selected,
                    onSelectChanged) =>
                DataRow(
              color: MaterialStateProperty.all(
                assessmentsIndex % 2 == 0
                    ? FlutterFlowTheme.of(context).secondaryBackground
                    : Color(0xFFF9FAFB),
              ),
              cells: [
                Text(
                  getJsonField(
                    assessmentsItem,
                    r'''$.title''',
                  ).toString(),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 36.0,
                      height: 36.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/482/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Edit Column 2',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Builder(
                  builder: (context) {
                    final tags = getJsonField(
                      assessmentsItem,
                      r'''$.tags''',
                    ).toList();

                    return Wrap(
                      spacing: 4.0,
                      runSpacing: 4.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(tags.length, (tagsIndex) {
                        final tagsItem = tags[tagsIndex];
                        return Text(
                          tagsItem.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        );
                      }),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary10,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    child: Text(
                      getJsonField(
                        assessmentsItem,
                        r'''$.status''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.edit,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 26.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'assessment_detail',
                            queryParameters: {
                              'assessmentID': serializeParam(
                                getJsonField(
                                  assessmentsItem,
                                  r'''$._id''',
                                ).toString(),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.delete,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 26.0,
                        ),
                        onPressed: () async {
                          await widget.deleteAction?.call(
                            getJsonField(
                              assessmentsItem,
                              r'''$._id''',
                            ).toString(),
                          );
                        },
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
              ].map((c) => DataCell(c)).toList(),
            ),
            emptyBuilder: () => Image.asset(
              'https://img.freepik.com/free-vector/completed-steps-concept-illustration_114360-5441.jpg?w=1480&t=st=1715957990~exp=1715958590~hmac=62e60ab9dbaa88a3e1b2bd62ca42d3bb32ba4d501b0cb1f6caac0e56c8d5c03d',
              width: 800.0,
            ),
            paginated: true,
            selectable: false,
            hidePaginator: false,
            showFirstLastButtons: false,
            width: double.infinity,
            height: double.infinity,
            headingRowHeight: 48.0,
            dataRowHeight: 72.0,
            columnSpacing: 20.0,
            headingRowColor: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            addHorizontalDivider: true,
            addTopAndBottomDivider: true,
            hideDefaultHorizontalDivider: true,
            horizontalDividerColor: FlutterFlowTheme.of(context).alternate,
            horizontalDividerThickness: 1.0,
            addVerticalDivider: false,
          );
        },
      ),
    );
  }
}
