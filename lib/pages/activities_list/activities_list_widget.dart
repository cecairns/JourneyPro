import '/backend/backend.dart';
import '/components/bottom_bar/bottom_bar_widget.dart';
import '/components/todo/todo_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'activities_list_model.dart';
export 'activities_list_model.dart';

class ActivitiesListWidget extends StatefulWidget {
  const ActivitiesListWidget({
    super.key,
    required this.trips,
  });

  final TripsRecord? trips;

  @override
  State<ActivitiesListWidget> createState() => _ActivitiesListWidgetState();
}

class _ActivitiesListWidgetState extends State<ActivitiesListWidget> {
  late ActivitiesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivitiesListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ActivitiesList'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
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
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Activites',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        FlutterFlowCalendar(
                          color: FlutterFlowTheme.of(context).primary,
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          weekFormat: false,
                          weekStartsMonday: false,
                          initialDate: widget.trips?.startDate,
                          rowHeight: 48.0,
                          onChange: (DateTimeRange? newSelectedDate) {
                            safeSetState(() =>
                                _model.calendarSelectedDay = newSelectedDate);
                          },
                          titleStyle:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          dayOfWeekStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          dateStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          selectedDateStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                          inactiveDateStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          'Activities by Day',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        StreamBuilder<List<ActivitiesRecord>>(
                          stream: queryActivitiesRecord(
                            parent: widget.trips?.reference,
                            queryBuilder: (activitiesRecord) =>
                                activitiesRecord.where(
                              'date',
                              isEqualTo: _model.calendarSelectedDay?.start,
                            ),
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
                            List<ActivitiesRecord>
                                listViewActivitiesRecordList = snapshot.data!;
                            if (listViewActivitiesRecordList.isEmpty) {
                              return Image.asset(
                                'assets/images/Nothing_here_yet_(1).png',
                                width: 350.0,
                                height: 300.0,
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewActivitiesRecordList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 20.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewActivitiesRecord =
                                    listViewActivitiesRecordList[listViewIndex];
                                return SizedBox(
                                  width: 350.0,
                                  child: TodoWidget(
                                    key: Key(
                                        'Keyag9_${listViewIndex}_of_${listViewActivitiesRecordList.length}'),
                                    trips: listViewActivitiesRecord,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Text(
                          'All Activities:',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        StreamBuilder<List<ActivitiesRecord>>(
                          stream: queryActivitiesRecord(
                            parent: widget.trips?.reference,
                            queryBuilder: (activitiesRecord) =>
                                activitiesRecord.orderBy('date'),
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
                            List<ActivitiesRecord>
                                listViewActivitiesRecordList = snapshot.data!;
                            if (listViewActivitiesRecordList.isEmpty) {
                              return Image.asset(
                                'assets/images/Nothing_here_yet_(1).png',
                                width: 350.0,
                                height: 300.0,
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewActivitiesRecordList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 20.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewActivitiesRecord =
                                    listViewActivitiesRecordList[listViewIndex];
                                return SizedBox(
                                  width: 350.0,
                                  child: TodoWidget(
                                    key: Key(
                                        'Key0i2_${listViewIndex}_of_${listViewActivitiesRecordList.length}'),
                                    trips: listViewActivitiesRecord,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ACTIVITIES_LIST_ADD_NEW_ACTIVITY_BTN_ON_');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'AddActivity',
                              queryParameters: {
                                'trips': serializeParam(
                                  widget.trips,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'trips': widget.trips,
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          text: 'Add New Activity',
                          options: FFButtonOptions(
                            width: 350.0,
                            height: 50.0,
                            padding: const EdgeInsets.all(15.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
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
        ),
      ),
    );
  }
}
