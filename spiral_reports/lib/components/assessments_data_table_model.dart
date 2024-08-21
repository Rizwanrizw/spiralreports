import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'assessments_data_table_widget.dart' show AssessmentsDataTableWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AssessmentsDataTableModel
    extends FlutterFlowModel<AssessmentsDataTableWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
