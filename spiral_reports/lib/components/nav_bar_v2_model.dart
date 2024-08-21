import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_page_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nav_bar_v2_widget.dart' show NavBarV2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarV2Model extends FlutterFlowModel<NavBarV2Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for navPageItem component.
  late NavPageItemModel navPageItemModel1;
  // Model for navPageItem component.
  late NavPageItemModel navPageItemModel2;
  // Model for navPageItem component.
  late NavPageItemModel navPageItemModel3;

  @override
  void initState(BuildContext context) {
    navPageItemModel1 = createModel(context, () => NavPageItemModel());
    navPageItemModel2 = createModel(context, () => NavPageItemModel());
    navPageItemModel3 = createModel(context, () => NavPageItemModel());
  }

  @override
  void dispose() {
    navPageItemModel1.dispose();
    navPageItemModel2.dispose();
    navPageItemModel3.dispose();
  }
}
