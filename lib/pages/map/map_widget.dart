import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'map_model.dart';
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.tripDetails,
  });

  final TripsRecord? tripDetails;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Map'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<List<UsersRecord>>(
          stream: queryUsersRecord(
            queryBuilder: (usersRecord) => usersRecord.where(Filter.or(
              filterIn('email', widget.tripDetails?.otherUsers),
              Filter(
                'uid',
                isEqualTo: currentUserReference?.id,
              ),
            )),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<UsersRecord> containerUsersRecordList = snapshot.data!;

            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/test1_copy.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.topBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const TopBarWidget(),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Trip Team Location Map',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Container(
                              width: 350.0,
                              height: 500.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: FlutterFlowGoogleMap(
                                key: const ValueKey('GoogleMap_961i'),
                                controller: _model.googleMapsController,
                                onCameraIdle: (latLng) =>
                                    _model.googleMapsCenter = latLng,
                                initialLocation: _model.googleMapsCenter ??=
                                    const LatLng(0.0, 0.0),
                                markers: containerUsersRecordList
                                    .map(
                                      (marker) => FlutterFlowMarker(
                                        marker.reference.path,
                                        marker.location!,
                                      ),
                                    )
                                    .toList(),
                                markerColor: GoogleMarkerColor.violet,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.standard,
                                initialZoom: 0.0,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: true,
                                showLocation: true,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: true,
                              ),
                            ),
                          ]
                              .divide(const SizedBox(height: 20.0))
                              .around(const SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.bottomBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const BottomBarWidget(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
