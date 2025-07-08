import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'trips_model.dart';
export 'trips_model.dart';

/// This is the list associated with a user and the trips
class TripsWidget extends StatefulWidget {
  const TripsWidget({
    super.key,
    required this.triptxt,
  });

  final TripsRecord? triptxt;

  @override
  State<TripsWidget> createState() => _TripsWidgetState();
}

class _TripsWidgetState extends State<TripsWidget> {
  late TripsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FFButtonWidget(
          onPressed: () async {
            logFirebaseEvent('TRIPS_COMP_TRIPS_BTN_ON_TAP');
            logFirebaseEvent('Button_navigate_to');

            context.pushNamed(
              TripCardWidget.routeName,
              queryParameters: {
                'tripDetails': serializeParam(
                  widget.triptxt,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'tripDetails': widget.triptxt,
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          },
          text: widget.triptxt!.address,
          options: FFButtonOptions(
            width: 350.0,
            height: 50.0,
            padding: EdgeInsets.all(15.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
            elevation: 0.0,
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ],
    );
  }
}
