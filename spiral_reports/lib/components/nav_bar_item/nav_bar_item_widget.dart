import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_item_model.dart';
export 'nav_bar_item_model.dart';

class NavBarItemWidget extends StatefulWidget {
  const NavBarItemWidget({
    super.key,
    bool? isActive,
    String? text,
    required this.icon,
    bool? hasChevron,
    required this.action,
  })  : this.isActive = isActive ?? false,
        this.text = text ?? 'Dashboard',
        this.hasChevron = hasChevron ?? false;

  final bool isActive;
  final String text;
  final Widget? icon;
  final bool hasChevron;
  final Future Function()? action;

  @override
  State<NavBarItemWidget> createState() => _NavBarItemWidgetState();
}

class _NavBarItemWidgetState extends State<NavBarItemWidget> {
  late NavBarItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isActive = widget!.isActive;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.isActive = !_model.isActive;
        setState(() {});
        await widget.action?.call();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
        width: 280.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            _model.isActive
                ? FlutterFlowTheme.of(context).primary10
                : FlutterFlowTheme.of(context).primaryBackground,
            FlutterFlowTheme.of(context).primaryBackground,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 12.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget!.icon!,
              Expanded(
                child: Text(
                  widget!.text,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}
