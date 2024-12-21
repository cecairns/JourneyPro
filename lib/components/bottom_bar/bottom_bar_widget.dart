import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bottom_bar_model.dart';
export 'bottom_bar_model.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  late BottomBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 75.0,
        decoration: const BoxDecoration(
          color: Color(0xFF727E6A),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterFlowIconButton(
              key: const ValueKey('IconButton_95iy'),
              borderColor: FlutterFlowTheme.of(context).primaryText,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 50.0,
              fillColor: const Color(0xFF62B2A4),
              icon: Icon(
                Icons.currency_exchange,
                color: FlutterFlowTheme.of(context).info,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('BOTTOM_BAR_currency_exchange_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed(
                  'CurrencyConverter',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
            ),
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primaryText,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 50.0,
              fillColor: const Color(0xFF62B2A4),
              icon: Icon(
                Icons.home,
                color: FlutterFlowTheme.of(context).info,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('BOTTOM_BAR_COMP_home_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed(
                  'Home',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
            ),
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primaryText,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 50.0,
              fillColor: const Color(0xFF62B2A4),
              icon: Icon(
                Icons.info_outline,
                color: FlutterFlowTheme.of(context).info,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('BOTTOM_BAR_COMP_info_outline_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed(
                  'Info',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
            ),
          ].divide(const SizedBox(width: 65.0)),
        ),
      ),
    );
  }
}
