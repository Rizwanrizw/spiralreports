import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_page_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_v2_model.dart';
export 'nav_bar_v2_model.dart';

class NavBarV2Widget extends StatefulWidget {
  const NavBarV2Widget({
    super.key,
    int? activePage,
  }) : this.activePage = activePage ?? 1;

  final int activePage;

  @override
  State<NavBarV2Widget> createState() => _NavBarV2WidgetState();
}

class _NavBarV2WidgetState extends State<NavBarV2Widget> {
  late NavBarV2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarV2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 72.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 1280.0,
        ),
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://image.pitchbook.com/43lYaPQkrznr3r2FUTljAq3mISp1642755361726_200x200',
                      width: 160.0,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (FFAppState().role == UserRole.User) {
                        context.pushNamed(
                          'user_dashboard_assessments',
                          queryParameters: {
                            'activeTab': serializeParam(
                              1,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        context.pushNamed(
                          'admin_dashboard_assessments',
                          queryParameters: {
                            'activeTab': serializeParam(
                              1,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    child: wrapWithModel(
                      model: _model.navPageItemModel1,
                      updateCallback: () => setState(() {}),
                      child: NavPageItemWidget(
                        text: 'Asssesments',
                        isActive: widget!.activePage == 1,
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (FFAppState().role == UserRole.User) {
                        context.pushNamed(
                          'user_dashboard_evaluations',
                          queryParameters: {
                            'activeTab': serializeParam(
                              2,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        context.pushNamed(
                          'admin_dashboard_evaluations',
                          queryParameters: {
                            'activeTab': serializeParam(
                              2,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    child: wrapWithModel(
                      model: _model.navPageItemModel2,
                      updateCallback: () => setState(() {}),
                      child: NavPageItemWidget(
                        text: 'Evaluations',
                        isActive: widget!.activePage == 2,
                      ),
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 4.0))
                    .addToStart(SizedBox(width: 12.0)),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.navPageItemModel3,
                  updateCallback: () => setState(() {}),
                  child: NavPageItemWidget(
                    text:
                        '${FFAppState().user.credits.toString()} Credits Left',
                    isActive: true,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 6.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.search_sharp,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('entry');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 6.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.settings,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 6.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.notifications_active,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/453/600',
                    fit: BoxFit.cover,
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 6.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.login_sharp,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('entry', context.mounted);
                  },
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
